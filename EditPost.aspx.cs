using System;
using System.Data;
using System.Web;
using System.Web.UI;
using MySql.Data.MySqlClient;
namespace blog
{
	
	public partial class EditPost : System.Web.UI.Page
	{



		private void Page_Load()
		{
			string id = Request.QueryString["id"];  

			string connectionString = "Server=localhost;Database=myblog;User ID=app_user;Password=dotnetpet;Pooling=false;";
			MySqlConnection dbcon = new MySqlConnection(connectionString);
			dbcon.Open();

			MySqlDataAdapter ContentAdapter = new MySqlDataAdapter("SELECT PostID, PostTitle  FROM Posts where PostID = " +id, dbcon);
			DataSet Contentds = new DataSet();
			ContentAdapter.Fill(Contentds, "result");


			MySqlDataAdapter ContentAdapter1 = new MySqlDataAdapter("SELECT Posts.PostID, CategoryName, PostTitle,PostSummary,PostText,PostDate FROM PostDetails Left Join Posts on (Posts.PostId = PostDetails.PostID) Left JOIN Categories ON (Categories.CategoryID = Posts.CategoryID) where Posts.PostID = " +id, dbcon);
			DataSet Contentds1 = new DataSet();
			ContentAdapter1.Fill(Contentds1, "result");


			MySqlDataAdapter CategoryAdapter = new MySqlDataAdapter("SELECT CategoryID, CategoryName FROM Categories WHERE CategoryID != 0", dbcon);
			DataSet Categoryds = new DataSet();
			CategoryAdapter.Fill(Categoryds, "result");

			ContentControl.DataSource = Contentds;
			ContentControl.DataBind();

			EditControl.DataSource = Contentds1;
			EditControl.DataBind();

			CategoryControl.DataSource = Categoryds;
			CategoryControl.DataBind();
			CategoryControl.SelectedValue = GetSelectedIndex(id,dbcon);

			dbcon.Close();
			dbcon = null;
		}

		private string GetSelectedIndex(string id,MySqlConnection dbcon)
		{

			MySqlCommand cmd; 	

			cmd = new MySqlCommand("SELECT CategoryID FROM Posts WHERE PostID = ?PostID", dbcon);
			cmd.Parameters.AddWithValue("?PostID",id);
			string SelectedIndex =  (string) cmd.ExecuteScalar().ToString();

			return(SelectedIndex);
		}

	}
}

