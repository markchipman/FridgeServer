using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FridgeServer.Startup))]
namespace FridgeServer
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
