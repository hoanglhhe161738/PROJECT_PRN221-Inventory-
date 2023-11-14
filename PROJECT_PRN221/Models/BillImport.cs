using System;
using System.Collections.Generic;

namespace PROJECT_PRN221.Models
{
    public partial class BillImport
    {
        public int BillImportId { get; set; }
        public DateTime? DateImport { get; set; }
        public int? Amount { get; set; }
        public int? CategoryId { get; set; }
        public int? SupplierId { get; set; }

        public virtual CategoryId? Category { get; set; }
        public virtual Supplier? Supplier { get; set; }
    }
}
