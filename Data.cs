using System;
using System.Data;
using Mitig8.Workers;

namespace Mitig8
{
    public class Data
    {
        private ReportWorker reportWorker = new ReportWorker();

        public DataTable repAssessmentRisk(int UserID, DateTime DateFrom, DateTime DateTo)
        {
            return this.reportWorker.ReadAssessmentRisk(UserID, DateFrom, DateTo);
        }

        public DataTable repValuationSummary(int UserID, DateTime DateFrom, DateTime DateTo)
        {
            return this.reportWorker.ReadValuationSummary(UserID, DateFrom, DateTo);
        }
    }
}
