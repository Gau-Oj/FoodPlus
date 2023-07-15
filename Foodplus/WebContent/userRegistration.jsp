    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <script type="text/javascript">
function alertName(){
alert("User successfully registered!!!");
} 
</script> 
<%
String email=request.getParameter("email");
String password = request.getParameter("password");
String name = request.getParameter("name");
String phoneno = request.getParameter("phoneno");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodplus","root","password");
Statement st = con.createStatement();
if(st.executeUpdate("insert into user values('"+email+"','"+password+"','"+name+"','"+phoneno+"')")!=0)
{
	%><script>alertName();</script><%
	response.sendRedirect("customerLogin.jsp");
}


%>
<html>
<head>
<title>data</title></head>
<body>
<h2>Data successfully Inserted</h2>
</body>
</html>



