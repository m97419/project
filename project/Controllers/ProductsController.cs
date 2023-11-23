using Entities;
using Microsoft.AspNetCore.Mvc;
using Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private IProductServices _productServices;

        public ProductsController(IProductServices productServices)
        {
            _productServices = productServices;
        }

        // GET: api/<ProductsController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> Get([FromQuery] int?[] categoriesId, string? desc, int? minPrice, int? maxPrice)
        {
            try
            {
                IEnumerable<Product> products = await _productServices.getProductsByParams(categoriesId, desc, minPrice, maxPrice);
                return Ok(products);
            }
            catch (Exception)
            {
                return NoContent();
            }
        }
    }
}