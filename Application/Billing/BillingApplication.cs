using Mitig8.Domain.Collections.View;
using Mitig8.Domain.Items.View;

namespace Mitig8.Application.Billing
{
    public class BillingApplication
    {
        public BillingStatsViewItem ReadStats(int userID)
        {
            BillingStatsViewCollection collection = new BillingStatsViewCollection();
            collection.UserID = userID;
            collection.ReadItems();
            if (collection.Items.Count == 0)
            {
                return new BillingStatsViewItem();
            }

            return collection.Items[0];
        }
    }
}
