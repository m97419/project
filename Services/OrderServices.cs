using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class OrderServices : IOrderServices
    {
        private Repositories.IOrderRepository _orderRepository;

        public OrderServices(Repositories.IOrderRepository orderRepository)
        {
            this._orderRepository = orderRepository;
        }

        public async Task<Order> addOrder(Order order)
        {
            return await _orderRepository.addOrder(order);
        }
    }
}
