using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Services;
using AutoMapper;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly IOrderService _orderServices;
        private readonly IMapper _mapper;

        public OrdersController(IOrderService orderServices, IMapper mapper)
        {
            _orderServices = orderServices;
            _mapper = mapper;
        }

        // POST api/<OrdersController>
        [HttpPost]
        public async Task<ActionResult<OrderDto>> Post([FromBody] OrderDto order)
        {
            Order tmpOrder = _mapper.Map<OrderDto, Order>(order);
            tmpOrder = await _orderServices.addOrder(tmpOrder);
            order = _mapper.Map<Order, OrderDto>(tmpOrder);
            return order != null ? CreatedAtAction(nameof(Get), new { id = order.OrderId }, order) : NoContent();
        }

        private object Get()
        {
            throw new NotImplementedException();
        }
    }
}