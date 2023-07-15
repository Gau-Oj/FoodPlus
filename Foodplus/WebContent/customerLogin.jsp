
		<script>
			function validateForm() {
			var x = document.forms["login"]["user"].value;
			var y = document.forms["login"]["password"].value;
			if (x == "") {
	    	alert("Userid is empty");
			return false;
	  		}
	  		else if(y =="")
	  		{
		  		alert("Password is empty");
	    		return false;
	  		}
		}
		</script>
<html>
	<head >
      <title>Foodplus</title>

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
            <li ><a href="index.jsp">Home</a></li>
            <li class="active" class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">Login/Sign In
              <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Customer</a></li>
                <li><a href="restaurant.jsp">Restaurant</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </nav>
    
    <style>
      .col-sm-6{
    background-color: aliceblue;
    border: 2px solid rgb(29, 78, 241);
    border-radius: 5%;
}
.col-sm-6:hover{
    background-color: rgb(220, 227, 233);
    border: 4px solid #010511;
    border-radius: 5%;
    transition: 0.6s ease;
}
h3{
    font-size:40px;
    font-family:Impact, Charcoal, sans-serif;
    color:rgb(1, 4, 14);
    font-style: italic
}
    </style>
   <br><br>

   <div class="container" align="center">
       <div class="row">
          <div class="col-sm-6">
              <h3>Customer Login</h3>
   <form align="center" action="userHomepage.jsp" method="post" onsubmit="return validateForm()" name="login">
   
   <H2>
   <label style="font-size:20px;margin-left:3%">UserId</label>
   <input style="width:40%; float:right; margin-right: 10%;" type="text" class="form-control" id="userId" name="user"> <br><br>
   <label for="pass" style="font-size:20px;margin-left:3%">Password</label>
   <input style="width:40%; float:right; margin-right: 10%;" type="password" class="form-control"  id="pass" name="password"><br>
   </H2>
  
   <br><button class="btn btn-primary" >Login</button><br><hr>
    <h5 style="color:red;"><% 
    	if(session.getAttribute("alert")!=null){
    		out.print(session.getAttribute("alert"));
    	}
     	session.setAttribute("alert","");
   %></h5>
   </form>
   Don't have an account?<a href="customerSignIn.html">click here</a>
   </div>
   <div class="col-sm-4"><br><br>
     <h3 style="font-size: 60px; color: aliceblue; margin-left: 20%;">Good Food <br>Good Life</h3>
   
   </div>
   
   </div>
   </div>
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
     
    
      
    </body>
    
</html>
   