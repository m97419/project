
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

        public User addUser(User user)
        {
            if (checkPassword(user.Password) > 2)
            {
                try
                {
                    user = _userRepository.addUser(user).Result;
                }
                catch (Exception)
                {
                    throw;
                }
            }
            return user;
        }

        public User? getUserByNameAndPassword(string name, string password)
        {
            try
            {
                User? user = _userRepository.getUserByNameAndPassword(name, password).Result;
                return user;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void apdateUser(int id, User user)
        {
            try
            {
                _userRepository.apdateUser(id, user);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}