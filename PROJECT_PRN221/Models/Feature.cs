using System;
using System.Collections.Generic;

namespace PROJECT_PRN211.Models
{
    public partial class Feature
    {
        public Feature()
        {
            RIds = new HashSet<Role>();
        }

        public int FeatureId { get; set; }
        public string? FeatureName { get; set; }

        public virtual ICollection<Role> RIds { get; set; }
    }
}
