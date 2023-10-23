using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8
{
    public enum NotifierType { success, info, warn };

    public class Notifier
    {
        public Control _Page { get; set; }
        public Control _Object { get; set; }


        public void Page(Control Page)
        {
            this._Page = Page;
        }

        public void Show(string Message, NotifierType Type)
        {
            try
            {
                if (_Object == null)
                {
                    string script = "$.notify('" + Message + "', '" + Type.ToString() + "');";
                    ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), script, true);
                }
                else
                {
                    try
                    {
                        string script = "$('#" + _Object.ClientID.ToString() + "').notify('" + Message + "', '" + Type.ToString() + "');";
                        ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), script, true);
                    }
                    catch
                    {
                        string script = "$.notify('" + Message + "', '" + Type.ToString() + "');";
                        ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), script, true);
                    }
                }
            }
            catch
            {
                string script = "$.notify('" + Message + "', '" + Type.ToString() + "');";
                ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), script, true);
            }

        }


    }
}