using Entities;
using Repositories;

namespace Services
{
    public interface IUserServices
    {
        User addUser(User user);
        void apdateUser(int id, User user);
        int checkPassword(string password);
        User? getUserByNameAndPassword(string name, string password);
    }
}