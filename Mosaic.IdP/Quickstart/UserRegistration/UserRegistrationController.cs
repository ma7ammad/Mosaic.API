using IdentityModel;
using IdentityServer4.Services;
using Mosaic.IdP.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
//using Microsoft.AspNetCore.Authentication.Abstractions;
using System.Threading.Tasks;
using IdentityServer4;

namespace Mosaic.IdP.UserRegistration
{
    public class UserRegistrationController : Controller
    {
        private readonly ILocalUserService LocalUserService;
        private readonly IIdentityServerInteractionService Interaction;

        public UserRegistrationController(ILocalUserService localUserService, 
            IIdentityServerInteractionService interaction)
        {
            LocalUserService = localUserService ?? throw new ArgumentNullException(nameof(localUserService));
            Interaction = interaction ?? throw new ArgumentNullException(nameof(interaction));
        }

        [HttpGet]
        public IActionResult RegisterUser(string returnUrl)
        {
            var vm = new RegisterUserViewModel() { ReturnUrl = returnUrl };
            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> RegisterUser(RegisterUserViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var userToCreate = new Entities.User
            {
                Password = model.Password,
                UserName = model.UserName,
                Subject = Guid.NewGuid().ToString(),
                Active = true
            };

            userToCreate.Claims.Add(new Entities.UserClaim()
            {
                Type = JwtClaimTypes.Address,
                Value = model.Address
            });

            userToCreate.Claims.Add(new Entities.UserClaim()
            {
                Type = JwtClaimTypes.GivenName,
                Value = model.FirstName
            });

            userToCreate.Claims.Add(new Entities.UserClaim()
            {
                Type = JwtClaimTypes.FamilyName,
                Value = model.LastName
            });

            userToCreate.Claims.Add(new Entities.UserClaim()
            {
                Type = JwtClaimTypes.Email,
                Value = model.Email
            });

            userToCreate.Claims.Add(new Entities.UserClaim()
            {
                Type = JwtClaimTypes.BirthDate,
                Value = model.BirthDate.ToString()
            });

            userToCreate.Claims.Add(new Entities.UserClaim()
            {
                Type = JwtClaimTypes.Role,
                Value = model.Role
            });

            LocalUserService.AddUser(userToCreate);
            await LocalUserService.SaveChangesAsync();

            // login user
            await HttpContext.SignInAsync(new IdentityServerUser(userToCreate.Subject));

            // continue with the flow
            if (Interaction.IsValidReturnUrl(model.ReturnUrl) || Url.IsLocalUrl(model.ReturnUrl))
            {
                return Redirect(model.ReturnUrl);
            }

            return Redirect("~/");
        }
    }
}
