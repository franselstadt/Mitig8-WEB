using Mitig8.Domain.Collections.View;
using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Collections.View
{
    public class BillingStatsViewCollection : ViewCollection<BillingStatsViewItem>
    {
        public int UserID { get; set; }
    }
}
