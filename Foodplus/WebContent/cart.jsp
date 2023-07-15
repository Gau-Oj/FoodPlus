 <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
<link rel = "icon" href="https://cdn.dribbble.com/users/1322354/screenshots/3111336/01_september_2016-32.png" 
        type = "image/x-icon">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
.col-sm-7{
    background-color: aliceblue;
    border-radius: 3%;
    border: 2px solid black;
}
.col-sm-3{
    background-color: antiquewhite;
    margin-bottom: 2%;
    border-radius: 2%;
   
}
img{
    margin-top: 3%;
}
.item{
    margin-top: 60%;
}
.price{
    background-color: aliceblue;
    margin-left: 5%;
    border-radius: 3%;
}
form{
margin-top:14px;
margin-left:10px;

}


</style>
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
<div  class="container">
      <div class="row">
            <div class="col-sm-7" >
                <h3>My Cart</h3>
                <hr>
                <%
                String email= session.getAttribute("email").toString();
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodplus","root","password");
               PreparedStatement st1=con.prepareStatement("select * from cart where userid='"+email+"'");
               ResultSet rs1=st1.executeQuery(); 
               while(rs1.next()){
            	   int id=rs1.getInt(2);
            	   PreparedStatement st=con.prepareStatement("select * from dish where id='"+id+"'");
                   ResultSet rs=st.executeQuery(); 
                   rs.next();
                %>
               
                <div class="row">
                   <div class="col-sm-3" style=" margin-left: 11%;">
                  
                     <img src=<%out.print(rs.getString(7)); %> alt=<%out.print(rs.getString(2)); %> style="width:128px;height:128px;">
                   </div>
                   <div class="col-sm-3">
                    <h6> <%out.print(rs.getString(2)); %></h6>
                    
                      <h5>price</h5><h3>Rs: <%out.print(rs.getInt(4)); %></h3>
                      <br>
                    </div>
                    <div class="col-sm-3">
                    <form action="removeFromCart.jsp" method="get">
                    <input type="hidden" name="dishid" value="<%out.print(rs1.getInt(3)); %>">
                     <button style="float: right;margin-top: 50%;" class="btn btn-primary" ">remove</button>      
                     </form>              
                    </div>
                 
                 
                </div>
               <%} %>
            </div>


 
       
        <div class="col-sm-4"   >
            <div class="price">
           <h3>Price:</h3>
             <hr>
             
                 <%
               PreparedStatement st2=con.prepareStatement("select * from cart where userid='"+email+"'");
               ResultSet rs2=st2.executeQuery(); 
               int count=0;
               while(rs2.next()){
            	   int id1=rs2.getInt(2);
            	   PreparedStatement st3=con.prepareStatement("select * from dish where id='"+id1+"'");
                   ResultSet rs3=st3.executeQuery(); 
                   rs3.next();
                   
                   count+=rs3.getInt(4);
                   
                %>
                <h4>
             <div >
               <div class="row"> 
                   <div style="margin-left: 12%;" class="col-sm-2"><%out.print(rs3.getString(2)); %>:</div><div style="margin-left: 30%;" class="col-sm-2"> <%out.print(rs3.getInt(4)); %></div>
               </div>
             </div></h4>
             <%} 
               PreparedStatement st4= con.prepareStatement("select * from user where email='"+email+"'");
               ResultSet rs4=st4.executeQuery();
               rs4.next();
               String userid=rs4.getString(1);
               String pass=rs4.getString(2);
             %>
             
             <hr>
             <h4>
                  <div class="row"> 
                      <div style="margin-left: 12%;" class="col-sm-2"> Totalprice:</div><div style="margin-left: 30%;" class="col-sm-2"><% out.print(count); %></div>
               </div>
                </h4><hr>
                <form action="paymentCheckout.jsp" >
                <input type="hidden" name="price" value="<%out.print(count); %>">
                <input type="hidden" name="userid" value="<%out.print(userid);%>">
                <input type="hidden" name="pass" value="<%out.print(pass);%>">
                <button style="float: right; " class="btn btn-primary" (click)="placeOrder()">PLACE ORDER</button>
                </form>
         </div>
         </div>
</div>
</div>
<!-- <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> -->
</body>
</html>