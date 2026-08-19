using Mitig8.Domain.Collections.View;
using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Collections.View
{
    public class HomeSummaryViewCollection : ViewCollection<HomeSummaryViewItem>
    {
        public int UserID { get; set; }

        public int CompanyID { get; set; }
    }
}
