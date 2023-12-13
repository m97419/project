using Microsoft.AspNetCore.Mvc;
using Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace project.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValidationsController : ControllerBase
    {
        private readonly IValidationService _validationService;
        public ValidationsController(IValidationService validationService)
        {
            _validationService = validationService;
        }

        // POST api/<ValidationsController>
        [HttpPost]
        public ActionResult<int> Post([FromBody] string password)
        {
            int score = _validationService.checkPassword(password);
            return Ok(score);
        }
    }
}
