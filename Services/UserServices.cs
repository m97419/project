
using Entities;
using System.IO;
using System.Text.Json;

namespace Services
{
    public class UserServices : IUserServices
    {

        Repositories.IUserRepository userRepository;

        public UserServices(Repositories.IUserRepository userRepository)
        {
            this.userRepository = userRepository;
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
                    user = userRepository.addUser(user).Result;
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
                User? user = userRepository.getUserByNameAndPassword(name, password).Result;
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
                userRepository.apdateUser(id, user);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}