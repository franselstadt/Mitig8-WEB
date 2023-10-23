using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Text;
using System.Net;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Mitig8
{
    public class Cloud
    {
        private Control _Page { get; set; }
        public MessageBox MessageBox = new MessageBox();
        private Notifier _Notifier = new Notifier();
        private Modal _Modal = new Modal();
        private Draw _Draw = new Draw();



        public void Page(Control Page)
        {
            Page.Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            this._Page = Page;
            MessageBox.Page(Page);
            _Notifier.Page(Page);
            _Modal.Page(Page);
        }

        public Draw Draw(ControlCollection Controls)
        {
            _Draw.WebControl(Controls, this._Page);
            return _Draw;
        }

        public Draw Draw(WebControl Control)
        {
            _Draw.WebControl(Control, this._Page);
            return _Draw;
        }

        public Draw Draw(HtmlGenericControl Control)
        {
            _Draw.WebControl(Control, this._Page);
            return _Draw;
        }

        public Modal Modal(string ID)
        {
            _Modal.ID(ID);
            return _Modal;
        }

        public Notifier Notifier()
        {
            _Notifier._Object = null;
            return _Notifier;
        }

        public Notifier Notifier(Control Object)
        {
            _Notifier._Object = Object;
            return _Notifier;
        }


        public string GetCookie(string Cookie)
        {
            try
            {
                if (this._Page != null && this._Page.Page.Request.Cookies[Cookie] != null)
                {
                    try { return this._Page.Page.Request.Cookies[Cookie].Value.ToString(); }
                    catch
                    {       // this._Page.Page.Response.Redirect("login.aspx"); return null;
                        Unauthorize(); return "";
                    }
                }
                else
                {
                    // this._Page.Page.Response.Redirect("login.aspx"); return null;
                    Unauthorize(); return "";
                }
            }
            catch
            {
                // this._Page.Page.Response.Redirect("login.aspx"); return null;
                Unauthorize(); return "";
            }

        }

        public void SetCookie(string Cookie, string Value)
        {
            try
            {
                this._Page.Page.Response.Cookies[Cookie].Value = Value;
                //this._Page.Page.Response.Cookies[Cookie].Expires = DateTime.Now.AddDays(7);
            }
            catch { }
        }

        public string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
        }

        public void JS(string JS)
        {
            ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), JS, true);
        }

        public void Exception(Exception ex)
        {
            string Message = ex.Message.Replace("'", "").Replace(",", "");
           // MessageBox.Show(Message, "Exception Error", MessageBoxType.error);
            JS("console.log('" + DateTime.Now.ToUniversalTime().ToString() + "Exception> " + Message + "');");
        }

        private void Unauthorize()
        {
            JS(" $(document).ready(function(){ let timerIntervalUnauthorized; Swal.fire({ title: 'Unauthorized',icon:'error', html: 'You will be redirected in <b></b> milliseconds.', timer: 5000,allowOutsideClick:false, timerProgressBar: true, onBeforeOpen: () => { Swal.showLoading(); timerIntervalUnauthorized = setInterval(() => { Swal.getContent().querySelector('b').textContent = Swal.getTimerLeft(); }, 100); }, onClose: () => { clearInterval(timerIntervalUnauthorized); window.location = 'http://secure.mitig8.co.za'; } }).then((result) => { if (result.dismiss === Swal.DismissReason.timer) { console.log('I was closed by the timer'); } }); });");
        }

        public static string GetCookieStatic(string Cookie)
        {
            try
            {
                return System.Web.HttpContext.Current.Request.Cookies[Cookie].Value.ToString();
            }
            catch
            {
                return "";
            }
        }

        public string Table(DataTable DataTable, string Function, string TableID)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<table id='" + TableID + "' class='hover table table-striped table-bordered dataTable' style='font-size:13px;'>");
            sb.AppendLine("<thead><tr>");
            for (int i = 1; i < (DataTable.Columns.Count); i++)
            {
                sb.AppendLine("<th>" + DataTable.Columns[i].ToString() + "</th>");
            }
            sb.AppendLine("<th>[Controls]</th>");
            sb.AppendLine("</tr></thead><tbody>");
            for (int r = 0; r < DataTable.Rows.Count; r++)
            {
                sb.AppendLine("<tr>");
                for (int c = 1; c < (DataTable.Columns.Count); c++)
                {
                    sb.AppendLine("<td>" + DataTable.Rows[r][c].ToString() + "</td>");
                }
                sb.AppendLine("<td><div style='width:40px;font-weight:500'><a data-placement=\"top\"  style=\"font-size: 12px;padding: 5px;/*color:orange;*/cursor:pointer\" onclick=\"" + Function + "('" + DataTable.Rows[r][0].ToString() + "');\" data-backdrop=\"static\"  data-toggle=\"modal\" ><span class='glyphicon glyphicon-new-window'></span></a></div></td>");
            }

            sb.AppendLine("</tbody>");
            sb.Append("</table>");
            return sb.ToString();
        }
    }


}