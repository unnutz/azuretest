using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Http;

namespace TestProject
{
	public class Global : HttpApplication
	{
		protected void Application_Start()
		{
			AreaRegistration.RegisterAllAreas();
			GlobalConfiguration.Configure(WebApiConfig.Register);
			RouteConfig.RegisterRoutes(RouteTable.Routes);
		}

		protected void Application_BeginRequest()
		{
			Response.Headers.Add("Access-Control-Allow-Origin", "*");
			Response.Headers.Add("Access-Control-Allow-Methods", "*");
			Response.Headers.Add("Access-Control-Allow-Headers", "Content-Type");

			if (Request.HttpMethod == "OPTIONS")
			{
				Response.Flush();
			}
		}
	}
}
