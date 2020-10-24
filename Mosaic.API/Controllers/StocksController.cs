using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Mosaic.API.Services;

namespace Mosaic.API.Controllers
{
    [ApiController]
    [Route("api/stocks")]
    public class StocksController : ControllerBase
    {
        IStocksService StocksService;
        public StocksController(IStocksService _StocksService)
        {
            StocksService = _StocksService;
        }

        [HttpGet]
        public IActionResult GetStocks()
        {
            return Ok(StocksService.GetStocks());
        }

        [HttpGet("{id}")]
        //[ProducesResponseType(StatusCodes.Status200OK)]
        //[ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult GetStock(int id)
        {
            var stock = StocksService.GetStock(id);
            if (stock==null)
            {
                return NotFound();
            }

            return Ok(stock);
        }
    }
}
