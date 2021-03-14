using Microsoft.Extensions.Configuration;
using Mosaic.API.Models;
using System;
using System.Collections.Generic;
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
                    return data.Take(5).ToList();
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
    }
}
