using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;


public class Modal
{

    public Control _Page { get; set; }
    public String _ID { get; set; }

    public Modal(Control Page)
    {
        this._Page = Page;

    }

    public Modal()
    {


    }

    public void ID(string ID)
    {
        this._ID = ID;

    }


    public void Page(Control Page)
    {
        this._Page = Page;
    }



    public void Open()
    {
        ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').modal('show');$('body').css('padding', '0px');", true);
    }

    public void Close()
    {
        ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('.modal-backdrop').slice(1).remove();$('#" + this._ID + "').modal('hide');if($('.in').length == 1){$('body').removeClass('modal-open');$('.modal-backdrop').remove();};$('body').css('padding', '0px');", true);


    }

    public void Toggle()
    {
        ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').modal('toggle');$('body').css('padding', '0px');", true);


    }


    public void Notify(string Message, bool Success, bool AutoHide)
    {

        if (Success == true)
        {
            if (AutoHide == true)
            {
                ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').find('.modal-header').notify('" + Message + "',{clickToHide: false,className:'success',elementPosition:'bottom right',autoHide:true});", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').find('.modal-header').notify('" + Message + "',{clickToHide: true,className:'success',elementPosition:'bottom right',autoHide:false});", true);

            }
        }
        else
        {
            if (AutoHide == true)
            {
                ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').find('.modal-header').notify('" + Message + "',{clickToHide: false,className:'error',elementPosition:'bottom right',autoHide:true});", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').find('.modal-header').notify('" + Message + "',{clickToHide: true,className:'error',elementPosition:'bottom right',autoHide:false});", true);

            }
        }
    }

    public void Info(string Message, bool AutoHide)
    {
        if (AutoHide == true)
        {
            ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').find('.modal-header').notify('" + Message + "',{clickToHide: false,className:'info',elementPosition:'bottom right',autoHide:true});", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').find('.modal-header').notify('" + Message + "',{clickToHide: true,className:'info',elementPosition:'bottom right',autoHide:false});", true);

        }
    }


    public void Notify(string Message, bool Success)
    {

        if (Success == true)
        {

            ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').find('.modal-header').notify('" + Message + "',{clickToHide: false,className:'success',elementPosition:'bottom right',autoHide:true});", true);
        }
        else
        {

            ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').find('.modal-header').notify('" + Message + "',{clickToHide: false,className:'error',elementPosition:'bottom right',autoHide:true});", true);
        }
    }

    public void Notify(string Message)
    {
        ScriptManager.RegisterStartupScript(this._Page, GetType(), Guid.NewGuid().ToString(), "$('#" + this._ID + "').find('.modal-header').notify('" + Message + "',{clickToHide: false,elementPosition:'bottom right',autoHide:true});", true);
    }







}
