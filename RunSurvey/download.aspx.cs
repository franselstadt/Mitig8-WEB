using Newtonsoft.Json;
using RestSharp;
using SelectPdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mitig8.RunSurvey
{
    public partial class download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string SurveyID = Request.QueryString["s"].ToString();
            var client = new RestClient("https://restpack.io/api/html2pdf/v7/convert");
            var request = new RestRequest(Method.POST);

            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/json");
            request.AddParameter("application/json", "{\"access_token\":\"9QS8IBHAsRhbtm28O1ksVQ5XKithTMfDqz0DXb4hmx4GCN9d\",\"json\":\"true\",\"url\":\"https://web.mitig8.co.za/runsurvey/x?y="+SurveyID+"&n=0&a=32&xmode=1\",\"pdf_height\":\"200in\",\"pdf_width\":\"13.3in\",\"delay\":\"20000\"}", ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);

            Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(response.Content.ToString());
            Response.Redirect(myDeserializedClass.file.ToString());
        }
    }



    public class Root
    {
        public string cached { get; set; }
        public string contenttype { get; set; }
    public string file { get; set; }
    public string height { get; set; }
    public string image { get; set; }
    public int length { get; set; }
    public string remote_status { get; set; }
    public string run_time { get; set; }
    public string url { get; set; }
    public string width { get; set; }
}


}