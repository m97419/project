using Services;
using Microsoft.EntityFrameworkCore;
using Repositories;
using Entities;
using NLog.Web;
using project.Middleware;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddControllers();
builder.Services.AddTransient<IUserRepository, UserRepository>();
builder.Services.AddTransient<ICategoryRepository, CategoryRepository>();
builder.Services.AddTransient<IProductRepository, ProductRepository>();
builder.Services.AddTransient<IOrderRepository, OrderRepository>();
builder.Services.AddTransient<IUserServices, UserServices>();
builder.Services.AddTransient<ICategoryServices, CategoryServices>();
builder.Services.AddTransient<IProductServices, ProductServices>();
builder.Services.AddTransient<IOrderServices, OrderServices>();

builder.Services.AddDbContext<Store214364960Context>(option => option.UseSqlServer(builder.Configuration.GetConnectionString("MyWinterStore")));
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

builder.Host.UseNLog();

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseErrorHandlingMiddleware();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseAuthorization();

app.MapControllers();

app.Run();
