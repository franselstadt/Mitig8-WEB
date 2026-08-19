using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class AssessmentQuoteItem : BaseItem
    {
        public int? AssessmentID { get; set; }

        public int? UserID { get; set; }

        public decimal? Quote { get; set; }

        public DateTime? QuoteDate { get; set; }

        public DateTime? ValidUntilDate { get; set; }

        public int? QuoteStatusID { get; set; }

        public int? QuoteUserID { get; set; }

        public DateTime? QuoteStatusDate { get; set; }

        public int? QuoteCardID { get; set; }

        public DateTime? ServiceDate { get; set; }

        public string Note { get; set; }

        public int? CompanyID { get; set; }

        public decimal? SurchargeFee { get; set; }

        public decimal? AssessorTotal { get; set; }

        public decimal? SpecialistTotal { get; set; }

        public decimal? ProfitTotal { get; set; }

        public decimal? InitialQuoted { get; set; }

        public int? AssessmentRateCardID { get; set; }

        public string VatCode { get; set; }

        public decimal VatAmount { get; set; }

        public string Calculation { get; set; }
    }
}
