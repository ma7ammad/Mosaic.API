using Mosaic.API.Models;
using System.Collections.Generic;

namespace Mosaic.API.Services
{
    public interface IUserService
    {
        List<User> GetAllUsers();
        User GetUser(string usrName);
        bool CreateUser(User usr);
        bool DeleteUser(User usr);
        bool UpdateUser(User usr);
    }
}
