using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class InvoiceItem : BaseItem
    {
        public int? BillingEntityID { get; set; }

        public int? BillingEntityTypeID { get; set; }

        public int? FromAccountID { get; set; }

        public int? ToAccountID { get; set; }

        public decimal? Amount { get; set; }

        public decimal? Balance { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string Reference { get; set; }
    }
}
