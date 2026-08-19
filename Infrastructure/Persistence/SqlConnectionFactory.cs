using System.Configuration;
using System.Data.Entity.Core.EntityClient;
using System.Data.SqlClient;

namespace Mitig8.Infrastructure.Persistence
{
    public static class SqlConnectionFactory
    {
        public static SqlConnection Create()
        {
            ConnectionStringSettings setting = ConfigurationManager.ConnectionStrings["DataModal"];
            if (setting == null)
            {
                throw new ConfigurationErrorsException("Connection string 'DataModal' is missing from Web.config.");
            }

            EntityConnectionStringBuilder builder = new EntityConnectionStringBuilder(setting.ConnectionString);
            return new SqlConnection(builder.ProviderConnectionString);
        }
    }
}
