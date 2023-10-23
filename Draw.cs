using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.HtmlControls;

namespace Mitig8
{
    public class Draw
    { 

    private WebControl _wControl { get; set; }
    private HtmlGenericControl _htmlControl { get; set; }
    private ControlCollection _wControls { get; set; }
    private Control _Page { get; set; }

    public Draw()
    {

    }


    public void WebControl(ControlCollection Controls, Control Page)
    {
        this._wControls = Controls;
        this._Page = Page;
    }
    public void WebControl(WebControl Control, Control Page)
    {
        this._wControl = Control;
        this._Page = Page;
    }

    public void WebControl(HtmlGenericControl Control, Control Page)
    {
        this._htmlControl = Control;
        this._Page = Page;
    }

    public CSS CSS(string Property)
    {
        CSS _CSS = new CSS();
        _CSS.Property(Property);
        try
        {
            if (_wControl != null)
            {
                _CSS.Control(this._wControl);
            }
            else
            {
                _CSS.Control(this._htmlControl);

            }
        }
        catch { }
        return _CSS;
    }

    public void Disabled(bool disabled)
    {
        string script = "$(" + "'#" + this._wControl.ClientID + "').prop('disabled', " + disabled.ToString().ToLower() + ");";
        ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), script, true);
    }

    public void Highlight()
    {
        this._wControl.BorderColor = Color.Red;
        this._wControl.BorderWidth = 2;
    }

    public void DatePicker()
    {
        string script = "setDatePicker('" + this._wControl.ClientID.ToString() + "');";
        ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), script, true);
    }

    public void DatePicker(string ButtonID)
    {
        string script = "setDatePickerEvent('" + this._wControl.ClientID.ToString() + "','" + ButtonID + "');";
        ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), script, true);
    }

    public void Normal()
    {
        this._wControl.BorderColor = Color.LightGray;
        this._wControl.BorderWidth = 1;
    }

    private void Highlight(WebControl C)
    {
        C.BorderColor = Color.Red;
        C.BorderWidth = 2;
    }

    private void Normal(WebControl C)
    {
        C.BorderColor = Color.LightGray;
        C.BorderWidth = 1;
    }

    public void BackToNormal(string Group)
    {
        foreach (Control c in this._wControls)
        {
            try
            {
                if (c.GetType() == typeof(TextBox))
                {

                    TextBox txt = (TextBox)c;
                    try
                    {
                        if (txt.Attributes["data-group"].ToString() == Group)
                        {

                            Normal(txt);

                        }
                    }
                    catch { }
                }


            }
            catch { }
        }

    }

    public bool Validate(string Group)
    {
        int Counter = 0;
        bool Found = false;

        foreach (Control c in this._wControls)
        {
            try
            {
                if (c.GetType() == typeof(TextBox))
                {

                    TextBox txt = (TextBox)c;
                    try
                    {
                        if (txt.Attributes["data-group"].ToString() == Group)
                        {
                            Found = true;
                            if (txt.Text.Length > 0 && txt.Text != "0")
                            {
                                Normal(txt);
                            }
                            else
                            {
                                Highlight(txt);
                                Counter += 1;
                            }
                        }
                    }
                    catch { }
                }


            }
            catch { }
        }
        if (Counter == 0 && Found == true)
        {
            return true;
        }
        else
        {
            return false;
        }

    }


    public bool Validate(string Group, int Required)
    {
        int Total = 0;
        int Failed = 0;
        bool Found = false; //To Check did we actually find data-validate group

        foreach (Control c in this._wControls)
        {
            try
            {
                if (c.GetType() == typeof(TextBox))
                {

                    TextBox txt = (TextBox)c;
                    try
                    {
                        if (txt.Attributes["data-group"].ToString() == Group)
                        {
                            Total += 1;
                            Found = true;
                            if (txt.Text.Length > 0 && txt.Text != "0")
                            {
                                Normal(txt);
                            }
                            else
                            {
                                Highlight(txt);
                                Failed += 1;
                            }
                        }
                    }
                    catch { }
                }


            }
            catch { }
        }

        if ((Total - Failed) >= Required && Found == true)
        {

            foreach (Control c in this._wControls)
            {
                try
                {
                    if (c.GetType() == typeof(TextBox))
                    {

                        TextBox txt = (TextBox)c;
                        try
                        {
                            if (txt.Attributes["data-group"].ToString() == Group)
                            {
                                Normal(txt);
                            }
                        }
                        catch { }
                    }
                }
                catch { }
            }


            return true;
        }
        else
        {
            return false;
        }

    }


    public void Clear(string Group)
    {

        foreach (Control c in this._wControls)
        {
            try
            {
                if (c.GetType() == typeof(TextBox))
                {

                    TextBox txt = (TextBox)c;
                    try
                    {
                        if (txt.Attributes["data-group"].ToString() == Group)
                        {
                            Normal(txt);
                            txt.Text = "";
                        }
                    }
                    catch { }
                }


            }
            catch { }
        }



    }


    public void Clear()
    {

        foreach (Control c in this._wControls)
        {
            try
            {
                if (c.GetType() == typeof(TextBox))
                {

                    TextBox txt = (TextBox)c;
                    try
                    {

                        Normal(txt);
                        txt.Text = "";

                    }
                    catch { }
                }


            }
            catch { }
        }



    }



    public void X(int Location)
    {
        this._wControl.Style["margin-left"] = Location.ToString() + "px";
    }

    public void Y(int Location)
    {
        this._wControl.Style["margin-top"] = Location.ToString() + "px";
    }

    public int X()
    {
        try
        {
            return int.Parse(this._wControl.Style["margin-left"].ToString().Replace("px", ""));
        }
        catch { return 0; }
    }

    public int Y()
    {
        try
        {
            return int.Parse(this._wControl.Style["margin-top"].ToString().Replace("px", ""));
        }
        catch { return 0; }
    }


}

    public class CSS
    {
        private string _Property { get; set; }
        private WebControl _wControl { get; set; }
        private HtmlGenericControl _htmlControl { get; set; }

        public CSS()
        {

        }

        public void Control(HtmlGenericControl wControl)
        {
            this._htmlControl = wControl;
        }


        public void Control(WebControl wControl)
        {
            this._wControl = wControl;
        }

        public void Property(string Property)
        {
            this._Property = Property;
        }

        public string Get()
        {
            try
            {
                try
                {
                    return this._wControl.Style[this._Property].ToString();
                }
                catch { return null; }
            }
            catch
            {
                try
                {
                    return this._htmlControl.Style[this._Property].ToString();
                }
                catch { return null; }

            }
        }

        public void Set(string Value)
        {
            try
            {

                try
                {
                    try
                    {
                        this._wControl.Style[this._Property] = Value;
                    }
                    catch { this._htmlControl.Style[this._Property] = Value; }
                }
                catch
                {

                    try
                    {
                        this._wControl.Style.Add(this._Property, Value);
                    }
                    catch { this._htmlControl.Style.Add(this._Property, Value); }

                }
            }
            catch { }
        }
    }

}