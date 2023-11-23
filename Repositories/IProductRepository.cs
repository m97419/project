using Entities;

namespace Repositories
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> getAllProductsAsync();
        Task<IEnumerable<Product>> getProductsByParams(int?[] categoriesId, string? desc, int? minPrice, int? maxPrice);

    }
}