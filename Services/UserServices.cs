
using DTO;
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

        public async Task<UserDetailsDto> addUserAsync(newUserDto user)
        {
            try
            {
                user = await _userRepository.addUser(user);
            }
            catch (Exception)
            {
                throw;
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