using System.Collections.Generic;
using System.Threading.Tasks;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Collections.Interfaces
{
    public interface IItemCollection<TItem>
        where TItem : BaseItem
    {
        List<TItem> Items { get; set; }

        void CreateItems();

        Task CreateItemsAsync();

        void ReadItems();

        Task ReadItemsAsync();

        void UpdateItems();

        Task UpdateItemsAsync();

        void DeleteItems();

        Task DeleteItemsAsync();
    }
}
