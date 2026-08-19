using System.Threading.Tasks;

namespace Mitig8.Domain.Collections.Interfaces
{
    public interface ICollectionPersistence
    {
        void CreateItems(object collection);

        Task CreateItemsAsync(object collection);

        void ReadItems(object collection);

        Task ReadItemsAsync(object collection);

        void UpdateItems(object collection);

        Task UpdateItemsAsync(object collection);

        void DeleteItems(object collection);

        Task DeleteItemsAsync(object collection);
    }
}
