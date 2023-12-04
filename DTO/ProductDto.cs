using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ProductDto
    {
        public int ProductId { get; set; }
        [StringLength(20)]
        public string? CategoryName { get; set; }

        public decimal? Price { get; set; }

        [StringLength(100)]
        public string? Description { get; set; }

        [StringLength(20)]
        public string? Image { get; set; }
    }
}
