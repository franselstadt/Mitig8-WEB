using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class OrganizationItem : BaseItem
    {
        public string Name { get; set; }

        public int? DistrictID { get; set; }

        public string Address1 { get; set; }

        public string Address2 { get; set; }

        public string Tell { get; set; }

        public string Cell { get; set; }

        public string Email { get; set; }

        public string RegNo { get; set; }

        public string VatNo { get; set; }

        public int? CompanyID { get; set; }

        public DateTime? CreatedDate { get; set; }
    }
}
