﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mosaic.API.Models
{
    public class FinnhubStock
    {
        public string currency { get; set; }
        public string description { get; set; }
        public string displaySymbol { get; set; }
        public string figi { get; set; }
        public string mic { get; set; }
        public string symbol { get; set; }
        public string type { get; set; }
    }
}
