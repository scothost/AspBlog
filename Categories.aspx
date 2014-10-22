<%@ Page Language="C#"   Inherits="blog.Categories" validateRequest="false"  EnableEventValidation="false" %>

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

  <br/>
  <table border=1 style='width:500px;'>
  <tr><th width="60">ID</th><th width="200">Category</th><th width="100">Action</th></tr>
  <form id="EditCategory" runat="server" method="post">
  <asp:Repeater ID="CategoryTableControl" runat="server" >
  <ItemTemplate>
  <tr>
  <td align="center"><%# Eval("CategoryID") %></td>
  <td align="center"><%# Eval("CategoryName") %></td>
  <td align="center"><a href='?action=edit&id=<%# Eval("CategoryID") %>'>Edit</a> | 
  <a href='?action=delete&id=<%# Eval("CategoryID") %>'>Delete</a></td>
  </tr>
  </ItemTemplate>
       </asp:Repeater>


    <tr><td colspan="3" align="center">     
   <asp:Repeater runat="server" id="EditCategoryControl">
 
 <ItemTemplate>
<b>CategoryName</b>: <input name = "CategoryName" value='<%# Eval("CategoryName") %>' >

 </ItemTemplate>

 <FooterTemplate>
 <br/>   <button type="submit" name = "btnSubmit" >Update this Category</button>
 <button type="Reset" name = "btnAbandon"  onClick="location.href='/Categories.aspx'">Abandon this Edit</button>
</FooterTemplate>
 </asp:Repeater>

  </td></tr>
</form>
      </table>
        <br/>
 <P class="footer" align="center">

 <asp:Repeater runat="server" id="FooterControl">
 <ItemTemplate>
 <%# Eval("ConfigValue") %>
 </ItemTemplate>
 </asp:Repeater>

 </P>

            </div>
            
            <div class="cleaner"></div>
        </div>
        
        <div id="column_w300">
        
        	<div class="header_03">Random Posts</div>
            
            <div class="column_w300_section_01">
            	<div class="news_image_wrapper">
                	<img src="images/templatemo_image_02.jpg" alt="image" />
                </div>
                
                <div class="news_content">
                	<div class="news_date">OCT 29, 2048</div>
                    <div class="header_04"><a href="#">Lorem ipsum dolor sit</a></div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a justo dolor.</p>
				</div>
                                
                <div class="cleaner"></div>
            </div>
            
            <div class="column_w300_section_01 even_color">
            	<div class="news_image_wrapper">
                	<img src="images/templatemo_image_03.jpg" alt="image" />
                </div>
                
                <div class="news_content">
                	<div class="news_date">OCT 28, 2048</div>
                    <div class="header_04"><a href="#">Nam dictum pellentesque</a></div>
                    <p>Nam ultricies cursus enim, non aliquet orci lacinia ac. Etiam lobortis adipiscing.</p>
				</div>
                                
                <div class="cleaner"></div>
            </div>
            
            <div class="column_w300_section_01">
            	<div class="news_image_wrapper">
                	<img src="images/templatemo_image_04.jpg" alt="image" />
                </div>
                
                <div class="news_content">
                	<div class="news_date">OCT 27, 2048</div>
                    <div class="header_04"><a href="#">Donec faucibus tortor</a></div>
                    <p>Aliquam porttitor nibh in erat porttitor in accumsan dui pulvinar.</p>
				</div>
                                
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
