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

.myclass{
    background-color: aliceblue;
    border-radius: 5%;
    width: 80%;
    row-gap: 5px;
    margin-right: 20px;
    margin-left: 20px;
    margin-bottom: 20px;
    margin-top: 20px;

}
.myclass:hover{
    background-color: rgb(170, 201, 219);
    transition: 0.6s ease;
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
		
      <div class="container" align="center">
        <div class="row" >

    
    <%try{
    	  Class.forName("com.mysql.jdbc.Driver");
	      String srh=request.getParameter("search");
	      java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodplus","root","password");
    	
    	 PreparedStatement st1=con.prepareStatement("select * from restaurant where name like '%"+srh+"%'");
         ResultSet rs1=st1.executeQuery();
         
        while(rs1.next()){
       %>   
    <div class="col-sm-4" ">
      <div class="myclass"  >
     
        <h2 style="font-size:40px; font-family:Impact, Charcoal, sans-serif; color:black; font-style: italic"><% out.print(rs1.getString(2)); %> </h2>  <hr>
        <h4> Address:&nbsp;<% out.print(rs1.getString(3)); %> </h4>
         <h3> Rating:&nbsp; <% out.print(rs1.getInt(4)); %>&starf;</h3>
         
         <h3 style="background-color: green; color: white;width: 50%;"><span ><% if(rs1.getBoolean(5)) 
         {out.print("Open");}
         %></span></h3>
         <h3 style="background-color: red; color: white;width: 50%;"><span ><% if(!rs1.getBoolean(5)) 
         {out.print("Closed");}
         %></span></h3>
          <br>
          <form action="menu.jsp">
          <input type="hidden" name="restaurant_id" value="<%out.print(rs1.getInt(1)); %>">
         <button style="margin-bottom: 4%;"  class="btn btn-primary" >MENU</button>
         </form>
         <p  style="color:green"><% if(rs1.getBoolean(5)) 
         {out.print("Available Now!!!!");}
         %></p>
         <p  style="color:red"><% if(!rs1.getBoolean(5)) 
         {out.print("Not Available Now!!!!");}
         %></p>
        
       
        
       </div>
    </div>
    
    <%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
    %>
    </div>
    </div>

      <div class="container" align="center">
        <div class="row">
      <% 

	      
      try{
    	  Class.forName("com.mysql.jdbc.Driver");
	      String srh=request.getParameter("search");
	      java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodplus","root","password");
    	  PreparedStatement st=con.prepareStatement("select * from dish where name like '%"+srh+"%'");
         ResultSet rs=st.executeQuery();
         
        while(rs.next()){
       %>  
        <div class="col-sm-3" style="margin:45px 45px 45px 45px">
            <h1 style="font-size:40px; font-family:Impact, Charcoal, sans-serif; color:rgb(14, 71, 241); font-style: italic">
            <%
            	int rid=rs.getInt(6);
            	PreparedStatement st1=con.prepareStatement("select name from restaurant where id='"+rid+"'");
            	ResultSet rs1=st1.executeQuery();
            	rs1.next();
            	out.print(rs1.getString(1));
            %>
            </h1>
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

</div>
</div>


</body>
</html>