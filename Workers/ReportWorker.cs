using System;
using System.Data;
using System.Data.SqlClient;
using Mitig8.Infrastructure.Persistence;

namespace Mitig8.Workers
{
    public class ReportWorker
    {
        public DataTable ReadAssessmentRisk(int userID, DateTime dateFrom, DateTime dateTo)
        {
            return this.ReadProcedure("repAssessmentRisk", userID, dateFrom, dateTo);
        }

        public DataTable ReadValuationSummary(int userID, DateTime dateFrom, DateTime dateTo)
        {
            return this.ReadProcedure("repValuationSummary", userID, dateFrom, dateTo);
        }

        private DataTable ReadProcedure(string procedureName, int userID, DateTime dateFrom, DateTime dateTo)
        {
            using (SqlConnection connection = SqlConnectionFactory.Create())
            {
                using (SqlCommand command = new SqlCommand(procedureName, connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserID", userID);
                    command.Parameters.AddWithValue("@DateFrom", dateFrom);
                    command.Parameters.AddWithValue("@DateTo", dateTo);

                    DataTable table = new DataTable();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(table);
                    }

                    return table;
                }
            }
        }
    }
}
