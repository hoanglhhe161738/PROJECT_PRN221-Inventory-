using System;
using System.Collections.Generic;

namespace PROJECT_PRN211.Models
{
    public partial class Supplier
    {
        public Supplier()
        {
            BillImports = new HashSet<BillImport>();
            Products = new HashSet<Product>();
        }

        public int SupplierId { get; set; }
        public string? SupplierName { get; set; }

        public virtual ICollection<BillImport> BillImports { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
