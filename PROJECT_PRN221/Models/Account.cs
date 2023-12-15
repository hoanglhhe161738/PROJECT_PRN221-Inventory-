using System;
using System.Collections.Generic;

namespace PROJECT_PRN211.Models
{
    public partial class Account
    {
        public Account()
        {
            Users = new HashSet<User>();
        }

        public int AId { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public int? RId { get; set; }

        public virtual Role? RIdNavigation { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
