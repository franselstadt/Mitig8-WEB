using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class SessionItem : BaseItem
    {
        public int? UserID { get; set; }

        public string IPAddress { get; set; }

        public DateTime? SessionDate { get; set; }

        public int? SocketID { get; set; }

        public int? Active { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string Pin { get; set; }

        public string Token { get; set; }

        public int? ApplicationID { get; set; }

        public string TokenTitle { get; set; }

        public string TokenMessage { get; set; }

        public string TokenStatus { get; set; }
    }
}
