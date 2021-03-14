using Mosaic.API.Models;
using Mosaic.Client.Models;
using Mosaic.Client.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Mosaic.Client.Services
{
    public interface IStockService
    {
        Task<StocksIndexViewModel> GetAllStocks();
        Task<List<FinnhubStock>> GetFinnHubStock();
        Task<StocksIndexViewModel> GetUserStocks(string userId);
        Stock GetStock(int id);
        bool CreateSock(Stock stock);
        bool DeleteStock(Stock stock);
        bool UpdateStock(int id, Stock stock);
    }
}
