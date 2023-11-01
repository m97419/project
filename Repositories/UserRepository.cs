
using Entities;
using System;
using System.IO;
using System.Text.Json;

namespace Repositories
{
    public class UserRepository : IUserRepository
    {
        private string path = "../users.txt";

        public async Task<User> addUser(User user)
        {
            try
            {
                user.id = System.IO.File.ReadLines(path).Count() + 1;
                string text = JsonSerializer.Serialize(user) + Environment.NewLine;
                await System.IO.File.AppendAllTextAsync(path, text);
            }
            catch (Exception)
            {
                throw;
            }
            return user;
        }

        public async Task<User?> getUserByNameAndPassword(string name, string password)
        {
            try
            {
                using (StreamReader reader = System.IO.File.OpenText(path))
                {
                    string currentUserInFile;
                    while ((currentUserInFile = await reader.ReadLineAsync()) != null)
                    {
                        User user = JsonSerializer.Deserialize<User>(currentUserInFile);
                        if (user.name == name && user.password == password)
                        {
                            return user;
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            return null;
        }

        public async Task apdateUser(int id, User user)
        {
            try
            {
                string textToReplace = string.Empty;
                using (StreamReader reader = System.IO.File.OpenText(path))
                {
                    string currentUserInFile;
                    while ((currentUserInFile = await reader.ReadLineAsync()) != null)
                    {
                        Entities.User apdateUser = JsonSerializer.Deserialize<Entities.User>(currentUserInFile);
                        if (apdateUser.id == id)
                        {
                            textToReplace = currentUserInFile;
                            break;
                        }
                    }
                }
                if (textToReplace != string.Empty)
                {
                    string text =await System.IO.File.ReadAllTextAsync(path);
                    text = text.Replace(textToReplace, JsonSerializer.Serialize(user));
                    await System.IO.File.WriteAllTextAsync(path, text);
                }
            }
            catch (Exception)
            {
                throw;
            }

        }

    }
}