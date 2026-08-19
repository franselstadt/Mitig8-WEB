using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class WalletAccountItem : BaseItem
    {
        public string AccountNumber { get; set; }

        public int? AccountTypeID { get; set; }

        public int? BankID { get; set; }

        public decimal? Balance { get; set; }

        public int? UserID { get; set; }

        public int? Active { get; set; }

        public int? WalletID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public decimal? Pending { get; set; }
    }
}
