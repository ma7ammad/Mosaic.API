using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Mosaic.API.Models;
using Mosaic.API.Services;
using System;
using System.Linq;

namespace Mosaic.API.Controllers
{
    [ApiController]
    [Route("api/stocks")]
    [Authorize]

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
        [Authorize(Roles = "Admin")]
        public IActionResult GetAllStocks()
        {
            var result = Ok(StockService.GetAllStocks());
            return result;
        }

        [HttpGet("GetUserStocks")]
        //[ProducesResponseType(StatusCodes.Status200OK)]
        //[ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult GetUserStocks()
        {
            var userId = User.Claims.FirstOrDefault(c => c.Type == "sub")?.Value;
            var stock = StockService.GetUserStocks(userId);
             if (stock == null)
            {
                logger.LogError($"No Stock found for user with id = {userId}");
                return NotFound();
            }

            return Ok(stock);
        }

        [HttpGet("{id}", Name = "GetStock")]
        //[ProducesResponseType(StatusCodes.Status200OK)]
        //[ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult GetStock(int id)
        {
            var stock = StockService.GetStock(id);
            if (stock == null)
            {
                logger.LogError($"No Stock found with id = {id}");
                return NotFound();
            }

            return Ok(stock);
        }

        [HttpPost]
        [Authorize(Roles ="Admin")]
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

        [HttpDelete("{id}")]
        public IActionResult DeleteStock(int id, [FromBody] Stock stock)
        {
            StockService.DeleteStock(stock);
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
