using Entities;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class ProductServices : IProductServices
    {
        private Repositories.IProductRepository _productRepository;

        public ProductServices(Repositories.IProductRepository productRepository)
        {
            this._productRepository = productRepository;
        }

        public async Task<IEnumerable<Product>> getAllProducts()
        {
            IEnumerable<Product> products = await _productRepository.getAllProductsAsync();
            return products;
        }

    }
}
