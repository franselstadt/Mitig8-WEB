using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Items.View
{
    public class CompanyListViewItem : ViewItem
    {
        public int CompanyID { get; set; }

        public string Name { get; set; }

        public string Type { get; set; }

        public string Tell { get; set; }

        public string Email { get; set; }

        public string Registration { get; set; }
    }
}
