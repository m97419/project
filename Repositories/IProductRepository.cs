using Entities;

namespace Repositories
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> getProductsByParams(int?[] categoriesId, string? desc, int? minPrice, int? maxPrice);

        Task<Product> getProductByIdAsync(int? id);

    }
}