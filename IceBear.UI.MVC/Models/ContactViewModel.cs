using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace IceBear.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage ="* Your Name is required *")]
        public string Name { get; set; }

        [Required(ErrorMessage ="* Your Email is required *")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required(ErrorMessage ="* A Subject is required *")]
        public string Subject { get; set; }

        [UIHint("MultilineText")]
        [Required(ErrorMessage ="* A message is required *")]
        public string Message { get; set; }
    }
}