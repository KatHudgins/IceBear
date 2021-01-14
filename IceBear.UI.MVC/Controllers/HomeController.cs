using IceBear.UI.MVC.Models;
using System;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;

namespace IceBear.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (ModelState.IsValid)
            {
                string body = $"{cvm.Name} has sent you the following message: <br/>" + $"{cvm.Message} <strong>from the email address:</strong>{cvm.Email}";
                MailMessage msg = new MailMessage("Admin@kathrynrosella.com", "Hudginskr@outlook.com", cvm.Subject, body);
                msg.IsBodyHtml = true;
                msg.ReplyToList.Add(cvm.Email);
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
                return View("EmailConfirmation", cvm);
            }
            return View(cvm);
        }
    }

}
