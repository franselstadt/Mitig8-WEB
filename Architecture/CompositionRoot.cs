using Mitig8.Domain.Collections.Base;
using Mitig8.Domain.Items.Base;
using Mitig8.Infrastructure.Persistence;

namespace Mitig8.Architecture
{
    public static class CompositionRoot
    {
        public static bool IsComposed { get; private set; }

        public static void Compose()
        {
            BaseItem.Persistence = new ItemPersistence();
            CollectionPersistenceHost.Current = new CollectionPersistence();
            CompositionRoot.IsComposed = true;
        }
    }
}
