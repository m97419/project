using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Services;
using System.Collections.Generic;
using AutoMapper;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IProductService _productServices;
        private readonly IMapper _mapper;

        public ProductsController(IProductService productServices, IMapper mapper)
        {
            _productServices = productServices;
            _mapper = mapper;
        }

        // GET: api/<ProductsController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductDto>>> Get([FromQuery] int?[] categoriesId, string? desc, int? minPrice, int? maxPrice)
        {
            IEnumerable<Product> products = await _productServices.getProductsByParams(categoriesId, desc, minPrice, maxPrice);
            IEnumerable<ProductDto> productDtos = _mapper.Map< IEnumerable<Product>, IEnumerable<ProductDto>>(products);
            return Ok(productDtos);
        }
    }
}