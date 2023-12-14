using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace DTO
{
    public class FullUserDto
    {
        [EmailAddress, StringLength(30)]
        public string? Email { get; set; }

        public string? FirstName { get; set; }

        public string? LastName { get; set; }

        [StringLength(15)]
        public string? Password { get; set; }
    }
}
