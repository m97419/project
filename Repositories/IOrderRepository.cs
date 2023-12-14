using Entities;

namespace Repositories
{
    public interface IOrderRepository
    {
        Task<Order> addOrderAsync(Order order);
        Task<Order> getOrderByIdAsync(int id);
    }
}