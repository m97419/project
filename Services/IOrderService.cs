using Entities;

namespace Services
{
    public interface IOrderService
    {
        Task<Order> addOrderAsync(Order order);
        Task<Order> getOrderByIdAsync(int id);
    }
}