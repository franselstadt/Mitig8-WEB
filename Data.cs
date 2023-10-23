using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace Mitig8
{
    public class Data
    {

        string s = "Password=Html0195@;Persist Security Info=True;User ID=frans;Initial Catalog=mitig8;Data Source=MITIG8-SERVER\\SQLEXPRESS";

        public DataTable repAssessmentRisk(int UserID, DateTime DateFrom, DateTime DateTo)
        {
            SqlConnection n = new SqlConnection(s);
            SqlCommand c = new SqlCommand("[repAssessmentRisk]", n);
            c.CommandType = CommandType.StoredProcedure;
            var z = c.Parameters;
            z.AddWithValue("@UserID", UserID);
            z.AddWithValue("@DateFrom", DateFrom);
            z.AddWithValue("@DateTo", DateTo);
            DataTable d = new DataTable();
            SqlDataAdapter a = new SqlDataAdapter(c);
            a.Fill(d);return d;
        }



        //  [repValuationSummary]


        public DataTable repValuationSummary(int UserID, DateTime DateFrom, DateTime DateTo)
        {
            SqlConnection n = new SqlConnection(s);
            SqlCommand c = new SqlCommand("[repValuationSummary]", n);
            c.CommandType = CommandType.StoredProcedure;
            var z = c.Parameters;
            z.AddWithValue("@UserID", UserID);
            z.AddWithValue("@DateFrom", DateFrom);
            z.AddWithValue("@DateTo", DateTo);
            DataTable d = new DataTable();
            SqlDataAdapter a = new SqlDataAdapter(c);
            a.Fill(d); return d;
        }



    }
}