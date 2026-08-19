using System.Web;
using Mitig8.Domain.Items.View;
using Mitig8.Extensions;

namespace Mitig8.Architecture
{
    public sealed class SessionContext
    {
        public int UserID { get; set; }

        public int CompanyID { get; set; }

        public int UserTypeID { get; set; }

        public int IdentityTypeID { get; set; }

        public int Active { get; set; }

        public string Pin { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string Cellphone { get; set; }

        public string IdentityNumber { get; set; }

        public string Picture { get; set; }

        public string Wallpaper { get; set; }

        public bool IsAuthenticated
        {
            get
            {
                return this.UserID > 0;
            }
        }

        public static SessionContext FromCookies(HttpRequest request)
        {
            SessionContext context = new SessionContext();
            if (request == null)
            {
                return context;
            }

            context.UserID = SessionContext.ReadInt(request, "UserID");
            context.CompanyID = SessionContext.ReadInt(request, "CompanyID");
            context.UserTypeID = SessionContext.ReadInt(request, "UserTypeID");
            context.IdentityTypeID = SessionContext.ReadInt(request, "IdentityTypeID");
            context.Active = SessionContext.ReadInt(request, "Active");
            context.Pin = SessionContext.ReadString(request, "Pin");
            context.FirstName = SessionContext.ReadString(request, "FirstName");
            context.LastName = SessionContext.ReadString(request, "LastName");
            context.Email = SessionContext.ReadString(request, "Email");
            context.Cellphone = SessionContext.ReadString(request, "Cellphone");
            context.IdentityNumber = SessionContext.ReadString(request, "IdentityNumber");
            context.Picture = SessionContext.ReadString(request, "Picture");
            context.Wallpaper = SessionContext.ReadString(request, "Wallpaper");
            return context;
        }

        public static SessionContext FromPrincipal(SessionPrincipalViewItem principal)
        {
            SessionContext context = new SessionContext();
            if (principal == null)
            {
                return context;
            }

            context.UserID = principal.UserID;
            context.CompanyID = principal.CompanyID;
            context.UserTypeID = principal.UserTypeID;
            context.IdentityTypeID = principal.IdentityTypeID;
            context.Active = principal.Active;
            context.Pin = principal.UserPin.OrEmpty();
            context.FirstName = principal.FirstName.OrEmpty();
            context.LastName = principal.LastName.OrEmpty();
            context.Email = principal.Email.OrEmpty();
            context.Cellphone = principal.Cellphone.OrEmpty();
            context.IdentityNumber = principal.IdentityNumber.OrEmpty();
            context.Picture = principal.Picture.OrEmpty();
            context.Wallpaper = principal.Wallpaper.OrEmpty();
            return context;
        }

        public void WriteCookies(HttpResponse response)
        {
            if (response == null)
            {
                return;
            }

            this.Write(response, "UserID", this.UserID.ToString());
            this.Write(response, "CompanyID", this.CompanyID.ToString());
            this.Write(response, "UserTypeID", this.UserTypeID.ToString());
            this.Write(response, "IdentityTypeID", this.IdentityTypeID.ToString());
            this.Write(response, "Active", this.Active.ToString());
            this.Write(response, "Pin", this.Pin.OrEmpty());
            this.Write(response, "FirstName", this.FirstName.OrEmpty());
            this.Write(response, "LastName", this.LastName.OrEmpty());
            this.Write(response, "Email", this.Email.OrEmpty());
            this.Write(response, "Cellphone", this.Cellphone.OrEmpty());
            this.Write(response, "IdentityNumber", this.IdentityNumber.OrEmpty());
            this.Write(response, "Picture", this.Picture.OrEmpty());
            this.Write(response, "Wallpaper", this.Wallpaper.OrEmpty());
        }

        private void Write(HttpResponse response, string name, string value)
        {
            response.Cookies[name].Value = value;
        }

        private static string ReadString(HttpRequest request, string name)
        {
            HttpCookie cookie = request.Cookies[name];
            if (cookie == null)
            {
                return string.Empty;
            }

            return cookie.Value.OrEmpty();
        }

        private static int ReadInt(HttpRequest request, string name)
        {
            int value;
            if (int.TryParse(SessionContext.ReadString(request, name), out value))
            {
                return value;
            }

            return 0;
        }
    }
}
