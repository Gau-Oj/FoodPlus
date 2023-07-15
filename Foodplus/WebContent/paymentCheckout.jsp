<%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <html>
<head>
<title>ePay</title>
<link rel="stylesheet" type="text/css" href="MyStyle.css">
<script>
function validateForm()
{
	var c = document.forms["Pform"]["credit"].value;
	var d = document.forms["Pform"]["debit"].value;
	if ((document.getElementById("credit").checked)==false && (document.getElementById("debit").checked)==false) 
	{
		alert("Choose one payment method first");
		return false;
	}
	var x = document.forms["Pform"]["cardholder"].value;
	var i,count=0,cl=0,cr=0;
	if (x == "") 
	{
		alert("Card holder's name must be filled out");
		return false;
	}
	else
	{
		for(i=0;i<x.length;i++)
  		{
			if(x[i]>='0' && x[i]<='9')
			{
				alert("Invalid Cardholder's Name");
				return false;
			}
  		}
	}
	var y = document.forms["Pform"]["date"].value;
	if (y == "") 
	{
		alert("Card expiry date must be filled out");
		return false;
	}
	else if(y.length==5)
	{
		for(i=0;i<y.length;i++)
  		{
			if(y[i]=='/')
			{
				cr=4-cl;
				break;
			}
			else
			{
				cl++;
			}
  		}
		if(cl!=cr)
		{
			alert("Invalid date");
			return false;
		}
	}
	else
	{
		alert("Invalid date");
		return false;
	}
	var z = document.forms["Pform"]["verification"].value;
	if (z == "") 
	{
		alert("CVV must be filled out");
		return false;
	}
	else
	{
		for(i=0;i<z.length;i++)
  		{
			if(z[i]>='0' && z[i]<='9')
			{
				count++;	
			}
  		}
		if(count!=3)
		{
			alert("Invalid CVV");
			return false;
		}
	}
	var cn = document.forms["Pform"]["cardnumber"].value;
	var n;
	n=cn.toString();
	if (cn == "")
	{
    		alert("Card no. must be filled out");
    		return false;
  	}
  	if(n.length>16 || n.length<16)
  	{
		alert("Card no. must be of 16 digits");
		return false;
  	}
}
</script>
</head>
<body>
<h1>Checkout</h1>
<h2>Total Price Rs:  <%out.print(request.getParameter("price")); %></h2>
<%String userid= request.getParameter("userid");
String pass= request.getParameter("pass");
%>
<div class="form">
<form name="Pform" action="submit.jsp" method="post" onsubmit="return validateForm()">
<center><h2>Payment mode</h2></center>
<input type="radio" id="credit" name="method" value="crdt">Credit Card
<input type="radio" id="debit" name="method" value="dbt">Debit Card<br><br>
 <div class="input-fields">
      <div class="column-1">
        <label for="cardholder">Cardholder's Name</label>
        <input type="text" id="cardholder" />
 
        <div class="small-inputs">
          <div>
            <label for="date">Valid thru</label>
            <input type="text" id="date" placeholder="MM / YY" />
          </div>
 
          <div>
            <label for="verification">CVV / CVC *</label>
            <input type="password" id="verification" minlength="3" maxlength="3"/>
          </div>
        </div>
 
      </div>
      <div class="column-2">
        <label for="cardnumber">Card Number</label>
        <input type="number" id="cardnumber"/>
 		<input type="hidden" name="userid" value="<%out.print(userid);%>">
         <input type="hidden" name="pass" value="<%out.print(pass);%>">
        <span class="info">* CVV or CVC is the card security code, unique three digits number on the back of your card separate from its number.</span>
      </div>
    </div>
<center>
<br>
 <div class="panel-footer">
    <input type="reset" value="Reset">
    <input type="submit" value="Pay">
  </div>
</center>
</div>
</body>
</html>