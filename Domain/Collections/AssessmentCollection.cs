using Mitig8.Domain.Collections.Base;
using Mitig8.Domain.Items;

namespace Mitig8.Domain.Collections
{
    public class AssessmentCollection : BaseCollection<AssessmentItem>
    {
        public int? UserID { get; set; }
    }
}
