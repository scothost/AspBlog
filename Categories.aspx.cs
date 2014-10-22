using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace blog
{
	
	public partial class Categories : System.Web.UI.Page
	{

		private void Page_Load()
		{

			string connectionString = "Server=localhost;Database=myblog;User ID=app_user;Password=dotnetpet;Pooling=false;";
			MySqlConnection dbcon = new MySqlConnection(connectionString);
			dbcon.Open();

			string id = Request.QueryString["id"];  
			string action = Request.QueryString["action"]; 

			if (action == "edit") 
			{
				EditCategory(id,dbcon );
			}

			if (Request.Form ["CategoryName"] != null) 
			{
				UpdateCategory (id, dbcon);
			}

			if (Request.QueryString["action"] == "delete")
			{
				DeleteCategory(Request.QueryString["id"],dbcon);
				//Response.Redirect("Default.aspx");
			}


			MySqlDataAdapter CategoryAdapter = new MySqlDataAdapter("SELECT CategoryID, CategoryName FROM Categories WHERE CategoryID != 0", dbcon);
			DataSet Categoryds = new DataSet();
			CategoryAdapter.Fill(Categoryds, "result");

			DataTable dt = new DataTable();
			CategoryAdapter.Fill(dt);

			CategoryTableControl.DataSource = dt;
			CategoryTableControl.DataBind();

			MySqlDataAdapter FooterAdapter = new MySqlDataAdapter("SELECT ConfigValue FROM Config WHERE ConfigKey = 'footer'", dbcon);
			DataSet Footerds = new DataSet();
			FooterAdapter.Fill(Footerds, "result");

			CategoryTableControl.DataSource = Categoryds;
			CategoryTableControl.DataBind();

			FooterControl.DataSource = Footerds;
			FooterControl.DataBind();

			dbcon.Close();
			dbcon = null;
		}


		private void EditCategory(string CategoryID,MySqlConnection dbcon )
		{

			MySqlDataAdapter EditCategoryAdapter = new MySqlDataAdapter("SELECT CategoryID, CategoryName FROM Categories WHERE CategoryID = " + CategoryID, dbcon);

			DataSet ds = new DataSet();
			EditCategoryAdapter.Fill(ds, "result");

			EditCategoryControl.DataSource = ds;
			EditCategoryControl.DataBind();


		}

		private void UpdateCategory(string CategoryID,MySqlConnection dbcon )
		{

			MySqlCommand cmd;       
			string name = Request.Form ["CategoryName"];
			cmd  = new MySqlCommand("UPDATE Categories SET CategoryName = ?CategoryName  WHERE CategoryID = ?CategoryID", dbcon);
			cmd.Parameters.AddWithValue("?CategoryID",CategoryID);
			cmd.Parameters.AddWithValue("?CategoryName",name);

			cmd.ExecuteNonQuery();
			Response.Redirect("Categories.aspx");

		}


		private void DeleteCategory(string CategoryID,MySqlConnection dbcon )
		{
			MySqlCommand cmd; 	

			try
			{

			cmd = new MySqlCommand ("DELETE FROM Categories WHERE CategoryID = ?CategoryID", dbcon);
			cmd.Parameters.AddWithValue ("?CategoryID", CategoryID);

			cmd.ExecuteNonQuery ();
			Response.Redirect("Categories.aspx");
			}
			catch( Exception ex ) {
				Response.Write ("<br><p class='error'><font size='4' color='red'><center>**** SQL Error:</font><br><font color='red' size='2'>" + ex.Message + "</p><br> Is this category in use by a Post?<br></font><br>");
			}

		}
	}
}

