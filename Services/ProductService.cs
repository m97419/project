using Entities;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class ProductService : IProductService
    {
        private readonly Repositories.IProductRepository _productRepository;

        public ProductService(Repositories.IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public async Task<IEnumerable<Product>> getProductsByParams(int?[] categoriesId,string? desc, int? minPrice, int? maxPrice)
        {
            IEnumerable<Product> products = await _productRepository.getProductsByParams(categoriesId, desc, minPrice, maxPrice);
            return products;
        }

    }
}
