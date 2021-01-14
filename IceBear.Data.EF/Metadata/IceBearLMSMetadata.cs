using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IceBear.Data.EF
{

    #region Cours
    public class CoursMetadata
    {
        //public int CourseId { get; set; }
        [Required(ErrorMessage = "* Course Name is Required *")]
        [Display(Name = "Course")]
        [StringLength(200, ErrorMessage = "* Course Name must be 200 Characters or Less *")]
        public string CourseName { get; set; }

        [Display(Name = "Description")]
        [StringLength(4000, ErrorMessage = "* Discription must be 4000 Characters or Less *")]
        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        public string CourseDescription { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }
    [MetadataType(typeof(CoursMetadata))]
    public partial class Cours
    {
        [Display(Name = " Course Name")]
        public string NameOfCourse
        {
            get { return CourseName; }
        }
    }
    #endregion

    #region CourseCompletion
    public class CourseCompletionMetadata
    {
        [Required(ErrorMessage = "* A Course Completion ID is Required *")]
        [Display(Name = "Course Completion ID")]
        [Range(1, 104, ErrorMessage = ("* Values must be  between 1 and 104*"))]
        public int CourseCompletionId { get; set; }

        [Required(ErrorMessage = "* User ID is Required *")]
        [Display(Name = " User ID ")]
        [StringLength(128, ErrorMessage = "* User ID must be 128 Characters or Less *")]
        public string UserId { get; set; }

        [Required(ErrorMessage = "* Course ID is Required *")]
        [Display(Name = " Course ID ")]
        [Range(1, 104, ErrorMessage = ("* Values must be  between 1 and 104*"))]
        public int CourseId { get; set; }

        [Display(Name = "Completion Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime DateCompleted { get; set; }
    }
    [MetadataType(typeof(CourseCompletionMetadata))]
    public partial class CourseCompletion { }
    #endregion

    #region Lesson
    public class LessonMetadata
    {
        //public int LessonId { get; set; }
        [Required(ErrorMessage = "*Lesson Title is Required *")]
        [Display(Name = "Lesson")]
        [StringLength(200, ErrorMessage = "* Title must be 200 Characters or Less *")]
        public string LessonTitle { get; set; }

        [Required(ErrorMessage = "* Course Id is Required *")]
        [Display(Name = "Course ID")]
        [Range(1, 104, ErrorMessage = ("* Values must be between 1 and 104 *"))]
        public int CourseId { get; set; }

        [Display(Name = " INTRO. ")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [UIHint("MultilineText")]
        [StringLength(300, ErrorMessage = "* Introduction must be 300 Characters or Less *")]
        public string Introduction { get; set; }

        [Display(Name = " VIDEO ")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [UIHint("MultilineText")]
        [StringLength(250, ErrorMessage = "* Video URL must be 250 Characters or Less *")]
        public string VideoURL { get; set; }

        [Display(Name = " PDF ")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [UIHint("MultilineText")]
        [StringLength(100, ErrorMessage = "* PDF File Name must be 100 Characters or Less *")]
        public string PdfFileName { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }
    }
    [MetadataType(typeof(LessonMetadata))]
    public partial class Lesson { }
    #endregion

    #region LessonView
    public class LessonViewMetadata
    {
        //public int LessonViewId { get; set; }
        [Required(ErrorMessage = ("* User ID is Required*"))]
        [Display(Name = " User ID")]
        [StringLength(128, ErrorMessage = ("* Values must be between 1 and 104 *"))]
        public string UserId { get; set; }

        [Required(ErrorMessage = ("* Lesson ID is Required *"))]
        [Display(Name = " Lesson ID ")]
        [Range(1, 104, ErrorMessage = ("* Values must be between 1 and 104 *"))]
        public int LessonId { get; set; }

        [Display(Name = "Date Viewed")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime DateViewed { get; set; }
    }
    [MetadataType(typeof(LessonViewMetadata))]
    public partial class LessonView {

    }
    #endregion

    #region UserDetail
    public class UserDetailMetadata
    {
        //public string UserId { get; set; }
        [Required(ErrorMessage = ("* First Name is  Required *"))]
        [Display(Name = "First Name")]
        [StringLength(50, ErrorMessage = ("* First Name must be 50 Characters or Less*"))]
        public string FirstName { get; set; }

        [Required(ErrorMessage = ("* Last Name is  Required *"))]
        [Display(Name = "Last Name")]
        [StringLength(50, ErrorMessage = ("* Last Name must be 50 Characters or Less*"))]
        public string LastName { get; set; }
    }
    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail
    {
        [Display(Name = " User Name")]
        public string UserName
        {
            get { return FirstName + " " + LastName; }
        }
    }
    #endregion
}
