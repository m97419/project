using Entities;

namespace Repositories
{
    public interface IUserRepository
    {
        Task<User> addUser(User user);
        Task apdateUser(int id, User user);
        Task<User?> getUserByNameAndPassword(string name, string password);
    }
}