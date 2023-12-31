﻿using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Services;
using AutoMapper;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly ICategoryService _categoryService;
        private readonly IMapper _mapper;

        public CategoriesController(ICategoryService categoryServices, IMapper mapper)
        {
            _categoryService = categoryServices;
            _mapper = mapper;
        }

        // GET: api/<CategoriesController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CategoryDto>>> Get()
        {
                IEnumerable<Category> categories = await _categoryService.getAllCategories();
                List<CategoryDto> categoryDtos = _mapper.Map< IEnumerable<Category>, List<CategoryDto>>(categories);
                return categoryDtos!=null? Ok(categoryDtos):NoContent();
        }
    }
}
