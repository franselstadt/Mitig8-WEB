using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8
{

    public enum MessageBoxType { success, warning, error, info, question };
    public class MessageBox
    {

        public Control _Page { get; set; }

        public void Page(Control Page)
        {
            this._Page = Page;
        }

        public void Show(string Message, string Title, MessageBoxType Type)
        {
           string script = "swal.fire('"+Title+"','"+ Message + "','"+Type.ToString()+"');";
           ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), script, true);
        }

    }
}