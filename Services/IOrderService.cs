﻿using Entities;

namespace Services
{
    public interface IOrderService
    {
        Task<Order> addOrder(Order order);
    }
}