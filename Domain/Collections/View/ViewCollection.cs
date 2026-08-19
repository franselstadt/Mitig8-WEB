using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Mitig8.Domain.Collections.Base;
using Mitig8.Domain.Items.View;

namespace Mitig8.Domain.Collections.View
{
    public abstract class ViewCollection<TViewItem>
        where TViewItem : ViewItem
    {
        public List<TViewItem> Items { get; set; }

        protected ViewCollection()
        {
            this.Items = new List<TViewItem>();
        }

        public virtual void CreateItems()
        {
            throw new InvalidOperationException("View collections are read models and cannot be created.");
        }

        public virtual Task CreateItemsAsync()
        {
            throw new InvalidOperationException("View collections are read models and cannot be created.");
        }

        public virtual void ReadItems()
        {
            if (CollectionPersistenceHost.Current == null)
            {
                throw new InvalidOperationException("Domain collection persistence has not been composed. Call Architecture.CompositionRoot.Compose() at startup.");
            }

            CollectionPersistenceHost.Current.ReadItems(this);
        }

        public virtual Task ReadItemsAsync()
        {
            if (CollectionPersistenceHost.Current == null)
            {
                throw new InvalidOperationException("Domain collection persistence has not been composed. Call Architecture.CompositionRoot.Compose() at startup.");
            }

            return CollectionPersistenceHost.Current.ReadItemsAsync(this);
        }

        public virtual void UpdateItems()
        {
            throw new InvalidOperationException("View collections are read models and cannot be updated.");
        }

        public virtual Task UpdateItemsAsync()
        {
            throw new InvalidOperationException("View collections are read models and cannot be updated.");
        }

        public virtual void DeleteItems()
        {
            throw new InvalidOperationException("View collections are read models and cannot be deleted.");
        }

        public virtual Task DeleteItemsAsync()
        {
            throw new InvalidOperationException("View collections are read models and cannot be deleted.");
        }
    }
}
