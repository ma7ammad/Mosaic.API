using Mosaic.Client.Models;
using Mosaic.Client.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

namespace Mosaic.Client.Services
{
    public class StockService : IStockService
    {
        private readonly IHttpClientFactory HttpClientFactory;
        private readonly HttpClient httpClient;

        public StockService(IHttpClientFactory httpClientFactory)
        {
            HttpClientFactory = httpClientFactory ??
                throw new ArgumentNullException(nameof(httpClientFactory));
            httpClient = HttpClientFactory.CreateClient("APIClient");
        }
        public bool CreateSock(Stock stock)
        {
            throw new NotImplementedException();
        }

        public bool DeleteStock(Stock stock)
        {
            throw new NotImplementedException();
        }

        public async Task<StocksIndexViewModel> GetAllStocks()
        {
            var request = new HttpRequestMessage(
                HttpMethod.Get,
                "/api/stocks/");

            var response = await httpClient.SendAsync(
                request, HttpCompletionOption.ResponseHeadersRead).ConfigureAwait(false);

            if (response.IsSuccessStatusCode)
            {
                using (var responseStream = await response.Content.ReadAsStreamAsync())
                {
                    return (new StocksIndexViewModel(
                        await JsonSerializer.DeserializeAsync<List<Stock>>(responseStream)));
                }
            }
            //else if (response.StatusCode == System.Net.HttpStatusCode.Unauthorized ||
            //        response.StatusCode == System.Net.HttpStatusCode.Forbidden)
            //{
            //    return RedirectToAction("AccessDenied", "Authorization");
            //}

            throw new Exception("Problem accessing the API");
        }

        public Stock GetStock(int id)
        {
            throw new NotImplementedException();
        }

        public bool UpdateStock(int id, Stock stock)
        {
            throw new NotImplementedException();
        }
    }
}
