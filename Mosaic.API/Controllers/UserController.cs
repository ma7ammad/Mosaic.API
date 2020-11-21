using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Mosaic.API.Models;
using Mosaic.API.Services;
using System;

namespace Mosaic.API.Controllers
{
    [ApiController]
    [Route("api/users")]
    public class UserController : ControllerBase
    {
        readonly IUserService UserService;
        private readonly ILogger<UserController> logger;
        
        public UserController(IUserService _UserService, ILogger<UserController> _logger)
        {
            UserService = _UserService;
            logger = _logger ?? throw new ArgumentNullException(nameof(_logger));
        }

        [HttpGet]
        public IActionResult GetAllUsers()
        {
            return Ok(UserService.GetAllUsers());
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
