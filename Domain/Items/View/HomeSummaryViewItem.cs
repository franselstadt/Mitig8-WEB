using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Items.View
{
    public class HomeSummaryViewItem : ViewItem
    {
        public int Notifications { get; set; }

        public int Assessments { get; set; }

        public int Users { get; set; }

        public int Invoices { get; set; }

        public int TotalAssessments { get; set; }

        public int Insurers { get; set; }

        public int Assessors { get; set; }

        public int Specialists { get; set; }
    }
}
