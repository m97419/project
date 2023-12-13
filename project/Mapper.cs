using AutoMapper;
using DTO;
using Entities;

namespace project
{
    public class Mapper : Profile
    {
        public Mapper()
        {
            //to check when to do reverse!
            CreateMap<Category, CategoryDto>();
            CreateMap<Order, OrderDto>().ReverseMap();
            CreateMap<User, UserDetailsDto>().ReverseMap();
            CreateMap<Product, ProductDto>();
            CreateMap<OrderItem, OrderItemDto>().ReverseMap();
            CreateMap<FullUserDto, User>().ReverseMap();
            CreateMap<User, UserLoginDto>().ReverseMap();
        }

    }
}