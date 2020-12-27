using Mosaic.API.Models;
using System.Collections.Generic;

namespace Mosaic.API.Services
{
    public interface IStocksService
    {
        List<Stock> GetAllStocks();
        List<Stock> GetUserStocks(string userId);
        Stock GetStock(int id);
        bool CreateSock(Stock stock);
        bool DeleteStock(Stock stock);
        bool UpdateStock(int id, Stock stock);
    }
}
