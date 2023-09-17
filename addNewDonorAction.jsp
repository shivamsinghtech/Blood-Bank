<%@ page import="java.sql.*" %>  
<%@ page import="javax.swing.*"%>
<%
String b1=request.getParameter("b1");
if(b1.equalsIgnoreCase("save")) 
{
String id=request.getParameter("id");
String name=request.getParameter("name");
String father=request.getParameter("father");
String mother=request.getParameter("mother");
String mobilenumber=request.getParameter("mobilenumber");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String bloodgroup=request.getParameter("bloodgroup");
String address=request.getParameter("address");
try
{ Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin","admin");
    PreparedStatement ps=conn.prepareStatement("insert into donor values(?,?,?,?,?,?,?,?,?)");
    ps.setString(1,id);
    ps.setString(2,name);
    ps.setString(3,father);
    ps.setString(4,mother);
    ps.setString(5,mobilenumber);
    ps.setString(6,gender);
    ps.setString(7,email);
    ps.setString(8,bloodgroup);
    ps.setString(9,address);
    ps.executeQuery();
    response.sendRedirect("addNewDonor.jsp?msg=valid");
}
catch(Exception e)
{
	response.sendRedirect("addNewDonor.jsp?msg=invalid");
}}
%>