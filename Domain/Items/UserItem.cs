using System;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items
{
    public class UserItem : BaseItem
    {
        public string Pin { get; set; }

        public int? CompanyID { get; set; }

        public string Password { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string Cellphone { get; set; }

        public string IdentityNumber { get; set; }

        public int? UserTypeID { get; set; }

        public string Picture { get; set; }

        public string Wallpaper { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public int? Active { get; set; }

        public int? IdentityTypeID { get; set; }

        public string FirebaseID { get; set; }

        public string FirebaseMessengerID { get; set; }

        public string Signature { get; set; }
    }
}
