using System;
using System.Threading.Tasks;
using Mitig8.Domain.Items.Interfaces;

namespace Mitig8.Domain.Items.Base
{
    public abstract class BaseItem : IItem
    {
        public static IItemPersistence Persistence { get; set; }

        public int ID { get; set; }

        public virtual void Create()
        {
            BaseItem.EnsurePersistence();
            BaseItem.Persistence.Create(this);
        }

        public virtual Task CreateAsync()
        {
            BaseItem.EnsurePersistence();
            return BaseItem.Persistence.CreateAsync(this);
        }

        public virtual void Read()
        {
            BaseItem.EnsurePersistence();
            BaseItem.Persistence.Read(this);
        }

        public virtual Task ReadAsync()
        {
            BaseItem.EnsurePersistence();
            return BaseItem.Persistence.ReadAsync(this);
        }

        public virtual void Update()
        {
            BaseItem.EnsurePersistence();
            BaseItem.Persistence.Update(this);
        }

        public virtual Task UpdateAsync()
        {
            BaseItem.EnsurePersistence();
            return BaseItem.Persistence.UpdateAsync(this);
        }

        public virtual void Delete()
        {
            BaseItem.EnsurePersistence();
            BaseItem.Persistence.Delete(this);
        }

        public virtual Task DeleteAsync()
        {
            BaseItem.EnsurePersistence();
            return BaseItem.Persistence.DeleteAsync(this);
        }

        private static void EnsurePersistence()
        {
            if (BaseItem.Persistence == null)
            {
                throw new InvalidOperationException("Domain item persistence has not been composed. Call Architecture.CompositionRoot.Compose() at startup.");
            }
        }
    }
}
