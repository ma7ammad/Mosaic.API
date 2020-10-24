using Mosaic.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Mosaic.API.Services
{
    public class UserService : IUserService
    {
        List<User> Users;
        public UserService()
        {
            Users = new List<User>()
            {
                new User{BirthDate=DateTime.Parse("01-01-1970"), Email="1@mail.com", FistName="fname1", LastName="lname1", Password="pass1", UserName="usr1"},
                new User{BirthDate=DateTime.Parse("02-02-1970"), Email="2@mail.com", FistName="fname2", LastName="lname2", Password="pass2", UserName="usr2"},
                new User{BirthDate=DateTime.Parse("03-03-1970"), Email="3@mail.com", FistName="fname3", LastName="lname3", Password="pass3", UserName="usr3"},
                new User{BirthDate=DateTime.Parse("04-04-1970"), Email="4@mail.com", FistName="fname4", LastName="lname4", Password="pass4", UserName="usr4"},
                new User{BirthDate=DateTime.Parse("05-05-1970"), Email="5@mail.com", FistName="fname5", LastName="lname5", Password="pass5", UserName="usr5"}
            };
        }

        public void CreateUser(User usr)
        {
            Users.Add(usr);
        }

        public void DeleteUser(User usr)
        {
            //refactor for EF Core
            Users.Remove(usr);
        }

        public User GetUser(string usrName)
        {
            return Users.FirstOrDefault(usr => usr.UserName == usrName);
        }

        public User UpdateUser(User usr)
        {
            throw new NotImplementedException();
        }
    }
}
