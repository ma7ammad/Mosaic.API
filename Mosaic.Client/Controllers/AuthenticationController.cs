using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using IdentityModel.Client;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;

namespace Mosaic.Client.Controllers
{
    public class AuthenticationController : Controller
    {
        private readonly IHttpClientFactory HttpClientFactory;

        public AuthenticationController(IHttpClientFactory httpClientFactory)
        {
            HttpClientFactory = httpClientFactory ??
                throw new ArgumentNullException(nameof(httpClientFactory));
        }
        public async Task Logout()
        {
            var client = HttpClientFactory.CreateClient("IdPClient");

            var discoveryResponse = await client.GetDiscoveryDocumentAsync();
            if (discoveryResponse.IsError)
            {
                throw new Exception(discoveryResponse.Error);
            }

            // Revoke refresh token
            var accessTokenRevocationResponse = await client.RevokeTokenAsync(
            new TokenRevocationRequest
                {
                    Address = discoveryResponse.RevocationEndpoint,
                    ClientId = "mosaicclient",
                    ClientSecret = "secret",
                    Token = await HttpContext.GetTokenAsync(OpenIdConnectParameterNames.AccessToken)
                });

            if (accessTokenRevocationResponse.IsError)
            {
                throw new Exception(accessTokenRevocationResponse.Error);
            }

            // Revoke refresh token
            var refreshokenRevocationResponse = await client.RevokeTokenAsync(
                new TokenRevocationRequest
                {
                    Address = discoveryResponse.RevocationEndpoint,
                    ClientId = "mosaicclient",
                    ClientSecret = "secret",
                    Token = await HttpContext.GetTokenAsync(OpenIdConnectParameterNames.RefreshToken)
                });

            if (refreshokenRevocationResponse.IsError)
            {
                throw new Exception(refreshokenRevocationResponse.Error);
            }

            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            await HttpContext.SignOutAsync(OpenIdConnectDefaults.AuthenticationScheme);
        }
    }
}
