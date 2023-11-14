using System;
using System.Collections.Generic;

namespace PROJECT_PRN221.Models
{
    public partial class CategoryId
    {
        public CategoryId()
        {
            BillImports = new HashSet<BillImport>();
            Products = new HashSet<Product>();
        }

        public int CategeryId { get; set; }
        public string? CategoryName { get; set; }
        public DateTime? DateImport { get; set; }

        public virtual ICollection<BillImport> BillImports { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
