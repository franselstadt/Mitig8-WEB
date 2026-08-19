using Mitig8.Domain.Items;
using Mitig8.Domain.Items.View;
using Mitig8.Extensions;

namespace Mitig8.Application.Authentication
{
    public class AuthenticationApplication
    {
        public SessionTokenViewItem IssueToken(string email, string password, int pin, int applicationID, string ipAddress)
        {
            SessionItem session = new SessionItem();
            session.Email = email;
            session.Password = password;
            session.Pin = pin.ToString();
            session.ApplicationID = applicationID;
            session.IPAddress = ipAddress;
            session.Create();

            SessionTokenViewItem view = new SessionTokenViewItem();
            view.Token = session.Token;
            view.Title = session.TokenTitle;
            view.Message = session.TokenMessage;
            view.Status = session.TokenStatus;
            if (string.IsNullOrWhiteSpace(view.Status))
            {
                view.Status = string.IsNullOrWhiteSpace(session.Token) ? "error" : "ok";
            }

            return view;
        }

        public SessionPrincipalViewItem ReadPrincipal(string token)
        {
            SessionPrincipalViewItem principal = new SessionPrincipalViewItem();
            principal.IsAuthenticated = false;

            if (string.IsNullOrWhiteSpace(token))
            {
                return principal;
            }

            SessionItem session = new SessionItem();
            session.Token = token;
            session.Read();

            if (!session.UserID.HasValue || session.UserID.Value <= 0)
            {
                return principal;
            }

            UserItem user = new UserItem();
            user.ID = session.UserID.Value;
            user.Read();

            principal.IsAuthenticated = true;
            principal.SessionID = session.ID;
            principal.UserID = user.ID;
            principal.UserPin = session.Pin.OrEmpty();
            principal.FirstName = user.FirstName.OrEmpty();
            principal.LastName = user.LastName.OrEmpty();
            principal.Email = user.Email.OrEmpty();
            principal.Cellphone = user.Cellphone.OrEmpty();
            principal.IdentityNumber = user.IdentityNumber.OrEmpty();
            principal.UserTypeID = user.UserTypeID.OrZero();
            principal.Picture = user.Picture.OrEmpty();
            principal.Wallpaper = user.Wallpaper.OrEmpty();
            principal.Active = user.Active.OrZero();
            principal.IdentityTypeID = user.IdentityTypeID.OrZero();
            principal.CompanyID = user.CompanyID.OrZero();
            principal.SessionDate = session.SessionDate;
            principal.IPAddress = session.IPAddress.OrEmpty();
            return principal;
        }
    }
}
