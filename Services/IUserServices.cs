using Entities;
using Repositories;

namespace Services
{
    public interface IUserServices
    {
        Task<User> addUserAsync(User user);
        Task apdateUserAsync(int id, User user);
        Task<User?> getUserByNameAndPasswordAsync(string name, string password);
    }
}