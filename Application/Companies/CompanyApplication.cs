using System.Collections.Generic;
using Mitig8.Domain.Collections.View;
using Mitig8.Domain.Items.View;

namespace Mitig8.Application.Companies
{
    public class CompanyApplication
    {
        public List<CompanyListViewItem> ReadAll()
        {
            CompanyListViewCollection collection = new CompanyListViewCollection();
            collection.ReadItems();
            return collection.Items;
        }
    }
}
