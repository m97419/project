using Entities;

namespace Repositories
{
    public interface IRatingRepository
    {
        Task<int> addRatingAsync(Rating rating);
    }
}