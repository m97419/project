using System.ComponentModel.DataAnnotations;

namespace DTO
{
    public class UserLoginDto
    {
        [EmailAddress,StringLength(30)]
        public string Email { get; set; }

        [StringLength(15)]
        public string Password { get; set; }
    }
}