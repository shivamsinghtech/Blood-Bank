<%@ page import="java.sql.*" %>  
<%@ page import="javax.swing.*"%>
<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
</style>
</head>
<body>
<%
String id=request.getParameter("id");
try
{	Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin","admin");
    Statement smt=conn.createStatement();  
    ResultSet rs=smt.executeQuery("select * from donor where id='"+id+"'");	
	while(rs.next())
	{
%>
<div class="container">
<form action="updateDonorAction.jsp" method="post">
<input type="hidden" name="id" value=<%out.println(id); %>">
<h2>Name</h2>
<input type="text" value="<%=rs.getString(2)%>" name="name">
<hr>
<h2>Father Name</h2>
<input type="text" value="<%=rs.getString(3)%>" name="father">
<hr>
<h2>Mother Name</h2>
<input type="text" value="<%=rs.getString(4)%>" name="mother">
<hr>
<h2>Mobile Number</h2>
<input type="text" value="<%=rs.getString(5)%>" name="mobilenumber">
<hr>
<h2>Email</h2>
<input type="text" value="<%=rs.getString(7)%>" name="email">
<hr>
<h2>Address</h2>
<input type="text" value="<%=rs.getString(9)%>" name="address">
<br>
<center><button type="submit" class="button">Save</button></center>
</form>
</div>
<%
	}}
catch(Exception e)
{
	out.println(e.toString());
}
%>
<br>
<br>
<br>
<br>
<h3><center>Developed by Shivam Singh</center></h3>

</body>
</html>