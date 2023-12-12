namespace Services
{
    public interface IRatingService
    {
        Task<int> addRatingAsync(string host, string method, string path, string referer, string userAgent, DateTime recordDate);
    }
}