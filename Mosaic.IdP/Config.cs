using IdentityServer4;
using IdentityServer4.Models;
using System;
using System.Collections.Generic;

namespace Mosaic.IdP
{
    public static class Config
    {
        public static IEnumerable<IdentityResource> IdentityResources =>
            new IdentityResource[]
            { 
                new IdentityResources.OpenId(),
                new IdentityResources.Profile(),
                new IdentityResources.Email(),
                new IdentityResources.Address(),
                new IdentityResource("roles", "Your roles(s)", new List<string>() {"role" }),
                new IdentityResource("BirthDate", "Date Of Birht", new List<string>(){"BirthDate" })
            };

        public static IEnumerable<ApiScope> ApiScopes =>
            new ApiScope[]
            {
                new ApiScope("mosaicapi", "Mosaic API Scope")
            };

        public static IEnumerable<ApiResource> ApiResources =>
            new ApiResource[] {
                new ApiResource(
                    "mosaicapi",
                    "Mosaic API",
                    new[] { "role" })
                    {
                        Scopes = { "mosaicapi" },
                        ApiSecrets = {new Secret("apisecret".Sha256())}
                    }
                };

        public static IEnumerable<Client> Clients =>
            new Client[] 
            {
                new Client
                {
                    // config refresh tokens
                    AccessTokenType = AccessTokenType.Reference,
                    AccessTokenLifetime = 120,
                    AllowOfflineAccess = true,
                    UpdateAccessTokenClaimsOnRefresh = true,

                    ClientName = "Mosaic",
                    ClientId = "mosaicclient",
                    AllowedGrantTypes = GrantTypes.Code,
                    RequirePkce = true,
                    RedirectUris = new List<string>()
                    {
                        "https://localhost:44389/signin-oidc"
                    },
                    PostLogoutRedirectUris = new List<string>()
                    {
                        "https://localhost:44389/signout-callback-oidc"
                    },
                    AllowedScopes =
                    {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        IdentityServerConstants.StandardScopes.Email,
                        IdentityServerConstants.StandardScopes.Address,
                        "roles",
                        "BirthDate",
                        "mosaicapi"
                    },
                    ClientSecrets =
                    {
                        new Secret("secret".Sha256())
                    }
                }
            };
    }
}