using System.Threading.Tasks;

namespace Mitig8.Domain.Items.Interfaces
{
    public interface IItem
    {
        int ID { get; set; }

        void Create();

        Task CreateAsync();

        void Read();

        Task ReadAsync();

        void Update();

        Task UpdateAsync();

        void Delete();

        Task DeleteAsync();
    }
}
