using Microsoft.Extensions.Logging;
using System;
using System.Linq;

namespace Mosaic.API.Services
{
    public class PasswordValidater
    {
        private readonly object logger;

        protected PasswordValidater(ILogger<PasswordValidater> _logger)
        {
            logger = _logger ?? throw new ArgumentNullException(nameof(_logger));
        }

        static bool IsLetter(char c)
        {
            return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
        }

        static bool IsDigit(char c)
        {
            return c >= '0' && c <= '9';
        }

        static bool IsSymbol(char c)
        {
            return c > 32 && c < 127 && !IsDigit(c) && !IsLetter(c);
        }

        static bool IsValidPassword(string password)
        {
            return
               password.Any(c => IsLetter(c)) &&
               password.Any(c => IsDigit(c)) &&
               password.Any(c => IsSymbol(c));
        }
    }
}
