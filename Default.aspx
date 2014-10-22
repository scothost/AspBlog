<%@ Page Language="C#" Inherits="blog.Default" validateRequest="false"  EnableEventValidation="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD X 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

        <head>
                <title>Dedicated to Servers Blog</title>
                <meta http-equiv ="Content-Type" content="text/html; charset=utf-8" />


       
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="style.css" rel="stylesheet">

<script src="functions.js"></script>
<script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>
<script>tinymce.init({
selector:'textarea'
});</script>
               </head>

                <body style="background:#E0E0E0; background-repeat:no-repeat;">
<div class="wrapper">
        <header class="header">
                </header>

<!-- Get and display Wecome message, links e.t.c. -->
<asp:Repeater runat="server" id="WelcomeControl">
 <ItemTemplate>
<%# Eval("ConfigValue") %>
 </ItemTemplate>
 </asp:Repeater>

  <form method=post runat="server" id = "frmCatFilter" name= "frmCatFilter" >
 <div id="FilterCategory" style='float:right;'>Filter by Category: 
 <asp:DropDownList id="CategoryFilterControl" runat="server" DataValueField="CategoryID" DataTextField="CategoryName" 
       AppendDataBoundItems="False"  nselectedindexchanged="CategoryFilter_SelectedIndexChanged" AutoPostBack="True" />

       </div>
       </form>
       <br>

 <!-- FORM for adding a post, initially hidden -->
	 <div id = "AddPost" style='display:none;'>
		 <form method=post runat="server" id = "frmAddPost" name= "frmApddPost" action="?action=add">
		Post Title: <input name = title> Category:
		<asp:DropDownList id="CategoryControl" runat="server" DataValueField="CategoryID" DataTextField="CategoryName" 
       AppendDataBoundItems="False"  />
		  

 &nbsp; Add Category: <input type="text" id="CategoryName" name = "CategoryName">
		<br/>
		Summary:<textarea id="summary" name = "summary" cols="56" rows="6"></textarea><br/>
		Content: <textarea id="content" name = "content" cols="64" rows="8"></textarea><br/>
		<center><input type="submit" name = "btnSubmit" value = "Add This Post"></center>
 	</form></div>	<br/>
	

<!-- Get and display summary of the first 10 posts -->
 <asp:Repeater runat="server" id="SampleControl">
 <ItemTemplate>
		<div class="middle">
                <div class="container">
                        <main class="content">
    
    					<table width="100%" border=0><tr class="header-row"><th align="left" class="header-row"><font size="3"> 
    					<strong><a href=#  style='text-decoration:none;color:black;' OnClick='ToggleContent(<%# Eval("PostID") %>);'>
    					 <%# Eval("PostTitle") %> &nbsp; Category:<%# Eval("CategoryName") %>&nbsp;
    					 <font size=1 color=blue><u>[click to toggle ...]</u></font></a></strong>
    					 </font></th>
       					 <th class="header-row" align="right">
							<a href="EditPost.aspx?action=edit&id=<%# Eval("PostID") %>#Edit"
							onClick='return ToggleEdit(<%# Eval("PostID")%>);'>Edit</a> | <a href=?action=delete&id=<%# Eval("PostID") %>>Delete</a>&nbsp;
        					<font size="3"> <strong><%# Eval("PostDate").ToString().Substring(0, 10) %>
       						 </strong></font>        
       						 </th></tr>

        					<tr><td colspan="2">
        						<div id = 'summary<%# Eval("PostID") %>'>
 									<blockquote class = 'style4'>
     								   <%# Server.HtmlDecode(Eval("PostSummary").ToString())%>
									</blockquote>


        </div>


        <div id='all<%# Eval("PostID") %>' style='display:none;'>
        <%# Server.HtmlDecode(Eval("PostText").ToString()) %>
        </div>

</td>

       </tr></table>

    </main>
       </div>


          </div>
 </ItemTemplate>
 </asp:Repeater>

 <asp:Repeater runat="server" id="EditControl" />

 <div class="footer" align="center">
 <asp:Repeater runat="server" id="FooterControl">
 <ItemTemplate>
 <%# Eval("ConfigValue") %>
 </ItemTemplate>
 </asp:Repeater>
 </div>
 </div>


</body>
</html>

