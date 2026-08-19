using Mitig8.Domain.Collections.Interfaces;

namespace Mitig8.Domain.Collections.Base
{
    public static class CollectionPersistenceHost
    {
        public static ICollectionPersistence Current { get; set; }
    }
}
