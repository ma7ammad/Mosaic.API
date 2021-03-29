using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Mosaic.IdP.UserRegistration
{
    public class RegisterUserViewModel
    {
        [Required]
        [StringLength(15, ErrorMessage = "{0} length must be between {2} and {1}.", MinimumLength = 4)]
        [Display(Name ="User Name")]
        public string UserName { get; set; }

        [Required]
        [MinLength(8)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirmation Password is required.")]
        [Display(Name = "Confirm Password")]
        [Compare("Password", ErrorMessage = "Password and Confirmation Password must match.")]
        public string ConfirmPassword { get; set; }

        [Required]
        public string Role { get; set;  } 
        public List<string> RoleList { get; } = new List<string> { "User", "Admin" };

        [Required]
        [MaxLength(200)]
        [Display(Name = "Email")]
        [EmailAddress]
        public string Email { get; set; }

        [Required(ErrorMessage = "Confirmation Email is required.")]
        [Display(Name = "Confirm Email")]
        [Compare("Email", ErrorMessage = "Email and Confirmation Email must match.")]
        public string ConfirmEmail { get; set; }

        [Required]
        [MaxLength(250)]
        [Display(Name = "Fist name")]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(250)]
        [Display(Name = "Last name")]
        public string LastName { get; set; }

        //Must be a valid date
        [Display(Name = "Date of birht")]
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime BirthDate { get; set; }

        [MaxLength(250)]
        [Display(Name = "Address")]
        public string Address { get; set; }

        public string ReturnUrl { get; set; }

    }
}
