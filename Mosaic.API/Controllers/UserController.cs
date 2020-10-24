using Microsoft.AspNetCore.Mvc;
using Mosaic.API.Models;
using Mosaic.API.Services;

namespace Mosaic.API.Controllers
{
    [ApiController]
    [Route("api/users")]
    public class UserController : ControllerBase
    {
        IUserService UserService;
        public UserController(IUserService _UserService)
        {
            UserService = _UserService;
        }

        [HttpGet]
        public IActionResult GetUsers()
        {
            return Ok(UserService.GetUsers());
        }

        [HttpGet("{usrName}", Name ="GetUser")]
        public IActionResult GetUser(string usrName)
        {
            return Ok(UserService.GetUser(usrName));
        }

        [HttpPost]
        public IActionResult CreateUser(User usr)
        {
            UserService.CreateUser(usr);
            return CreatedAtRoute("GetUser",
                new { usrName = usr.UserName },
                usr);
        }
    }
}
