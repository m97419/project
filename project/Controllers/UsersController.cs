using Entities;
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
        private Services.IUserServices _userServices;
        public UsersController(Services.IUserServices userServices)
        {
            _userServices = userServices;
        }
        
        // GET: api/<UsersController>
        [HttpGet]
        public async Task<ActionResult<User>> Get([FromQuery] string name,[FromQuery] string password)
        {
            try
            {
                Entities.User? user = await _userServices.getUserByNameAndPasswordAsync(name, password);
                return user != null? Ok(user): NoContent();
            }
            catch (Exception)
            {
                throw;
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
        public async Task<ActionResult<User>> Post([FromBody] User user)
        {
            try
            {
                User newUser = await _userServices.addUserAsync(user);
                return newUser != null? CreatedAtAction(nameof(Get), new { id = newUser.UserId }, newUser) : NoContent();
            }
            catch (Exception)
            {
                throw;
            }
        }

        // PUT                                                                                                                                                                                                                                                               api/<UsersController>/5
        [HttpPut("{id}")]
        public async Task Put(int id, [FromBody] Entities.User user)
        {
            await _userServices.apdateUserAsync(id, user);
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
            int res = _userServices.checkPassword(password);
            return Ok(res);
        }
    }
}