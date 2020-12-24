using System;

namespace Mosaic.Client.Models
{
    public class Stock
    {
        public int Id { get; set; }
        public string StockSymbol { get; set; }
        public string StockName { get; set; }
        public DateTime LastTrade { get; set; }
        public decimal Gains { get; set; }
        public decimal Value { get; set; }
        public int Volume { get; set; }
        public decimal Open { get; set; }
        public decimal Close { get; set; }
    }
}
