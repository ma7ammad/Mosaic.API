using System;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Mosaic.Client.Services;

namespace Mosaic.Client.Controllers
{
    public class StockController : Controller
    {
        private readonly IStockService StockService;
        private readonly ILogger<StockController> logger;

        public StockController(IStockService _StockService, ILogger<StockController> _logger)
        {
            StockService = _StockService;
            logger = _logger ?? throw new ArgumentNullException(nameof(_logger));
        }
        public IActionResult Index()
        {
            try
            {
                return View(StockService.GetAllStocks().Result);
            }
            catch(Exception e)
            {
                logger.LogError($"Error happened with message {e.Message} and inner exception {e.InnerException.Message}");
                return RedirectToAction("AccessDenied", "Authorisation");
            }
        }

        public IActionResult GetFinnHubStock()
        {
            try
            {
                return View(StockService.GetFinnHubStock().Result);
            }
            catch
            {
                return RedirectToAction("AccessDenied", "Authorisation");
            }

        }
        public IActionResult GetUserStocks()
        {
            try
            {
                var userId = User.Claims.FirstOrDefault(c => c.Type == "sub")?.Value;
                return View(StockService.GetUserStocks(userId).Result);
            }
            catch(Exception e)
            {
                logger.LogError($"error thrown with exception {e.Message} and inner exception {e.InnerException.Message}");
                return RedirectToAction("AccessDenied", "Authorisation");
            }

        }
    }
}
