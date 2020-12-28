using IdentityModel.Client;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;
using Mosaic.Client.ViewModels;
using System;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Mosaic.Client.Controllers
{
    public class UserController : Controller
    {
        private readonly IHttpClientFactory HttpClientFactory;
        private readonly User User;

        public UserController(IHttpClientFactory httpClientFactory)
        {
            HttpClientFactory = httpClientFactory ??
                throw new ArgumentNullException(nameof(httpClientFactory));
            User = new User();
        }


        public async Task<IActionResult> MyDetails()
        {
            var idpClient = HttpClientFactory.CreateClient("IdPClient");
            
            // Get the .wellKnownDocument which includes all endpoints of the IdP
            var metaDataResponse = await idpClient.GetDiscoveryDocumentAsync();

            if (metaDataResponse.IsError)
            {
                throw new Exception(
                    "Problem accessing the discovery endpoint"
                    , metaDataResponse.Exception);
            }

            var accessToken = await HttpContext.GetTokenAsync(OpenIdConnectParameterNames.AccessToken);

            var userInfoResponse = await idpClient.GetUserInfoAsync(
                new UserInfoRequest
                {
                    Address = metaDataResponse.UserInfoEndpoint,
                    Token = accessToken
                });

            if (userInfoResponse.IsError)
            {
                throw new Exception(
                    "Problem accessing the UserInfo endpoint"
                    , userInfoResponse.Exception);
            }

            var email = userInfoResponse.Claims.FirstOrDefault(c => c.Type == "email")?.Value;
            User.Email = email;

            return View(User);
        }

        [Authorize(Roles = "Admin")]
        public IActionResult Admin()
        {
            return View();
        }
    }
}
