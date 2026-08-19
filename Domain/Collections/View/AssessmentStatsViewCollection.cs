using Mitig8.Domain.Collections.View;
using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Collections.View
{
    public class AssessmentStatsViewCollection : ViewCollection<AssessmentStatsViewItem>
    {
        public int UserID { get; set; }
    }
}
