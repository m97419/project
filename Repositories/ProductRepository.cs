using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class ProductRepository : IProductRepository
    {

        private Store214364960Context _store214364960Context;

        public ProductRepository(Store214364960Context store214364960Context)
        {
            _store214364960Context = store214364960Context;
        }

        public async Task<IEnumerable<Product>> getProductsByParams(int?[] categoriesId, string? desc, int? minPrice, int? maxPrice)
        {
            var query = _store214364960Context.Products.Where(product =>
                (desc == null ? (true) : (product.Description.Contains(desc)))
                && (minPrice == null ? (true) : (product.Price >= minPrice))
                && (maxPrice == null ? (true) : (product.Price <= maxPrice))
                && (categoriesId.Length == 0 ? (true) : (categoriesId.Contains(product.CategoryId))))
                .OrderBy(product => product.Price);
            List<Product> products = await query.ToListAsync();
            return products;
        }

        public async Task<Product> getProductByIdAsync(int? id)
        {
            return await _store214364960Context.Products.Where(product => product.ProductId == id).FirstAsync();
        }
    }
}
