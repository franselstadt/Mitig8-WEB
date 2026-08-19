using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class AssessmentItem : BaseItem
    {
        public int? AssessmentTypeID { get; set; }

        public int? AssessmentStatusID { get; set; }

        public int? UserID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string Reference { get; set; }

        public string OtherReference { get; set; }

        public string CustomerReference { get; set; }

        public string PolicyReference { get; set; }

        public string SurveyJSON { get; set; }

        public string SurveyJSONResult { get; set; }

        public decimal? Quote { get; set; }

        public int? DistrictID { get; set; }

        public string Address1 { get; set; }

        public string Address2 { get; set; }

        public string AddressInstructions { get; set; }

        public string ContactPerson { get; set; }

        public string ContactCellphone { get; set; }

        public string ContactEmail { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public string InsurerName { get; set; }

        public string InsurerContactPerson { get; set; }

        public string InsurerContactNumber { get; set; }

        public string InsurerPolicyNumber { get; set; }

        public string BrokerName { get; set; }

        public string BrokerContactPerson { get; set; }

        public string BrokerContactNumber { get; set; }

        public string InsuredName { get; set; }

        public string InsuredContactNumber { get; set; }

        public string InsuredIndustrySector { get; set; }

        public string InsurancePolicyNumber { get; set; }

        public string InsurerEmailAddress { get; set; }

        public string InsuredEmailAddress { get; set; }

        public string BrokerEmailAddress { get; set; }

        public int? NewPolicy { get; set; }

        public int? FileUploadCapture { get; set; }

        public int? IndustrySectorID { get; set; }

        public int? IndustrySubSectorID { get; set; }

        public int? IndustrySectorClassID { get; set; }

        public decimal? EML { get; set; }

        public decimal? MPL { get; set; }

        public string RiskComments { get; set; }

        public string MPLComments { get; set; }

        public string EMLComments { get; set; }

        public DateTime? BookingDate { get; set; }

        public string BookingConfirmedBy { get; set; }

        public string BookingConfirmedByContact { get; set; }

        public string BookingNote { get; set; }

        public string Special { get; set; }

        public int? IsInternal { get; set; }

        public string ClaimNumber { get; set; }

        public string StreetNumber { get; set; }

        public string StreetName { get; set; }

        public string BuildingName { get; set; }

        public string Province { get; set; }

        public string Town { get; set; }

        public string Suburb { get; set; }

        public string PostalCode { get; set; }

        public decimal? TotalValuationAmount { get; set; }

        public DateTime? DateCompleted { get; set; }

        public string AssessmentStatusDescription { get; set; }
    }
}
