using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IceBear.UI.MVC.Startup))]
namespace IceBear.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
