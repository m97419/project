using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace Entities;

public partial class Product
{
    public int ProductId { get; set; }

    public int? CategoryId { get; set; }

    [StringLength(20)]
    public string? CategoryName { get; set; }

    public decimal? Price { get; set; }

    [StringLength(100)]
    public string? Description { get; set; }

    [StringLength(20)]
    public string? Image { get; set; }

    [JsonIgnore]
    public virtual Category? Category { get; set; }

    [JsonIgnore]
    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();
}
