using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class NotificationItem : BaseItem
    {
        public int? NotificationTypeID { get; set; }

        public string Title { get; set; }

        public string Message { get; set; }

        public int? IsHTML { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? NotifyDate { get; set; }

        public int? UserID { get; set; }

        public int? NotificationStatusID { get; set; }
    }
}
