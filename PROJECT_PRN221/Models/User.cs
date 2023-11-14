using System;
using System.Collections.Generic;

namespace PROJECT_PRN221.Models
{
    public partial class User
    {
        public int UserId { get; set; }
        public string FullName { get; set; } = null!;
        public DateTime? DateOfBirth { get; set; }
        public string? Address { get; set; }
        public int AId { get; set; }

        public virtual Account AIdNavigation { get; set; } = null!;
    }
}
