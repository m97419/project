using Microsoft.AspNetCore.Mvc;
using Repositories;
using System.Text.Json;
using System.Xml.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        Services.IUserServices userServices;
        public UsersController(Services.IUserServices userServices)
        {
            this.userServices = userServices;
        }
        //tytytytytytyyyyyyyyy
        // GET: api/<UsersController>
        [HttpGet]
        public ActionResult<Entities.User> Get([FromQuery] string name,[FromQuery] string password)
        {
            try
            {
                Entities.User? user = userServices.getUserByNameAndPassword(name, password);
                //if (user == null)
                //{
                //    return 





                //}
                return Ok(user);
            }
            catch (Exception)
            {
                return NoContent();
            }
        }

        //// GET api/<UsersController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST api/<UsersController>
        [HttpPost]
        public ActionResult<Entities.User> Post([FromBody] Entities.User user)
        {
            try
            {
                user = userServices.addUser(user);
            }
            catch (Exception)
            {
                throw;
            }
            return CreatedAtAction(nameof(Get), new { id = user.UserId }, user);
        }

        // PUT                                                                                                                                                                                                                                                               api/<UsersController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Entities.User user)
        {
            userServices.apdateUser(id, user);
        }

        //// DELETE api/<UsersController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}

        // Post api/<UsersController>/5
        [HttpPost("{password}")]
        public ActionResult<int> Post(string password)
        {
            int res = userServices.checkPassword(password);
            return Ok(res);
        }
    }
}