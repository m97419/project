using Entities;

namespace Services
{
    public interface IProductServices
    {
        Task<IEnumerable<Product>> getAllProducts();
        Task<IEnumerable<Product>> getProductsByParams(int?[] categoriesId, string? desc, int? minPrice, int? maxPrice);
    }
}