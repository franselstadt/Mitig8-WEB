using System.Threading.Tasks;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Items.Interfaces
{
    public interface IItemPersistence
    {
        void Create(BaseItem item);

        Task CreateAsync(BaseItem item);

        void Read(BaseItem item);

        Task ReadAsync(BaseItem item);

        void Update(BaseItem item);

        Task UpdateAsync(BaseItem item);

        void Delete(BaseItem item);

        Task DeleteAsync(BaseItem item);
    }
}
