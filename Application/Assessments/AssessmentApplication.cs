using System.Collections.Generic;
using Mitig8.Domain.Collections.View;
using Mitig8.Domain.Items;
using Mitig8.Domain.Items.View;

namespace Mitig8.Application.Assessments
{
    public class AssessmentApplication
    {
        public List<AssessmentWorklistViewItem> ReadActive(int userID)
        {
            AssessmentWorklistViewCollection collection = new AssessmentWorklistViewCollection();
            collection.UserID = userID;
            collection.Archived = false;
            collection.ReadItems();
            return collection.Items;
        }

        public List<AssessmentWorklistViewItem> ReadArchive(int userID)
        {
            AssessmentWorklistViewCollection collection = new AssessmentWorklistViewCollection();
            collection.UserID = userID;
            collection.Archived = true;
            collection.ReadItems();
            return collection.Items;
        }

        public AssessmentStatsViewItem ReadStats(int userID)
        {
            AssessmentStatsViewCollection collection = new AssessmentStatsViewCollection();
            collection.UserID = userID;
            collection.ReadItems();
            if (collection.Items.Count == 0)
            {
                return new AssessmentStatsViewItem();
            }

            return collection.Items[0];
        }

        public AssessmentItem Read(int assessmentID)
        {
            AssessmentItem item = new AssessmentItem();
            item.ID = assessmentID;
            item.Read();
            return item;
        }

        public AssessmentItem Create(AssessmentItem item)
        {
            item.Create();
            return item;
        }

        public void Update(AssessmentItem item)
        {
            item.Update();
        }

        public void Cancel(int assessmentID, int userID)
        {
            AssessmentItem item = new AssessmentItem();
            item.ID = assessmentID;
            item.UserID = userID;
            item.Delete();
        }
    }
}
