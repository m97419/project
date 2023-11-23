
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

        public int checkPassword(string password)
        {
            var result = Zxcvbn.Core.EvaluatePassword(password);
            return result.Score;
        }

        public async Task<User> addUserAsync(User user)
        {
            if (checkPassword(user.Password) > 2)
            {
                try
                {
                    user = await _userRepository.addUser(user);
                }
                catch (Exception)
                {
                    throw;
                }
            }
            return user;
        }

        public async Task<User?> getUserByNameAndPasswordAsync(string name, string password)
        {
            try
            {
                User? user = await _userRepository.getUserByNameAndPassword(name, password);
                return user;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task apdateUserAsync(int id, User user)
        {
            try
            {
                await _userRepository.apdateUser(id, user);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}