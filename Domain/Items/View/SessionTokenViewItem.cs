using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Items.View
{
    public class SessionTokenViewItem : ViewItem
    {
        public string Title { get; set; }

        public string Message { get; set; }

        public string Status { get; set; }

        public string Token { get; set; }
    }
}
