<%@ Page Language="C#" Inherits="blog.Categories"   validateRequest="false"  EnableEventValidation="false" %>
 
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

<a href = "/"> Home </a>
  <br/>
  <table border=1>
  <tr><th>ID</th><th>Category</th><th>Action</th></tr>
  <form id="EditCategory" runat="server" method="post">
  <asp:Repeater ID="CategoryTableControl" runat="server" >
  <ItemTemplate>
  <tr>
  <td align="center"><%# Eval("CategoryID") %></td>
  <td align="center"><%# Eval("CategoryName") %></td>
  <td align="center"><a href=?action=edit&id=<%# Eval("CategoryID") %>>Edit</a> | 
  <a href=?action=delete&id=<%# Eval("CategoryID") %>>Delete</a></td>
  </tr>
  </ItemTemplate>
       </asp:Repeater>


    <tr><td colspan="3" align="center">     
   <asp:Repeater runat="server" id="EditCategoryControl">
 
 <ItemTemplate>
<b>CategoryName</b>: <input name = "CategoryName" value='<%# Eval("CategoryName") %>' >

 </ItemTemplate>

 <FooterTemplate>
    <input type="submit" name = "btnSubmit" value = "Update This Category">
 <input type="Reset" name = "btnAbandon" value = "Abandon This Edit" onClick="location.href='/Categories.aspx'">
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



</body>
</html>