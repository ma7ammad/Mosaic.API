using Microsoft.Extensions.Configuration;
using Mosaic.API.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

namespace Mosaic.API.Services
{
    public class FinnHubService : IFinnHubService
    {
        private readonly IHttpClientFactory HttpClientFactory;
        private readonly IConfiguration Configuration;

        public FinnHubService(IHttpClientFactory httpClientFactory, IConfiguration configuration)
        {
            HttpClientFactory = httpClientFactory ??
                throw new ArgumentNullException(nameof(httpClientFactory));
            Configuration = configuration;
        }
        public async Task<List<FinnhubStock>> GetAllStockSymbols(/* string exchange, string mic*/)
        {
            var finnhubClient = HttpClientFactory.CreateClient("finnhub.io");
            var response = await finnhubClient.GetAsync($"stock/symbol?exchange=L&mic=XLON&token={Configuration["FinnHub:Token"]}");  // &token='
            response.EnsureSuccessStatusCode();

            //        var response = await httpClient.SendAsync(
            //request, HttpCompletionOption.ResponseHeadersRead).ConfigureAwait(false);

            if (response.IsSuccessStatusCode)
            {
                var contents = await response.Content.ReadAsStringAsync();
                using (var responseStream = await response.Content.ReadAsStreamAsync())
                {
                    //return (new StocksIndexViewModel(
                    //    await JsonSerializer.DeserializeAsync<List<FinnhubStock>>(responseStream)));
                    var data = await JsonSerializer.DeserializeAsync<List<FinnhubStock>>(responseStream);
                    //var enumerable = data.Take(5).to;
                    var subset = data.Take(5).ToList();
                    //CreateSymbols(data);
                    return subset;
                }
            }

            throw new NotImplementedException();
        }

        public object GetQuote(string symbol)
        {
            throw new NotImplementedException();
        }

        public object GetTrades(string symbol)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// ///////////////////////////////////////////////#
        /// from: https://www.codemag.com/Article/1701101/Processing-Large-Datasets-Using-C
        /// </summary>
        private void CreateSymbols(List<FinnhubStock> symbolsList)
        {

            using (var conn = new SqlConnection(Configuration["ConnectionStrings:MosaicStocks"]))
            {
                conn.Open();
                var cmd = new SqlCommand();
                cmd.CommandText = "SP_Add_Symbols";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                var param = new SqlParameter();
                param.ParameterName = "@SymbolsData";
                param.SqlDbType = SqlDbType.Structured;
                cmd.Parameters.Add(param);

                //load the data into a datatable
                var dt = new DataTable("SymbolsData");
                dt.Columns.Add("currency");
                dt.Columns.Add("description");
                dt.Columns.Add("displaySymbol");
                dt.Columns.Add("figi");
                dt.Columns.Add("mic");
                dt.Columns.Add("symbol");
                dt.Columns.Add("type");

                foreach (var symbol in symbolsList)
                {
                    var row = dt.NewRow();
                    row["currency"] = symbol.currency;
                    row["description"] = symbol.description;
                    row["displaySymbol"] = symbol.displaySymbol;
                    row["figi"] = symbol.figi;
                    row["mic"] = symbol.mic;
                    row["symbol"] = symbol.symbol;
                    row["type"] = symbol.type;
                    dt.Rows.Add(row);
                }

                cmd.Parameters["@SymbolsData"].Value = dt;
                cmd.ExecuteNonQuery();
            }
        }
    }
}
