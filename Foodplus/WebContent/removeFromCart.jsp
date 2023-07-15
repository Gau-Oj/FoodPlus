<%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <% 
    String dishid=request.getParameter("dishid");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodplus","root","password");
    Statement st=con.createStatement();
    int rs=st.executeUpdate("delete from cart where cartid='"+dishid+"'");
    out.print("Added to cart Successfully");
    response.sendRedirect("cart.jsp");
    %>