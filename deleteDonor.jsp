<%@ page import="java.sql.*" %>  
<%@ page import="javax.swing.*"%>
<%
String id=request.getParameter("id");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin","admin");
    PreparedStatement ps=conn.prepareStatement("delete from donor where id=?");
    ps.setString(1,id);
    ps.executeUpdate();
    response.sendRedirect("editDeleteList.jsp?msg=deleted");
}
catch(Exception e)
{
	response.sendRedirect("editDeleteList.jsp?msg=invalid");
}
%>
    