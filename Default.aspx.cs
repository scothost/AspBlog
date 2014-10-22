using System;
using System.Data;
using System.Web;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace blog
{

	public partial class Default : System.Web.UI.Page
	{

		private bool LogIn()
		{
			return true;  // Yet to be implemented
		}
		private void Page_Load()
		{		
			string connectionString = "Server=localhost;Database=myblog;User ID=app_user;Password=dotnetpet;Pooling=false;";
			MySqlConnection dbcon = new MySqlConnection(connectionString);
			bool myAuth = LogIn();
			int CategoryFilter = 0;
			string PostQuery = null;

			dbcon.Open ();

			if (Request.Form ["CategoryFilterControl"] != null)
			CategoryFilter = int.Parse (Request.Form ["CategoryFilterControl"]);

			if (!myAuth) {
				Response.Redirect ("LogIn.aspx");
			}
			if (Request.QueryString["action"] == "delete")
			{
				DeletePost(Request.QueryString["id"],dbcon);
				Response.Redirect("Default.aspx");
			}

			if (Request.QueryString["action"] == "edit")
			{
				EditPost(Request.Form["idx"],dbcon);
			}

			if (Request.QueryString["action"] == "add")
			{
				AddPost(dbcon);
			}

			if (Request.QueryString["action"] == "edit" && Request.Form["title"] != null)
			{
				UpdatePost(Request.Form["idx"],dbcon);
				//Response.Write (Request.Form["idx"]);
				Response.Redirect("Default.aspx");
			}

			MySqlDataAdapter ContentAdapter;

			if (CategoryFilter > 0) {
				PostQuery = "SELECT Posts.PostID, CategoryName, PostTitle,PostSummary,PostText,PostDate " +
					    "FROM PostDetails " +
					    "LEFT JOIN Posts ON " +
					    "(Posts.PostId = PostDetails.PostID) " +
					    "LEFT JOIN Categories ON " +
					    "(Categories.CategoryID = Posts.CategoryID) " +
					    "WHERE Posts.CategoryID = " + CategoryFilter;

			} else {
				PostQuery = "SELECT Posts.PostID, CategoryName, PostTitle,PostSummary,PostText,PostDate " +
					    "FROM PostDetails " +
					    "LEFT JOIN Posts ON " +
					    "(Posts.PostId = PostDetails.PostID) " +
					    "LEFT JOIN Categories ON " +
					    "(Categories.CategoryID = Posts.CategoryID) ";

						}

			ContentAdapter = new MySqlDataAdapter (PostQuery, dbcon);
			DataSet ds = new DataSet();
			ContentAdapter.Fill(ds, "result");


			MySqlDataAdapter WelcomeAdapter = new MySqlDataAdapter("SELECT ConfigValue FROM Config WHERE ConfigKey = 'welcome'", dbcon);
			DataSet Welcomeds = new DataSet();
			WelcomeAdapter.Fill(Welcomeds, "result");


			MySqlDataAdapter FooterAdapter = new MySqlDataAdapter("SELECT ConfigValue FROM Config WHERE ConfigKey = 'footer'", dbcon);
			DataSet Footerds = new DataSet();
			FooterAdapter.Fill(Footerds, "result");

			MySqlDataAdapter CategoryAdapter = new MySqlDataAdapter("SELECT CategoryID, CategoryName FROM Categories ", dbcon);
			DataSet Categoryds = new DataSet();
			CategoryAdapter.Fill(Categoryds, "result");




			dbcon.Close();
			dbcon = null;

			WelcomeControl.DataSource = Welcomeds;
			WelcomeControl.DataBind();

			SampleControl.DataSource = ds;
			SampleControl.DataBind();

			FooterControl.DataSource = Footerds;
			FooterControl.DataBind();


			CategoryControl.DataSource = Categoryds;
			CategoryControl.DataBind();

			CategoryControl.SelectedValue = "1".ToString();


			CategoryFilterControl.DataSource = Categoryds;
			CategoryFilterControl.DataBind();


		}	


		private string AddNewCategory(string CategoryName, MySqlConnection dbcon )
		{
		
			MySqlCommand cmd; 	

			cmd = new MySqlCommand ("INSERT INTO Categories (CategoryName) VALUES (?CategoryName)",dbcon);
			cmd.Parameters.AddWithValue("?CategoryName",   CategoryName );
			cmd.ExecuteNonQuery();

			cmd = new MySqlCommand("SELECT MAX(CategoryID) FROM Categories", dbcon);
			string CategoryID =  cmd.ExecuteScalar().ToString();

			return(CategoryID.ToString());



		}

		private void AddPost(MySqlConnection dbcon )
		{
			if (Request.Form["title"] != null)
			{
				string category = Request.Form ["CategoryControl"];  
				string title = Request.Form["title"];
				string summary = Request.Form["summary"];
				string content = Request.Form["content"];  

				// User entered a new category to add
				if (Request.Form ["CategoryName"] != null && Request.Form ["CategoryName"].Length > 0) 
				{
					category = AddNewCategory (Request.Form ["CategoryName"],dbcon);
				}
					
				MySqlCommand cmd; 	


				cmd  = new MySqlCommand("Insert INTO Posts (CategoryID, PostTitle, PostSummary, OwnerID) VALUES (?CategoryID, ?PostTitle, ?PostSummary, ?OwnerID)", dbcon);
				cmd.Parameters.AddWithValue("?CategoryID",   category );
				cmd.Parameters.AddWithValue("?PostTitle",Server.HtmlEncode(title));
				cmd.Parameters.AddWithValue("?PostSummary",Server.HtmlEncode(summary));
				cmd.Parameters.AddWithValue("?OwnerID",   1 );


				cmd.ExecuteNonQuery();

				cmd = new MySqlCommand("SELECT MAX(PostID) AS myPostID FROM Posts", dbcon);
				int count = (int) cmd.ExecuteScalar();


				cmd  = new MySqlCommand("Insert INTO PostDetails (PostID, Sequence, PostText) VALUES (?PostID, ?Sequence, ?PostText)", dbcon);
				cmd.Parameters.AddWithValue("?PostID",count);
				cmd.Parameters.AddWithValue("?Sequence",   1 );
				cmd.Parameters.AddWithValue("?PostText", content);


				cmd.ExecuteNonQuery();
				Response.Redirect("Default.aspx");
			}

		}	

		private void EditPost(string PostID,MySqlConnection dbcon )
		{

			MySqlDataAdapter ContentAdapter = new MySqlDataAdapter("SELECT Posts.PostID, PostTitle,PostText,PostSummary,PostDate FROM PostDetails Left Join Posts on (Posts.PostId = PostDetails.PostID) WHERE Posts.PostID=" +  PostID, dbcon);
			DataSet ds = new DataSet();
			ContentAdapter.Fill(ds, "result");

			EditControl.DataSource = ds;
			EditControl.DataBind();


		}

		private void UpdatePost(string PostID, MySqlConnection dbcon )
		{
			string title = Request.Form["title"];
			string summary = Request.Form["summary"];
			string content = Request.Form["content"]; 
			string category = Request.Form ["CategoryControl"];


			// User entered a new category to add
			if (Request.Form ["CategoryName"] != null && Request.Form ["CategoryName"].Length > 0) 
			{
				category = AddNewCategory (Request.Form ["CategoryName"],dbcon);
			}
				
			MySqlCommand cmd;       
			  
			cmd  = new MySqlCommand("UPDATE Posts SET PostTitle = ?PostTitle,CategoryId = ?CategoryID, PostSummary = ?PostSummary, OwnerID = ?OwnerID  WHERE PostID = ?PostID", dbcon);
			cmd.Parameters.AddWithValue("?PostID",PostID);
			cmd.Parameters.AddWithValue("?CategoryID",category);
			cmd.Parameters.AddWithValue("?PostSummary",summary);
			cmd.Parameters.AddWithValue("?PostTitle",title);
			cmd.Parameters.AddWithValue("?OwnerID",   1 );

			cmd.ExecuteNonQuery();

			cmd  = new MySqlCommand("UPDATE PostDetails SET PostText = ?PostText, Sequence = ?Sequence  WHERE PostID = ?PostID", dbcon);
			cmd.Parameters.AddWithValue("?PostID",PostID);
			cmd.Parameters.AddWithValue("?Sequence",   1 );
			cmd.Parameters.AddWithValue("?PostText", content);

			cmd.ExecuteNonQuery();
			Response.Redirect("Default.aspx");

		}

		private void DeletePost(string PostID,MySqlConnection dbcon )
		{
			MySqlCommand cmd; 	

			cmd  = new MySqlCommand("DELETE FROM Posts WHERE PostID = ?PostID", dbcon);
			cmd.Parameters.AddWithValue("?PostID",PostID);
			cmd.ExecuteNonQuery();
			cmd  = new MySqlCommand("DELETE FROM PostDetails WHERE PostID = ?PostID", dbcon);
			cmd.Parameters.AddWithValue("?PostID",PostID);
			cmd.ExecuteNonQuery();
			Response.Redirect("Default.aspx");
		}

	}
}

