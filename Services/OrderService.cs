using Entities;
using Microsoft.Extensions.Logging;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class OrderService : IOrderService
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IProductRepository _productRepository;
        private readonly ILogger<OrderService> _logger;

        public OrderService(IOrderRepository orderRepository, IProductRepository productRepository, ILogger<OrderService> logger)
        {
            _orderRepository = orderRepository;
            _productRepository = productRepository;
            _logger = logger;
        }

        public async Task<Order> addOrder(Order order)
        {
            int sum = 0;
            for (int i = 0; i < order.OrderItems.Count; i++)
            {
                Product product = await _productRepository.getProductByIdAsync(order.OrderItems.ElementAt(i).ProductId);
                sum += Convert.ToInt32(product.Price)* Convert.ToInt32((order.OrderItems.ElementAt(i).Quantity));
            }
            if (sum != order.OrderSum)
            {
                _logger.LogInformation("user id: {0} try to still by {1} $, in date {2}\n\n",order.UserId,order.OrderSum-sum,DateTime.Now.ToString());
                order.OrderSum = sum;
            }
            return await _orderRepository.addOrder(order);
        }
    }
}
