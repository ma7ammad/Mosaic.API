using System;
using System.ComponentModel.DataAnnotations;

namespace Mosaic.API.Models
{
    public class User
    {
        public string Id { get; set; }
        //Must be > 3 chars & less than 16 chars & be unique
        [Required]
        [StringLength(15, ErrorMessage = "{0} length must be between {2} and {1}.", MinimumLength = 4)]
        public string UserName { get; set; }
        //Must contain numbers & letters, be more than 7 chars long &  have 2 field inputs
        [Required]
        [MinLength(8)]
        public string Password { get; set; }
        //Must be a valid email address, Must have two field inputs
        [EmailAddress]
        public string Email { get; set; }
        //
        public string FistName { get; set; }
        public string LastName { get; set; }
        //Must be a valid date
        public DateTime BirthDate { get; set; }
    }
}
