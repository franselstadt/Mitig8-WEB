using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Mitig8
{
    public class AuthenticateController : ApiController
    {
        DataModal DataModal = new DataModal();


        //[Route("Authenticate/GetSessionToken")]
        [HttpGet]
        public HttpResponseMessage getSessionToken([FromUri] string Email, [FromUri] string Password, [FromUri] int Pin, [FromUri] int ApplicationID, [FromUri] string IPAddress)
        {
            try
            {
                return Request.CreateResponse(HttpStatusCode.OK, DataModal.getSessionToken(Email, Password, Pin, ApplicationID, IPAddress).ToList());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}


