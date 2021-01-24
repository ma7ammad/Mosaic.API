using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Mosaic.IdP.Entities
{
    public class User : IConcurrencyAware
    {
        [Key]
        public Guid Id { get; set; }

        [MaxLength(200)]
        [Required]
        public string Subject { get; set; }

        //Must be > 3 chars & less than 16 chars & be unique
        [Required]
        [StringLength(15, ErrorMessage = "{0} length must be between {2} and {1}.", MinimumLength = 4)]
        public string UserName { get; set; }
        //Must contain numbers & letters, be more than 7 chars long &  have 2 field inputs
        [Required]
        [MinLength(8)]
        public string Password { get; set; }
        //
        public string FistName { get; set; }
        public string LastName { get; set; }
        //Must be a valid email address, Must have two field inputs
        [EmailAddress]
        public string Email { get; set; }

        [MaxLength(200)]
        public string SecurityCode { get; set; }

        public DateTime SecurityCodeExpirationDate { get; set; }

        //Must be a valid date
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime BirthDate { get; set; }

        [Required]
        public bool Active { get; set; }

        [ConcurrencyCheck]
        public string ConcurrencyStamp { get; set; } = Guid.NewGuid().ToString();
        public ICollection<UserClaim> Claims { get; set; } = new List<UserClaim>();
    }
}
