using System;
using System.Collections.Generic;

namespace PROJECT_PRN221.Models
{
    public partial class Product
    {
        public Product()
        {
            BillOutputs = new HashSet<BillOutput>();
        }

        public int ProductId { get; set; }
        public string? ProductName { get; set; }
        public DateTime? DateManufacture { get; set; }
        public DateTime? DateExpiration { get; set; }
        public decimal? Quantity { get; set; }
        public decimal? Price { get; set; }
        public int? CategoryId { get; set; }
        public int? SupplierId { get; set; }

        public virtual CategoryId? Category { get; set; }
        public virtual Supplier? Supplier { get; set; }
        public virtual ICollection<BillOutput> BillOutputs { get; set; }
    }
}
