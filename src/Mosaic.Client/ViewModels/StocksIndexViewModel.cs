using Mosaic.Client.Models;
using System.Collections.Generic;

namespace Mosaic.Client.ViewModels
{
    public class StocksIndexViewModel
    {
        public IEnumerable<Stock> Stocks { get; private set; } = new List<Stock>();
        public StocksIndexViewModel(IEnumerable<Stock> stocks)
        {
            Stocks = stocks;
        }
    }
}