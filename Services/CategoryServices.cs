using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class CategoryServices : ICategoryServices
    {
        private Repositories.ICategoryRepository _categoryRepository;

        public CategoryServices(Repositories.ICategoryRepository categoryRepository)
        {
            this._categoryRepository = categoryRepository;
        }

        public async Task<IEnumerable<Category>> getAllCategories()
        {
            IEnumerable<Category> categories = await _categoryRepository.getAllCategories();
            return categories;
        }
    }
}
