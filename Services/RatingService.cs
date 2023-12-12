using Entities;
using Repositories;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class RatingService : IRatingService
    {
        private readonly IRatingRepository _ratingRepository;

        public RatingService(IRatingRepository ratingRepository)
        {
            _ratingRepository = ratingRepository;
        }

        public async Task<int> addRatingAsync(string? host, string method, string path, string? referer, string? userAgent, DateTime recordDate)
        {
            Rating rating = new Rating();
            rating.Host = host;
            rating.Method = method;
            rating.Path = path;
            rating.Referer = referer;
            rating.UserAgent = userAgent;
            rating.RecordDate = recordDate;
            int updated = await _ratingRepository.addRatingAsync(rating);
            return updated;
        }
    }
}
