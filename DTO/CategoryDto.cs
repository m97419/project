using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class CategoryDto
    {
        public int CategoryId { get; set; }

        [StringLength(20)]
        public string? CategoryName { get; set; }
    }
}
