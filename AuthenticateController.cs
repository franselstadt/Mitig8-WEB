using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Mitig8.Application.Authentication;
using Mitig8.Domain.Items.View;

namespace Mitig8
{
    public class AuthenticateController : ApiController
    {
        private AuthenticationApplication authenticationApplication = new AuthenticationApplication();

        [HttpGet]
        public HttpResponseMessage getSessionToken([FromUri] string Email, [FromUri] string Password, [FromUri] int Pin, [FromUri] int ApplicationID, [FromUri] string IPAddress)
        {
            try
            {
                SessionTokenViewItem token = this.authenticationApplication.IssueToken(Email, Password, Pin, ApplicationID, IPAddress);
                return this.Request.CreateResponse(HttpStatusCode.OK, new[] { token }.ToList());
            }
            catch (Exception ex)
            {
                return this.Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}
