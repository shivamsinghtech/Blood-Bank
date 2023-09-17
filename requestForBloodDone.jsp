<%@ page import="java.sql.*" %>  
<%@ page import="javax.swing.*"%>
<%
String mobilenumber=request.getParameter("mobilenumber");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin"); 
    PreparedStatement ps=conn.prepareStatement("update bloodrequest set status='completed' where mobilenumber=?"); 
    ps.setString(1,mobilenumber);
    ps.executeUpdate();
    response.sendRedirect("requestForBlood.jsp");
   }
   catch(Exception e)
   {
   response.sendRedirect("requestForBlood.jsp");
   }
 %>