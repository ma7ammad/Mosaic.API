using Mosaic.API.Models;
using System.Collections.Generic;
using System.Linq;

namespace Mosaic.API.Services
{
    public class StockService : IStocksService
    {
        List<Stock> Stocks;
        public StockService()
        {
            Stocks = new List<Stock>()
                {
                    new Stock {Id=1, StockSymbol="LLOYDS", StockName="Stock 1"},
                    new Stock {Id= 2, StockSymbol="LLOYDS", StockName="Stock 2"},
                    new Stock {Id= 3, StockSymbol="LLOYDS", StockName="Stock 3"},
                    new Stock {Id= 4, StockSymbol="MUFG", StockName="Stock 4"}
                };
        }

        public Stock GetStock(int id)
        {
            return Stocks.FirstOrDefault(st => st.Id == id);
        }

        public List<Stock> GetStocks()
        {
            return Stocks;

        }
    }

}
