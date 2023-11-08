﻿using System;
using System.Collections.Generic;

namespace Entities;

public partial class Product
{
    public int ProductId { get; set; }

    public int? CategoryId { get; set; }

    public string? CategoryName { get; set; }

    public decimal? Price { get; set; }

    public string? Description { get; set; }

    public string? Image { get; set; }

    public virtual Category? Category { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();
}
