<%@ Page Language="C#"  Inherits="blog.Default" validateRequest="false"  EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Dedicated to Servers</title>
<meta name="keywords" content="Cold fusion, .net, PHP, Perl" />
<meta name="description" content="" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet">

<script src="functions.js"></script>
<script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>
<script>tinymce.init({
selector:'textarea'
});</script>
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
</head>
<body>
<div id="templatemo_header_wrapper">
<!--  Free Web Templates by TemplateMo.com  -->
  <div id="templatemo_header">
    
   	<div id="site_logo"></div>
    
		<div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                  <li><a href="/" class="current">Home</a></li>
                  <li><a href="#" class="last">Contact</a></li>
            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
	<div id="templatemo_banner">
 
    	<div id="templatemo_banner_image">
        	<div id="templatemo_banner_image_wrapper">
            	<img src="images/templatemo_image_01.jpg" alt="image 1" />
            </div>
        </div>
        
        <div id="templatemo_banner_content">
        	<div class="header_01">Hello and welcome to my blog, I hope you enjoy</div>
            <p>This blog is dedicated to solving problems </p>
            <div class="button_01"><a href="#">Read more</a></div>
        </div>	
    
    	<div class="cleaner"></div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_content_wrapper">
	<div id="templatemo_content">
    
    	<div id="column_w530">
        	
            <div class="header_02">Welcome to DedicatedtoServers.com</div>
            
            <p class="em_text">This blog I created in Mono .NET C# because I wanted to learn C#
            <div class="margin_bottom_20"></div>
            
            <ul class="content_list_01">
                <li>Tagline 1</li>
                <li>Tagline2</li>
            </ul>
            
            <div class="margin_bottom_20"></div>           
            
            <div class="content_section_01">
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
		
    
    					<table width="100%" border=0><tr class="header-row"><th align="left" class="header-row"><font size="3"> 
    					<strong><a href=#content  style='text-decoration:none;color:black;' OnClick='ToggleContent(<%# Eval("PostID") %>);'>
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
        <a name=content></a>
        <%# Server.HtmlDecode(Eval("PostText").ToString()) %>
        </div>

</td>

       </tr></table>

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
            
            <div class="cleaner"></div>
        </div>
        
        <div id="column_w300">
        
        	<div class="header_03">Random Posts</div>
               <asp:Repeater runat="server" id="NewsControl">
 <ItemTemplate>

            <div class="column_w300_section_01" class = "<%=Response.Cookies ["CSSClass"].Value %>">
            	<div class="news_image_wrapper">
                	<img src="images/templatemo_image_02.jpg" alt="image" />
                </div>
                
                <div class="news_content">
                	<div class="news_date"><%# Eval("PostDate") %></div>
                    <div class="header_04"><a href="#"><%# Eval("PostTitle") %></a></div>
                    <p><%# Eval("PostSummary") %></p>
				</div>
                                
                <div class="cleaner"></div>
            </div>
</ItemTemplate>
            </asp:Repeater>

         
            
            <div class="cleaner"></div>
            </div>
            
            <div class="cleaner"></div>
        </div>
    
    	<div class="cleaner"></div>
    </div> <!-- end of content wrapper -->
</div> <!-- end of content wrapper -->

<div id="templatemo_footer_wrapper">

	<div id="templatemo_footer">
    	
        <div class="section_w180">
        	<div class="header_05"><a href=#>Services</a></div>
            <div class="section_w180_content"> 
            	<ul class="footer_menu_list">
                    <li><a href="#">Web Hosting</a></li>
                    <li><a href="#">Website Design</a></li>

                     
                </ul>
			</div>
        </div>
        
        <div class="section_w180">
        	<div class="header_05"><a href=#>About</a></div>
         
        </div>
                

        
        <div class="section_w180">
	        <div class="header_05"><a href=#>Contact</a></div>
           
        
        </div>
        
        <div class="margin_bottom_20"></div>
        Copyright © 2048 <a href="#">Dedicated to Servers</a>
        <div class="cleaner"></div>
    </div> 

</div> 
</body>
</html>
