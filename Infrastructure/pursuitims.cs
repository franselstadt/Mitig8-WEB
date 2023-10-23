using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using RestSharp;





namespace Mitig8.Infrasructure
{
    public class pursuitims
    {

        public class Message
        {
            public string Text { get; set; }
            public int TypeOfMessage { get; set; }
        }

        public class PolicyDetails
        {
            public string Status { get; set; }
            public string PaymentType { get; set; }
            public DateTime InceptionDate { get; set; }
            public DateTime ReviewDate { get; set; }
            public int TotalPremium { get; set; }
            public List<PolicySection> PolicySection { get; set; }
            public string Insurer { get; set; }
            public string BrokerID { get; set; }
            public string BrokerName { get; set; }
            public List<RiskElemement> RiskElemements { get; set; }
        }

        public class PolicySection
        {
            public string ID { get; set; }
            public string Description { get; set; }
            public int Count { get; set; }
        }

        public class QuestionsAndAnswer
        {
            public string Question { get; set; }
            public string Answer { get; set; }
            public int OrderNumber { get; set; }
        }

        public class RiskAddress
        {
            public string Description { get; set; }
            public string RiskAddress1 { get; set; }
            public string RiskAddress2 { get; set; }
            public string RiskAddressSuburb { get; set; }
            public string RiskAddressCity { get; set; }
            public string RiskAddressCode { get; set; }
        }

        public class RiskElemement
        {
            public DateTime StartDate { get; set; }
            public string CoverName { get; set; }
            public int Premium { get; set; }
            public int SumInsured { get; set; }
            public List<QuestionsAndAnswer> QuestionsAndAnswers { get; set; }
            public string Description { get; set; }
        }

        public class Policy
        {
            public string PolicyNumber { get; set; }
            public string PolicyID { get; set; }
            public string InsurerName { get; set; }
            public string InsurerContactName { get; set; }
            public string InsurerContactPhoneNumber { get; set; }
            public string InsurerContactEmail { get; set; }
            public string InsurerdName { get; set; }
            public string InsureredContactNumber { get; set; }
            public string InsureredContactEmail { get; set; }
            public string InsuredIndustrySectorDescription { get; set; }
            public string PolicyStatus { get; set; }
            public List<string> References { get; set; }
            public string Delegate { get; set; }
            public int ExistingPolicy { get; set; }
            public string SpecialRequests { get; set; }
            public List<RiskAddress> RiskAddresses { get; set; }
            public PolicyDetails PolicyDetails { get; set; }
            public bool IsSuccessful { get; set; }
            public List<Message> Messages { get; set; }
        }

        public string Policy_GetPolicyDetails(string PolicyNumber, string UMCode)
        {


            var client = new RestClient("https://app-ppd.pursuit-ims.co.za/Pursuit.PolicyIntergrationRestTest/uma/" + UMCode + "/Policy/GetPolicyDetails?policyNumber=" + PolicyNumber);
            var request = new RestRequest(Method.GET);

            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/json");
           
            IRestResponse response = client.Execute(request);

       
            return response.Content;

        }



    }
}