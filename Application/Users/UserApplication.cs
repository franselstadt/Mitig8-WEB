using System.Collections.Generic;
using Mitig8.Domain.Collections;
using Mitig8.Domain.Items;

namespace Mitig8.Application.Users
{
    public class UserApplication
    {
        public UserItem Read(int userID)
        {
            UserItem item = new UserItem();
            item.ID = userID;
            item.Read();
            return item;
        }

        public void UpdateProfile(UserItem item)
        {
            item.Update();
        }

        public List<UserItem> ReadCompanyUsers(int companyID)
        {
            UserCollection collection = new UserCollection();
            collection.CompanyID = companyID;
            collection.ReadItems();
            return collection.Items;
        }
    }
}
