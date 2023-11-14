using System;
using System.Collections.Generic;

namespace PROJECT_PRN221.Models
{
    public partial class Role
    {
        public Role()
        {
            Accounts = new HashSet<Account>();
            Features = new HashSet<Feature>();
        }

        public int RId { get; set; }
        public string RName { get; set; } = null!;

        public virtual ICollection<Account> Accounts { get; set; }

        public virtual ICollection<Feature> Features { get; set; }
    }
}
