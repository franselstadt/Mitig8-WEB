using System;
using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Items.View
{
    public class SessionPrincipalViewItem : ViewItem
    {
        public int SessionID { get; set; }

        public int UserID { get; set; }

        public string UserPin { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string Cellphone { get; set; }

        public string IdentityNumber { get; set; }

        public int UserTypeID { get; set; }

        public string Picture { get; set; }

        public string Wallpaper { get; set; }

        public int Active { get; set; }

        public int IdentityTypeID { get; set; }

        public int CompanyID { get; set; }

        public string CompanyName { get; set; }

        public DateTime? SessionDate { get; set; }

        public string IPAddress { get; set; }

        public bool IsAuthenticated { get; set; }
    }
}
