using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Items.View
{
    public class AssessmentWorklistViewItem : ViewItem
    {
        public int AssessmentID { get; set; }

        public string InsurerName { get; set; }

        public string PolicyNumber { get; set; }

        public string AssessmentDate { get; set; }

        public string BookingDate { get; set; }

        public string InsuredName { get; set; }

        public string InsuredAddress { get; set; }

        public string InsuredContactNumber { get; set; }

        public string InsuredIndustrySector { get; set; }

        public string Status { get; set; }

        public bool IsPolicyCaptureInProgress { get; set; }
    }
}
