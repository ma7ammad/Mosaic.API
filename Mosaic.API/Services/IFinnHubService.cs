using Mosaic.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mosaic.API.Services
{
    public interface IFinnHubService
    {
        Task<List<FinnhubStock>> GetAllStockSymbols(/* string exchange, string mic*/);
        object GetQuote(string symbol);
        object GetTrades(string symbol);
    }
}
