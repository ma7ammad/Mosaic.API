using System;

namespace Mosaic.API.Models
{
    public class User
    {
        //Must be > 3 chars & less than 16 chars & be unique
        public string UserName { get; set; }
        //Must contain numbers & letters, be more than 7 chars long &  have 2 field inputs
        public string Password { get; set; }
        //Must be a valid email address, Must have two field inputs
        public string Email { get; set; }
        //
        public string FistName { get; set; }
        public string LastName { get; set; }
        //Must be a valid date
        public DateTime BirthDate { get; set; }
    }
}
