using Mitig8.Domain.Collections.Base;
using Mitig8.Domain.Items;

namespace Mitig8.Domain.Collections
{
    public class UserCollection : BaseCollection<UserItem>
    {
        public int? CompanyID { get; set; }
    }
}
