<%@ Page Language="C#" Inherits="blog.EditPost"  validateRequest="false"  EnableEventValidation="false" %>
 
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


</body>
</html>


