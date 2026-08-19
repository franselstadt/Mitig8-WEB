using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class WalletItem : BaseItem
    {
        public int? UserID { get; set; }

        public int? Active { get; set; }

        public int? WalletStatusID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string ProofOfIdentification { get; set; }

        public string ProofOfAddress { get; set; }
    }
}
