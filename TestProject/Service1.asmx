<%@ WebService Language="C#" Class="TestProject.Service1" %>
using System;
using System.Web;
using System.Web.Services;

namespace TestProject
{
	class Service1
	{
		[WebMethod]
		// NOTE THAT METHOD DOESN'T HAVE ANY PARAMETERS!
		// INSTEAD WE GRAB ADDITIONAL DATA FROM HttpContext.Current.Request.Form
		// SEE date VARIABLE
		public string WorkerDocumentsSave()
		{
			string date = HttpContext.Current.Request.Form.Get("date");

			HttpPostedFile uploadedFile = HttpContext.Current.Request.Files[0];
			using (var fileStream = new System.IO.FileStream(AppDomain.CurrentDomain.BaseDirectory + uploadedFile.FileName, System.IO.FileMode.Create, System.IO.FileAccess.Write))
			{
	        	uploadedFile.InputStream.CopyTo(fileStream);
	        }

	        string response = "";
	        response += "Received date: " + date + ", ";
	        response += "Uploaded file to " + AppDomain.CurrentDomain.BaseDirectory + uploadedFile.FileName;

	        return response;
		}
	}
}
