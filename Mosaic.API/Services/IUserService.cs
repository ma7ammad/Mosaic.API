using Mosaic.API.Models;

namespace Mosaic.API.Services
{
    public interface IUserService
    {
        User GetUser(string usrName);
        void CreateUser(User usr);
        void DeleteUser(User usr);
        User UpdateUser(User usr);
    }
}
