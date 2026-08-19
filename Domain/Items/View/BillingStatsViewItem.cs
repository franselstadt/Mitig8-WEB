using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Items.View
{
    public class BillingStatsViewItem : ViewItem
    {
        public decimal AvailableBalance { get; set; }

        public decimal RenewalFee { get; set; }

        public decimal UnpaidInvoices { get; set; }
    }
}
