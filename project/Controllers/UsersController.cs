﻿using AutoMapper;
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
        private readonly Services.IUserService _userServices;
        private readonly Services.IValidationService _validationService;
        private readonly IMapper _mapper;
        private readonly ILogger<UsersController> _logger;

        public UsersController(Services.IUserService userServices, Services.IValidationService validationService, IMapper mapper, ILogger<UsersController> logger)
        {
            _userServices = userServices;
            _validationService = validationService;
            _mapper = mapper;
            _logger = logger;
        }

        // GET: api/<UsersController>
        [HttpGet]
        public async Task<ActionResult<UserDetailsDto>> Get([FromQuery] string email, string password)
        { 
            User? user = await _userServices.getUserByNameAndPasswordAsync(email, password);
            if (user == null) return BadRequest();
            UserDetailsDto userDetails = _mapper.Map<User, UserDetailsDto>(user);
            _logger.LogInformation("Login with user name: {0}, password {1}\n\n", user.Email, user.Password);
            return Ok(userDetails);
        }

        // POST api/<UsersController>
        [HttpPost]
        public async Task<ActionResult<UserDetailsDto>> Post([FromBody] FullUserDto newUser)
        {
            User user = _mapper.Map<FullUserDto, User>(newUser);
            user = await _userServices.addUserAsync(user);
            UserDetailsDto newUserDetails = _mapper.Map<User, UserDetailsDto>(user);
            return newUserDetails != null? CreatedAtAction(nameof(Get), new { id = newUserDetails.UserId }, newUserDetails) : NoContent();
        }

        // PUT                                                                                                                                                                                                                                                               api/<UsersController>/5
        [HttpPut("{id}")]
        public async Task Put(int id, [FromBody] FullUserDto apdateUser)
        {
            User user = _mapper.Map<FullUserDto, User>(apdateUser);
            await _userServices.apdateUserAsync(id, user);
        }

    }
}