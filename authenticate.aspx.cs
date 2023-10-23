using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8
{
    public partial class authenticate : System.Web.UI.Page
    {

        Cloud Cloud = new Cloud();
        DataModal DataModal = new DataModal();

        protected void Page_Load(object sender, EventArgs e)
        {
            Cloud.Page(this);
            if (!IsPostBack)
            {
                Initialize();
            }
            Declare();
        }

        public void Initialize()
        {
            try
            {
                txtConsole.Text += "Mitig8 [Version 2.0.10586 BETA TEST]" + Environment.NewLine;
                txtConsole.Text += "(c)2022 Mitig8 (Pty) Ltd." + Environment.NewLine + Environment.NewLine;
                txtConsole.Text += DateTime.Now.ToUniversalTime() + "> Matching against IP Address " + Cloud.GetIPAddress() + "." + Environment.NewLine;
            }
            catch (Exception ex)
            {
                txtConsole.ForeColor = Color.Red;
                txtConsole.Text = DateTime.Now.ToUniversalTime() + " " + ex.Message.ToString();
            }
        }

        public void Declare()
        {

        }

        public void btnAuthenticate_Click(object sender, EventArgs e)
        {
            try
            {
                string token = Request.QueryString["Token"].ToString();
                txtConsole.Text += DateTime.Now.ToUniversalTime() + "> Gathering session token " + token + " details." + Environment.NewLine;
                var Result = DataModal.getSessionDetailsToken(token).ToList();
                if (Result.Count > 0)
                {
                    txtConsole.Text += DateTime.Now.ToUniversalTime() + "> Attempting to sign in " + Result[0].UserEmail + Environment.NewLine;
                    Cloud.SetCookie("UserID", Result[0].UserID.ToString());
                    Cloud.SetCookie("Pin", Result[0].UserPin.ToString());

                    try
                    {
                        var UserDetails = DataModal.getUserDetailsByID(int.Parse(Result[0].UserID.ToString())).ToList()[0];
                        Cloud.SetCookie("FirstName", UserDetails.FirstName);
                        Cloud.SetCookie("LastName", UserDetails.LastName);
                        Cloud.SetCookie("Email", UserDetails.Email);
                        Cloud.SetCookie("Cellphone", UserDetails.Cellphone);
                        Cloud.SetCookie("IdentityNumber", UserDetails.IdentityNumber);
                        Cloud.SetCookie("UserTypeID", UserDetails.UserTypeID.ToString());
                        Cloud.SetCookie("Picture", UserDetails.Picture);
                        Cloud.SetCookie("Wallpaper", UserDetails.Wallpaper);
                        Cloud.SetCookie("Active", UserDetails.Active.ToString());
                        Cloud.SetCookie("IdentityTypeID", UserDetails.IdentityTypeID.ToString());
                        Cloud.SetCookie("CompanyID", UserDetails.CompanyID.ToString());
                    }
                    catch (Exception ex)
                    {
                        Response.Redirect("http://secure.mitig8.co.za/");
                        Cloud.Exception(ex);
                    }

                    Cloud.JS("setTimeout(function(){$('#btnAuthenticateSuccess').click();},3500);");
                }
                else
                {
                    txtConsole.ForeColor = Color.Red;
                    txtConsole.Text += DateTime.Now.ToUniversalTime() + "> Invalid session token." + Environment.NewLine;
                    Cloud.JS("setTimeout(function(){$('#btnAuthenticateError').click();},3500);");
                }
            }
            catch (Exception ex)
            {
                txtConsole.ForeColor = Color.Red;
                txtConsole.Text += Environment.NewLine + DateTime.Now.ToUniversalTime() + " " + ex.Message.ToString();
                Cloud.JS("setTimeout(function(){$('#btnAuthenticateError').click();},3500);");
            }
        }


        public void btnAuthenticateError_Click(object sender, EventArgs e)
        {
            txtConsole.Text += Environment.NewLine + DateTime.Now.ToUniversalTime() + "> UNAUTORIZED." + Environment.NewLine;
            Response.Redirect("http://secure.mitig8.co.za/");

        }

        public void btnAuthenticateSuccess_Click(object sender, EventArgs e)
        {
            txtConsole.Text += Environment.NewLine + DateTime.Now.ToUniversalTime() + "> AUTORIZED " + Environment.NewLine;
            Response.Redirect("/dashboard.aspx");
        }




    }
    }