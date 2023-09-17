<%@ page import="java.sql.*" %>  
<%@ page import="javax.swing.*"%>
<%
String mobilenumber=request.getParameter("mobilenumber");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "admin"); 
    Statement st=conn.createStatement();
    st.executeUpdate("delete from bloodrequest where mobilenumber='"+mobilenumber+"'");
    response.sendRedirect("requestForBlood.jsp");
   }
   catch(Exception e)
   {
   response.sendRedirect("requestForBlood.jsp");
   }
 %>