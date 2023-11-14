using System;
using System.Collections.Generic;

namespace PROJECT_PRN221.Models
{
    public partial class BillOutput
    {
        public int BillOutId { get; set; }
        public int? Amount { get; set; }
        public DateTime? DateSell { get; set; }
        public int? ProductId { get; set; }

        public virtual Product? Product { get; set; }
    }
}
