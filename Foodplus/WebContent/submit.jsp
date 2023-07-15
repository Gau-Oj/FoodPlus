<%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <% 
    String userid= request.getParameter("userid");
    String pass= request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodplus","root","password");
    Statement st=con.createStatement();
    int rs=st.executeUpdate("delete from cart where userid='"+userid+"'");
    %>

<html>
<head>
<title>Payment form</title>
<link rel="stylesheet" type="text/css" href="MyStyle.css">
</head>
<h1>Payment Done successfully</h1>
<form name="redirect" action="userHomepage.jsp">
<input type="hidden" name="user" value="<%out.print(userid);%>">
<input type="hidden" name="password" value="<%out.print(pass);%>">
<center><input type="submit"  value="Back to Homepage"></center>
</form>
</html>