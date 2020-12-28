using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Mosaic.Client.Controllers
{
    public class AuthorisationController : Controller
    {
        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}
