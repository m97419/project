using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repositories
{
    public class OrderRepository : IOrderRepository
    {
        private Store214364960Context _store214364960Context;

        public OrderRepository(Store214364960Context store214364960Context)
        {
            _store214364960Context = store214364960Context;
        }

        public async Task<Order> addOrderAsync(Order order)
        {
            await _store214364960Context.AddAsync(order);
            await _store214364960Context.SaveChangesAsync();
            return order;
        }

        public async Task<Order> getOrderByIdAsync(int id)
        {
            return await _store214364960Context.Orders.FindAsync(id);
        }
    }
}