using Entities;
using Microsoft.EntityFrameworkCore;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class CategoryRepository : ICategoryRepository
    {

        private Store214364960Context _store214364960Context;

        public CategoryRepository(Store214364960Context store214364960Context)
        {
            _store214364960Context = store214364960Context;
        }

        public async Task<IEnumerable<Category>> getAllCategories()
        {
            return await _store214364960Context.Categories.ToListAsync();
        }
    }
}