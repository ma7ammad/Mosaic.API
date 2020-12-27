using Mosaic.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Mosaic.API.Services
{
    public class StockService : IStocksService
    {
        readonly List<Stock> Stocks;
        public StockService()
        {
            Stocks = new List<Stock>()
                {
                    new Stock {Id=1, StockSymbol="HSBC", StockName="Stock 1"},
                    new Stock {Id= 2, StockSymbol="BARC", StockName="Stock 2"},
                    new Stock {Id= 3, StockSymbol="LLOYDS", StockName="Stock 3"},
                    new Stock {Id= 4, StockSymbol="MUFG", StockName="Stock 4"}
                };
        }

        public bool CreateSock(Stock stock)
        {
            stock.StockSymbol = stock.StockSymbol.ToUpper();
            Stocks.Add(stock);
            return true;
        }

        public List<Stock> GetAllStocks()
        {
            return Stocks;
        }

        public Stock GetStock(int id)
        {
            return Stocks.FirstOrDefault(st => st.Id == id);
        }

        public List<Stock> GetUserStocks(string userId)
        {
            if (userId == "b7539694-97e7-4dfe-84da-b4256e1ff5c7")
            {
                var newStocks = Stocks;
                newStocks.RemoveAll(st => st.Id == 1);
                return newStocks;
            }
            else
            {
                var newStocks = Stocks;
                newStocks.RemoveAll(st => st.Id == 4);
                return newStocks;
            }
        }

        public bool UpdateStock(int id, Stock stock)
        {
            var st = Stocks.FirstOrDefault(st => st.Id == id);
            var index = Stocks.IndexOf(st);
            if (st!=null)
            {
                st.StockSymbol = stock.StockSymbol;
                st.StockName = stock.StockName;
                st.LastTrade = stock.LastTrade;
                st.Gains = stock.Gains;
                st.Value = stock.Value;
                st.Volume = stock.Volume;
                st.Open = stock.Open;
                st.Close = stock.Close;
            }
            Stocks[index] = st;
            return true;
        }

        public bool DeleteStock(Stock stock)
        {
            if (Stocks.FirstOrDefault(st => st.Id == stock.Id) != null)
            {
                Stocks.RemoveAll(st => st.Id == stock.Id);
                return true;
            }
            else
            {
                return false;
            }
        }
    }

}
