using Entities;

namespace Services
{
    public interface IProductService
    {
        Task<IEnumerable<Product>> getAllProducts();
        Task<IEnumerable<Product>> getProductsByParams(int?[] categoriesId, string? desc, int? minPrice, int? maxPrice);
    }
}