using Mitig8.Domain.Collections.View;
using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Collections.View
{
    public class AssessmentWorklistViewCollection : ViewCollection<AssessmentWorklistViewItem>
    {
        public int UserID { get; set; }

        public bool Archived { get; set; }
    }
}
