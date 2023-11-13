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

        public async Task<IEnumerable<Product>> getAllProductsAsync()
        {
            return await _store214364960Context.Products.ToListAsync();
        }
    }
}
