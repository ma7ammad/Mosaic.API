using System;
using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Mosaic.IdP.PasswordReset;
using Mosaic.IdP.Services;

namespace Mosaic.IdP.PasswordReset
{
    public class PasswordResetController : Controller
    {
        private readonly ILocalUserService LocalUserService;

        public PasswordResetController(ILocalUserService localUserService)
        {
            LocalUserService = localUserService ?? throw new ArgumentNullException(nameof(localUserService));
        }
        public IActionResult RequestPassword()
        {
            var vm = new RequestPasswordViewModel();
            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> RequestPassword(RequestPasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var securityCode = await LocalUserService.InitiatePasswordResetRequest(model.Email);
            await LocalUserService.SaveChangesAsync();

            // Create activation link
            var link = Url.ActionLink("ResetPassword", "PasswordReset", new { securityCode });
            Debug.WriteLine(link);

            return View("PasswordResetRequestSent");
        }

        [HttpGet]
        public IActionResult ResetPassword(string securityCode)
        {
            var vm = new ResetPasswordViewModel()
            {
                SecurityCode = securityCode
            };
            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            if (await LocalUserService.SetPassword(model.SecurityCode, model.Password))
            {
                ViewData["Message"] = "Your password was successfully changed.  " +
                    "Navigate to your client application to log in.";
            }
            else
            {
                ViewData["Message"] = "Your password couldn't be changed, please" +
                    " contact your administrator.";
            }

            await LocalUserService.SaveChangesAsync();

            return View("ResetPasswordResult");
        }
    }
}
