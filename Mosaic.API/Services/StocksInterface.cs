using Mosaic.API.Models;
using System.Collections.Generic;

namespace Mosaic.API.Services
{
    public interface IStocksService
    {
        List<Stock> GetStocks();
        Stock GetStock(int id);
    }
}
