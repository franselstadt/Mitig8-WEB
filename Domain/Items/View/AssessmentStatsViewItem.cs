using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Items.View
{
    public class AssessmentStatsViewItem : ViewItem
    {
        public int Created { get; set; }

        public int Quoting { get; set; }

        public int InProgress { get; set; }

        public int Complete { get; set; }

        public int Failed { get; set; }

        public int Cancelled { get; set; }

        public int QA { get; set; }
    }
}
