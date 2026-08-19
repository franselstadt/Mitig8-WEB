using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class CompanyItem : BaseItem
    {
        public string Description { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public string Code { get; set; }

        public string ContactPerson { get; set; }

        public string Email { get; set; }

        public string TellNo { get; set; }

        public string CellNo { get; set; }

        public string Address1 { get; set; }

        public string Address2 { get; set; }

        public string Town { get; set; }

        public string PostalCode { get; set; }

        public string Longitude { get; set; }

        public string Latitude { get; set; }

        public string Country { get; set; }

        public int? UserID { get; set; }

        public int? CompanyTypeID { get; set; }

        public string RegistrationNumber { get; set; }

        public decimal? Rating { get; set; }

        public string VATRegNo { get; set; }

        public decimal? AssessorMaxPolicyValue { get; set; }

        public int? OrganizationID { get; set; }

        public string BankName { get; set; }

        public string BankAccountType { get; set; }

        public string BankAccountNumber { get; set; }

        public string BankAccountNotes { get; set; }

        public string CompanyTypeDescription { get; set; }
    }
}
