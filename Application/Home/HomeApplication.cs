using Mitig8.Domain.Collections.View;
using Mitig8.Domain.Items.View;

namespace Mitig8.Application.Home
{
    public class HomeApplication
    {
        public HomeSummaryViewItem ReadSummary(int userID, int companyID)
        {
            HomeSummaryViewCollection collection = new HomeSummaryViewCollection();
            collection.UserID = userID;
            collection.CompanyID = companyID;
            collection.ReadItems();
            if (collection.Items.Count == 0)
            {
                return new HomeSummaryViewItem();
            }

            return collection.Items[0];
        }
    }
}
