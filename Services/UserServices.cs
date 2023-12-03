
using Entities;
using System.IO;
using System.Text.Json;

namespace Services
{
    public class UserServices : IUserServices
    {

        private Repositories.IUserRepository _userRepository;

        public UserServices(Repositories.IUserRepository userRepository)
        {
            this._userRepository = userRepository;
        }

        public async Task<User> addUserAsync(User user)
        {
            user = await _userRepository.addUser(user);
            return user;
        }

        public async Task<User?> getUserByNameAndPasswordAsync(string name, string password)
        {
            User? user = await _userRepository.getUserByNameAndPassword(name, password);
            return user;
        }

        public async Task apdateUserAsync(int id, User user)
        {
            await _userRepository.apdateUser(id, user);
        }

    }
}