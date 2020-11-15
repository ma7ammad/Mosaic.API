using Mosaic.API.Models;
using System.Collections.Generic;

namespace Mosaic.API.Services
{
    public interface IStocksService
    {
        List<Stock> GetAllStocks();
        Stock GetStock(int id);
        bool CreateSock(Stock stock);
        bool DeleteStock(Stock stock);
        Stock UpdateStock(Stock stock);
    }
}
