<%@ Page Language="C#"   Inherits="blog.EditPost" validateRequest="false"  EnableEventValidation="false" %>

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




  <div id ="EditPost" >
<form id="catFrm" runat="server" method="post"  action='Default.aspx?action=edit'>
   <asp:Repeater runat="server" id="ContentControl">
 
 <ItemTemplate>
<b>Post Title</b>: <input name = title value='<%# Eval("PostTitle") %>' >

 </ItemTemplate>
 </asp:Repeater>
 Category:
 <asp:DropDownList id="CategoryControl" runat="server" DataValueField="CategoryID" DataTextField="CategoryName"  
       AppendDataBoundItems="True" SelectedIndex="2" />


	  
 &nbsp; Add Category: <input type="text" id="CategoryName" name = "CategoryName">


<br/>
   <asp:Repeater runat="server" id="EditControl">
 
 <ItemTemplate>


<b>Summary</b><br/>
<textarea name = summary cols=48 rows=6><%# Eval("PostSummary") %></textarea>
 <input type="hidden" name = "idx" value = "<%# Eval("PostID") %>">
<br/>
<b>Content</b><br/> <textarea name = content cols=64 rows=12><%# Server.HtmlDecode(Eval("PostText").ToString()) %></textarea>
<br><center>
<input type="submit" name = "btnSubmit" value = "Update This Post">
 <input type="Reset" name = "btnAbandon" value = "Abandon This Edit" onClick="location.href='/'">
</center>
  </ItemTemplate>
 </asp:Repeater>
</form>
</div>





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
        	<!--  RANDOM POSTS -->
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
                                
                <div class="cleaner"></div>
            </div>
            
            <div class="cleaner"></div>
        </div>
    
    	<div class="cleaner"></div>
    </div> <!-- end of content wrapper -->
<!-- end of content wrapper -->

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