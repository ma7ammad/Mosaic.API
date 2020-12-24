using Mosaic.Client.Models;
using Mosaic.Client.ViewModels;
using System.Threading.Tasks;

namespace Mosaic.Client.Services
{
    public interface IStockService
    {
        Task<StocksIndexViewModel> GetAllStocks();
        Stock GetStock(int id);
        bool CreateSock(Stock stock);
        bool DeleteStock(Stock stock);
        bool UpdateStock(int id, Stock stock);
    }
}
