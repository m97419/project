using Entities;
using Microsoft.AspNetCore.Mvc;
using Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private IOrderServices _orderServices;

        public OrdersController(IOrderServices orderServices)
        {
            _orderServices = orderServices;
        }

        // POST api/<OrdersController>
        [HttpPost]
        public async Task<ActionResult<Order>> Post([FromBody] Order order)
        {
            try
            {
                order = await _orderServices.addOrder(order);
                return order != null ? CreatedAtAction(nameof(Get), new { id = order.OrderId }, order) : NoContent();
            }
            catch (Exception)
            {
                throw;
            }
        }

        private object Get()
        {
            throw new NotImplementedException();
        }
    }
}