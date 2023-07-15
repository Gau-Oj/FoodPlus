<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dishes</title>
</head>
<style>
h2{
    font-size:40px;
    font-family:Impact, Charcoal, sans-serif;
    color:rgb(1, 4, 14);
    font-style: italic
}
.col-sm-3{
    background-color: aliceblue;
    border-radius: 5%;
    width: 100%;
    row-gap: 5px;
    margin-right: 20px;
    margin-left: 20px;
    margin-bottom: 20px;
    margin-top: 20px;

}
.col-sm-3:hover{
    background-color: rgb(179, 245, 179);
   border: 2px solid rgb(32, 10, 230);
    row-gap: 5px;
    margin-right: 20px;
    margin-left: 20px;
    margin-bottom: 20px;
    margin-top: 20px;
    transition: 0.6s ease;
}
form{
margin-top:14px;
margin-left:10px;

}

</style>
<body>
 <title>Foodplus</title>
  <link rel = "icon" href="https://cdn.dribbble.com/users/1322354/screenshots/3111336/01_september_2016-32.png" 
        type = "image/x-icon">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-image: linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url(images/new.jpg);
height: 100vh;
background-size: cover;	
">
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">Food Plus</a>
      </div>
      
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li class="active"><a href="#"><%out.print(session.getAttribute("name")); %></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
 <li ><a href="cart.jsp"> <button  class="btn btn-primary">
            <span class="glyphicon glyphicon-shopping-cart"></span> Cart
          </button></a></li>
         
         
       <li><form action="search.jsp" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search" >
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form></li>
      <li><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
    </ul>
    </div>
  </nav>
<div  style="background-color: rgba(31, 29, 29, 0.6);">
<div class="container" >
<h1 style="font-size:40px;
    font-family:Impact, Charcoal, sans-serif;
    color:rgb(14, 71, 241);
    font-style: italic"> 
    <%
    String restaurant_id=request.getParameter("restaurant_id");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodplus","root","password");
    PreparedStatement st1=con.prepareStatement("select * from restaurant where id='"+restaurant_id+"'");
    ResultSet rs1=st1.executeQuery();
    rs1.next();
    out.print(rs1.getString(2));
    %> </h1>
   <hr>
   <h4 style="color: white;">Rating: <% out.print(rs1.getInt(4)); %>  |  Address: <%out.print(rs1.getString(3)); %></h4> 
    <h1 style="font-size:40px;
    font-family:Impact, Charcoal, sans-serif;
    color:rgb(142, 167, 241);
    font-style: italic">DISHES</h1>
  </div>

  </div>
    
      <div class="container" align="center">
        <div class="row">
      <% try{
    	 
    	 PreparedStatement st=con.prepareStatement("select * from dish where restaurant_id='"+restaurant_id+"'");
         ResultSet rs=st.executeQuery();
        while(rs.next()){
       %>  
        <div class="col-sm-3" style="margin:45px 45px 45px 45px">
            <img src=<%out.print(rs.getString(7)); %> alt=<%out.print(rs.getString(2)); %> width="100%" height="150" ><br>
           <h4> <%out.print(rs.getString(2)); %> at Rs. <%out.print(rs.getInt(4)); %></h4>
            <p>About:&nbsp;<%out.print(rs.getString(3)); %></p>
            <%if(rs.getBoolean(5)){ %>
            <img  src="images/veg.png" width="20" height="20" alt="">
            <h4 *ngIf="dish.isVeg" style="background-color:green; color: aliceblue; width: 50%;height: 8%;">Veg </h4>
            
            <% } 
            else{%>
            <img *ngIf="!dish.isVeg" src="images/non-veg.jpg" width="20" height="20" alt="">
            <h4 *ngIf="!dish.isVeg" style="background-color: red; color: aliceblue; width: 60%;">Non-Veg</h4>
           <%} %>
           <form action="addToCart.jsp">
           <button  class="btn btn-primary">Add to cart</button>
           <input type="hidden" name="dish_id" value="<%out.print(rs.getInt(1)); %>">
           </form>
       
            <hr>

</div>
   <%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
        </div></div>
<!-- <br><br><br><br><br><br><br> -->

</body>
</html>