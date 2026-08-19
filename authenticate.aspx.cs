using System;
using System.Drawing;
using System.Web.UI;
using Mitig8.Application.Authentication;
using Mitig8.Architecture;
using Mitig8.Domain.Items.View;

namespace Mitig8
{
    public partial class authenticate : System.Web.UI.Page
    {
        private Cloud Cloud = new Cloud();
        private AuthenticationApplication authenticationApplication = new AuthenticationApplication();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Cloud.Page(this);
            if (!this.IsPostBack)
            {
                this.Initialize();
            }

            this.Declare();
        }

        public void Initialize()
        {
            try
            {
                this.txtConsole.Text += "Mitig8 [Version 2.0.10586 BETA TEST]" + Environment.NewLine;
                this.txtConsole.Text += "(c)2022 Mitig8 (Pty) Ltd." + Environment.NewLine + Environment.NewLine;
                this.txtConsole.Text += DateTime.Now.ToUniversalTime() + "> Matching against IP Address " + this.Cloud.GetIPAddress() + "." + Environment.NewLine;
            }
            catch (Exception ex)
            {
                this.txtConsole.ForeColor = Color.Red;
                this.txtConsole.Text = DateTime.Now.ToUniversalTime() + " " + ex.Message.ToString();
            }
        }

        public void Declare()
        {
        }

        public void btnAuthenticate_Click(object sender, EventArgs e)
        {
            try
            {
                string token = this.Request.QueryString["Token"].ToString();
                this.txtConsole.Text += DateTime.Now.ToUniversalTime() + "> Gathering session token " + token + " details." + Environment.NewLine;

                SessionPrincipalViewItem principal = this.authenticationApplication.ReadPrincipal(token);
                if (principal.IsAuthenticated)
                {
                    this.txtConsole.Text += DateTime.Now.ToUniversalTime() + "> Attempting to sign in " + principal.Email + Environment.NewLine;
                    SessionContext.FromPrincipal(principal).WriteCookies(this.Response);
                    this.Cloud.JS("setTimeout(function(){$('#btnAuthenticateSuccess').click();},3500);");
                }
                else
                {
                    this.txtConsole.ForeColor = Color.Red;
                    this.txtConsole.Text += DateTime.Now.ToUniversalTime() + "> Invalid session token." + Environment.NewLine;
                    this.Cloud.JS("setTimeout(function(){$('#btnAuthenticateError').click();},3500);");
                }
            }
            catch (Exception ex)
            {
                this.txtConsole.ForeColor = Color.Red;
                this.txtConsole.Text += Environment.NewLine + DateTime.Now.ToUniversalTime() + " " + ex.Message.ToString();
                this.Cloud.JS("setTimeout(function(){$('#btnAuthenticateError').click();},3500);");
            }
        }

        public void btnAuthenticateError_Click(object sender, EventArgs e)
        {
            this.txtConsole.Text += Environment.NewLine + DateTime.Now.ToUniversalTime() + "> UNAUTORIZED." + Environment.NewLine;
            this.Response.Redirect(AppSettings.SecurePortalUrl + "/");
        }

        public void btnAuthenticateSuccess_Click(object sender, EventArgs e)
        {
            this.txtConsole.Text += Environment.NewLine + DateTime.Now.ToUniversalTime() + "> AUTORIZED " + Environment.NewLine;
            this.Response.Redirect("/dashboard.aspx");
        }
    }
}
