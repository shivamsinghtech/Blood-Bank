<%@ page import="java.sql.*" %>  
<%@ page import="javax.swing.*"%>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<center>
<table id="customers">
<tr>
<th>Name</th>
<th>Mobile Number</th>
<th>Email</th>
<th>Blood Group</th>
<th>Done</th>
<th>Delete</th>
</tr>
<tr>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin","admin");  
    Statement st=conn.createStatement();
    ResultSet rs=st.executeQuery("select * from bloodrequest where status='pending'");
    while(rs.next())
    {
%>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><a href="requestForBloodDone.jsp?mobilenumber=<%=rs.getString(2) %>">Done</a></td>
<td><a href="requestForBloodDelete.jsp?mobilenumber=<%=rs.getString(2) %>">Delete</a></td>
</tr>
<%
       }
    } 
catch(Exception e)
{
	out.println(e.toString());
}
%>
</table>
</center>
<br>
<br>
<br>
<br>
<h3><center>Developed by Shivam Singh</center></h3>
</body>
</html>