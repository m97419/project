using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    public class User
    {
        public int id { get; set; }
        [EmailAddress]
        public string name { get; set; }
        [StringLength(20)]
        public string password { get; set; }
        [StringLength(20)]
        public string firstName { get; set; }
        [StringLength(20)]
        public string lastName { get; set; }
    }
}