using Mosaic.API.Models;
using System.Collections.Generic;

namespace Mosaic.API.Services
{
    public interface IUserService
    {
        List<User> GetUsers();
        User GetUser(string usrName);
        bool CreateUser(User usr);
        void DeleteUser(User usr);
        User UpdateUser(User usr);
    }
}
