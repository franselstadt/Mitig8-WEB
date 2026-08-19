using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Mitig8.Domain.Collections.Interfaces;
using Mitig8.Domain.Items.Base;

namespace Mitig8.Domain.Collections.Base
{
    public abstract class BaseCollection<TItem> : IItemCollection<TItem>
        where TItem : BaseItem
    {
        public List<TItem> Items { get; set; }

        protected BaseCollection()
        {
            this.Items = new List<TItem>();
        }

        public virtual void CreateItems()
        {
            if (this.Items == null)
            {
                return;
            }

            foreach (TItem item in this.Items)
            {
                item.Create();
            }
        }

        public virtual Task CreateItemsAsync()
        {
            return Task.Run(() => this.CreateItems());
        }

        public virtual void ReadItems()
        {
            BaseCollection<TItem>.EnsurePersistence();
            CollectionPersistenceHost.Current.ReadItems(this);
        }

        public virtual Task ReadItemsAsync()
        {
            BaseCollection<TItem>.EnsurePersistence();
            return CollectionPersistenceHost.Current.ReadItemsAsync(this);
        }

        public virtual void UpdateItems()
        {
            if (this.Items == null)
            {
                return;
            }

            foreach (TItem item in this.Items)
            {
                item.Update();
            }
        }

        public virtual Task UpdateItemsAsync()
        {
            return Task.Run(() => this.UpdateItems());
        }

        public virtual void DeleteItems()
        {
            if (this.Items == null)
            {
                return;
            }

            foreach (TItem item in this.Items)
            {
                item.Delete();
            }
        }

        public virtual Task DeleteItemsAsync()
        {
            return Task.Run(() => this.DeleteItems());
        }

        private static void EnsurePersistence()
        {
            if (CollectionPersistenceHost.Current == null)
            {
                throw new InvalidOperationException("Domain collection persistence has not been composed. Call Architecture.CompositionRoot.Compose() at startup.");
            }
        }
    }
}
