  <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    
<html>
<head >
  <title>Foodplus</title>
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
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Login/Sign In
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="customerLogin.jsp">Customer</a></li>
            <li><a href="restaurant.jsp">Restaurant</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>

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
   
    row-gap: 5px;
    margin-right: 20px;
    margin-left: 20px;
    margin-bottom: 20px;
    margin-top: 20px;
    transition: 0.6s ease;
}
.container1{
  margin-top: 20px;
  margin-right: 5%;
  margin-left: 5%;
}

</style>

<div class="container1">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
  
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <a href="https://www.wikipedia.org/"><img src="images/1.jpg" alt="Los Angeles" style="width:70%; height: 80%; margin-left:auto; margin-right:auto"></a>
      </div>

      <div class="item">
        <img src="images/2.jpg" alt="Chicago" style="width:70%; height: 80%; margin-left:auto; margin-right:auto">
      </div>
    
      <div class="item">
        <img src="images/3.png" alt="New york" style="width:70%; height: 80%; margin-left:auto; margin-right:auto">
      </div>
      <div class="item">
        <img src="images/4.jpg" alt="New york" style="width:70%; height: 80%; margin-left:auto; margin-right:auto">
      </div><div class="item">
        <img src="images/5.jpg" alt="New york" style="width:70%; height: 80%; margin-left:auto; margin-right:auto">
      </div>
    </div>

       <!-- Left and right controls -->
       <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
      </a>
  
  </div>
</div>


 <div class="container"><br><h1 style="font-size:40px;
    font-family:Impact, Charcoal, sans-serif;
    color:rgb(142, 167, 241);
    font-style: italic">RESTAURANTS</h1></div>
      <div class="container" align="center">
        <div class="row" >

    
    <%try{
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodplus","root","password");
    	 PreparedStatement st1=con.prepareStatement("select * from restaurant;");
         ResultSet rs1=st1.executeQuery();
        while(rs1.next()){
       %>   
    <div class="col-sm-4" ">
      <div class="myclass"  >
     
        <h2><% out.print(rs1.getString(2)); %> </h2>  <hr>
        <h4> Address:&nbsp;<% out.print(rs1.getString(3)); %> </h4>
         <h3> Rating:&nbsp; <% out.print(rs1.getInt(4)); %>&starf;</h3>
         
         <h3 style="background-color: green; color: white;width: 50%;"><span ><% if(rs1.getBoolean(5)) 
         {out.print("Open");}
         %></span></h3>
         <h3 style="background-color: red; color: white;width: 50%;"><span ><% if(!rs1.getBoolean(5)) 
         {out.print("Closed");}
         %></span></h3>
          <br>
          <%if(rs1.getBoolean(6)){ %>
         <a href="customerLogin.jsp">
         <button  style="margin-bottom: 4%;"  class="btn btn-primary" >MENU</button></a>
         <%} %>
         <p  style="color:green"><% if(rs1.getBoolean(6)) 
         {out.print("Available Now!!!!");}
         %></p>
         <p  style="color:red"><% if(!rs1.getBoolean(6)) 
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
 
<br><br><br><br><br><br><br>
 
 
    <img src="images/delivery.png" alt="New york" style="width:100%;height:60%;">
  
</body>

</html>