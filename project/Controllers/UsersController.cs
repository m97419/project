using DTO;
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
        private readonly Services.IUserServices _userServices;
        private readonly Services.IValidationService _validationService;

        public UsersController(Services.IUserServices userServices, Services.IValidationService validationService)
        {
            _userServices = userServices;
            _validationService = validationService;
        }

        // GET: api/<UsersController>
        [HttpPost]
        public async Task<ActionResult<UserDetailsDto>> POST([FromBody] UserLoginDto userLoginDto)
        {
            try
            {
                User? user = await _userServices.getUserByNameAndPasswordAsync(userLoginDto.Email, userLoginDto.Password);
                //parse to user details
                return user != null ? Ok(user) : NoContent();
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
        public async Task<ActionResult<UserDetailsDto>> Post([FromBody] newUserDto user)
        {
            try
            {
                User newUser = await _userServices.addUserAsync(user);
                //parse to user details
                return newUser != null? CreatedAtAction(nameof(Get), new { id = newUser.UserId }, newUser) : NoContent();
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
    }
}