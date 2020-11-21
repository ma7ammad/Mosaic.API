using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Mosaic.API.Models;
using Mosaic.API.Services;
using System;

namespace Mosaic.API.Controllers
{
    [ApiController]
    [Route("api/stocks")]

    //API controller auto check model validation , so just make sure annotations are used in models
    //Fluent vaidation is for complex apps
    public class StocksController : ControllerBase
    {
        readonly IStocksService StockService;
        private readonly ILogger<StocksController> logger;

        public StocksController(IStocksService _StockService, ILogger<StocksController> _logger)
        {
            StockService = _StockService;
            logger = _logger ?? throw new ArgumentNullException(nameof(_logger));
        }

        [HttpGet]
        public IActionResult GetAllStocks()
        {
            return Ok(StockService.GetAllStocks());
        }

        [HttpGet("{id}", Name = "GetStock")]
        //[ProducesResponseType(StatusCodes.Status200OK)]
        //[ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult GetStock(int id)
        {
            var stock = StockService.GetStock(id);
            if (stock==null)
            {
                logger.LogError($"No Stock found with id = {id}");
                return NotFound();
            }

            return Ok(stock);
        }

        [HttpPost]
        public IActionResult CreateStock(Stock stock)
        {
            StockService.CreateSock(stock);
            return CreatedAtRoute("GetStock",
                new { id = stock.Id },
                stock);
        }

        [HttpPost("{id}")]
        public IActionResult UpdateStock(int id, [FromBody] Stock stock)
        {
            StockService.UpdateStock(id, stock);
            return NoContent();
        }

        //this needs installing Microsoft.AspNetCore.JsonPatch
        //which is 85 MB, so halted for now
        //[HttpPatch("{id}")]
        //public IActionResult PatcStock(int id, [FromBody] JsonPatchDocument stock)
        //{
        //    var stockToPatch = StockService.sto
        //}
    }
}
