using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Services;
using System.Threading.Tasks;

namespace project.Middleware
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class RatingMiddleware
    {
        private readonly RequestDelegate _next;

        public RatingMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext httpContext, IRatingService _ratingService)
        {
            string? host = httpContext.Request.Headers.Host;
            string method = httpContext.Request.Method;
            string path = httpContext.Request.Path;
            string? referer = httpContext.Request.Headers.Referer;
            string? userAgent = httpContext.Request.Headers.UserAgent;
            await _ratingService.addRatingAsync(host,method,path,referer,userAgent,DateTime.Now);
            await _next(httpContext);
        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class RatingMiddlewareExtensions
    {
        public static IApplicationBuilder UseRatingMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<RatingMiddleware>();
        }
    }
}
