using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using IceBear.Data.EF;
using IceBear.UI.MVC.Models;
using Microsoft.AspNet.Identity;

namespace IceBear.UI.MVC.Controllers
{
    [Authorize(Roles = "Admin")]
    public class LessonsController : Controller
    {
        private IceBearLMSEntities db = new IceBearLMSEntities();
        [Authorize(Roles = "Admin,Manager, Employee")]
        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Cours);
            return View(lessons.ToList());
        }
        [Authorize(Roles = "Admin,Manager, Employee")]
        // GET: Lessons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }

            #region LessonView
            //Get Current UserID (from Logged In User)
            string currentUserID = User.Identity.GetUserId();

            //Need to create a LessonView object
            //See what lessons have been viewed
            var lessonsViewed = db.LessonViews.Where(x => x.UserId == currentUserID);

            //holding variable for has viewed
            bool HasViewed = false;

            //loop lessons viewed and check to see if THIS lesson is in that list
            foreach (var lsn in lessonsViewed)
            {
                if ((int)id == lsn.LessonId)
                {
                    HasViewed = true;
                }
            }

            //if this Lesson HAS NOT BEEN Viewed - Create the lessonView Object
            if (!HasViewed)
            {
                //create the LessonView Object and save it.
                LessonView lv = new LessonView()
                {
                    UserId = currentUserID,
                    LessonId = (int)id,
                    DateViewed = DateTime.Now
                };
                //add the record to EF
                db.LessonViews.Add(lv);
                //persist to DB
                db.SaveChanges();
            }
            #endregion

            #region Course Completion
            //check for course completion
            //Find Current Course
            Cours course = db.Courses.Find(lesson.CourseId);

            //int for a number of lessons associated to that course
            int nbrLessons = db.Lessons.Where(x => x.CourseId == lesson.CourseId).Count();

            //collection of lessonIDs from that course
            var lessonIds = db.Lessons.Where(x => x.CourseId == lesson.CourseId).Select(x => x.LessonId);
            //------------------------------------------------------------------------------------------------
            //declare and assign to zero an int for numberOfUserLessons
            int nbrUserLessons = 0;

            //loop through the lessonViews for Only the current logged in User
            //foreach (var user in lessonsViewed)
            foreach (var lv in db.LessonViews.Where(x => x.UserId == currentUserID))
            {
                //nested loop to pull ONLY LessonIds that match the LessonID result for this  course (above query)

                foreach (var lid in lessonIds)
                {
                    //if (user.UserId == currentUserID)
                    //increase numberOfUserLessons by one
                    if (lv.LessonId == lid)
                    {
                        //nbrUserLessons += 1;
                        nbrUserLessons++;
                    }
                }
            }
            //--------------------------------------------------------------------------------------------------------
            //see if emp has already completed the course
            //declare boolean value for hasCompletedCourse
            bool hasCompletedCourse = false;

            //get completions for this user
            var completions = db.CourseCompletions.Where(x => x.UserId == currentUserID);

            //loop thorough completions compare course id to this lesson course iD, if equal set bool to true
            foreach (var c in completions)
            {
                //If user has complted all lessons in the course, create a record for course completions
                if (c.CourseId == lesson.CourseId)
                {
                    hasCompletedCourse = true;
                }
            }
            //if user has watched all lessons in a course and the course completion has not been created, create the courseCompletion object
            if (nbrUserLessons == nbrLessons && !hasCompletedCourse)
            {
                //Create the corse completion object - save to EF and Save to the DB
                CourseCompletion cc = new CourseCompletion()
                {
                    UserId = currentUserID,
                    CourseId = (int)id,
                    DateCompleted = DateTime.Now
                };
                //add the record to EF
                db.CourseCompletions.Add(cc);
                //persist to DB
                db.SaveChanges();
                //email manager. - use same logic from Contact[HtptPost]
                ContactViewModel cvm = new ContactViewModel();
                if (ModelState.IsValid)
                {
                    string body = $"{cvm.Name} has sent you the following message: <br/>" + $"{cvm.Message} <strong>from the email address:</strong>{cvm.Email}";
                    MailMessage msg = new MailMessage("Admin@kathrynrosella.com", "Hudginskr@outlook.com", cvm.Subject, body);
                    msg.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient("mail.kathrynrosella.com");
                    client.Credentials = new NetworkCredential("Admin@kathrynrosella.com", "Ax9401Lackey**");
                    try
                    {
                        client.Send(msg);
                    }
                    catch (Exception Ex)
                    {
                        ViewBag.SendEmailError = $"Attempt to send message has failed. Details: {Ex.Message}";
                        ViewBag.Message = Ex.StackTrace;
                    }
                    return View(cvm);

                }
            }
            #endregion
            return View(lesson);
        }

        // GET: Lessons/Create
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase Introduction, HttpPostedFileBase PdfFileName)
        {
            if (ModelState.IsValid)
            {

                #region File Upload
                string imgName = "noImage.jpg";
                if (Introduction != null)
                {
                    imgName = Introduction.FileName;
                    string ext = imgName.Substring(imgName.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".gif", ".png" };
                    if (goodExts.Contains(ext.ToLower()) && (Introduction.ContentLength <= 4194304))
                    {
                        imgName = Guid.NewGuid() + ext;
                        Introduction.SaveAs(Server.MapPath("~/Content/assets/img/into/" + imgName));
                    }
                    else
                    {
                        imgName = "noImage.jpg";
                    }
                }
                lesson.Introduction = imgName;
                #endregion

                #region File Upload
                if (PdfFileName != null)
                {
                    imgName = PdfFileName.FileName;
                    string ext = imgName.Substring(imgName.LastIndexOf('.'));
                    string goodExts = (".pdf");
                    if (goodExts.Contains(ext.ToLower()) && (Introduction.ContentLength <= 4194304))
                    {
                        imgName = Guid.NewGuid() + ext;
                        PdfFileName.SaveAs(Server.MapPath("~/Content/assets/img/pdf/" + imgName));
                    }
                    else
                    {
                        imgName = "noImage.jpg";
                    }
                }
                lesson.PdfFileName = imgName;
                #endregion
                if (lesson.VideoURL.Contains("/watch"))
                {
                    lesson.VideoURL = lesson.VideoURL.Replace("/watch?v=", "/embed/");
                }

                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");

            }

            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);

            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase Introduction, HttpPostedFileBase PdfFileName)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                if (Introduction != null)
                {
                    string imgName = Introduction.FileName;
                    string ext = imgName.Substring(imgName.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".gif", ".png" };
                    if (goodExts.Contains(ext.ToLower()) && (Introduction.ContentLength <= 4194304))
                    {
                        imgName = Guid.NewGuid() + ext;
                        Introduction.SaveAs(Server.MapPath("~/Content/assets/img/into/" + imgName));
                        if (lesson.Introduction != "noImage.jpg" && lesson.Introduction != null)
                        {
                            //Delete the previously associated image from the website
                            System.IO.File.Delete(Server.MapPath("~/Content/assets/img/into/" + lesson.Introduction));
                        }

                    }
                    lesson.Introduction = imgName;
                }
                #endregion

                #region File Upload
                if (PdfFileName != null)
                {
                    string imgName = PdfFileName.FileName;
                    string ext = imgName.Substring(imgName.LastIndexOf('.'));
                    string goodExts = (".pdf");
                    if (goodExts.Contains(ext.ToLower()) && (Introduction.ContentLength <= 4194304))
                    {
                        imgName = Guid.NewGuid() + ext;
                        PdfFileName.SaveAs(Server.MapPath("~/Content/assets/img/pdf/" + imgName));
                    }
                    if (lesson.PdfFileName != "noImage.jpg" && lesson.PdfFileName != null)
                    {
                        //Delete the previously associated image from the website
                        System.IO.File.Delete(Server.MapPath("~/Content/assets/img/pdf/" + lesson.Introduction));
                    }
                    lesson.PdfFileName = imgName;
                }
                #endregion

                if (lesson.VideoURL.Contains("/watch"))
                {
                    lesson.VideoURL = lesson.VideoURL.Replace("/watch?v=", "/embed/");
                }

                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);

            if (lesson.Introduction != null && lesson.Introduction != "noImage.jpg")
            {
                System.IO.File.Delete(Server.MapPath("~/Content/assets/img/into/" + Session["currentImage"].ToString()));
            }


            db.Lessons.Remove(lesson);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
