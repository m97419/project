using Entities;

namespace Services
{
    public interface IProductServices
    {
        Task<IEnumerable<Product>> getAllProducts();
    }
}