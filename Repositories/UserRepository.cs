
using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.IO;
using System.Text.Json;

namespace Repositories
{
    public class UserRepository : IUserRepository
    {

        private readonly Store214364960Context _store214364960Context;

        public UserRepository(Store214364960Context store214364960Context)
        {
            _store214364960Context = store214364960Context;
        }

        public async Task<User> addUser(User user)
        {
            await _store214364960Context.AddAsync(user);
            await _store214364960Context.SaveChangesAsync();
            return user;
        }

        public async Task<User?> getUserByNameAndPassword(string name, string password)
        {
            return await _store214364960Context.Users.Where(user => user.Email == name && user.Password == password).FirstOrDefaultAsync();
        }

        public async Task apdateUser(int id, User user)
        {
            user.UserId = id;
            _store214364960Context.Users.Update(user);
            await _store214364960Context.SaveChangesAsync();
        }

    }
}