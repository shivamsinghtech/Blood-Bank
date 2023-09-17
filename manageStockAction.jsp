<%@ page import="java.sql.*" %>  
<%@ page import="javax.swing.*"%>
<%
String bloodgroup=request.getParameter("bloodgroup");
String incdec=request.getParameter("incdec");
String units=request.getParameter("units");
int units1=Integer.parseInt(units);
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin","admin");  
    Statement st=conn.createStatement();
    if(incdec.equals("inc"))
    	st.executeUpdate("update stock set units=units+'"+units1+"' where bloodgroup='"+bloodgroup+"'");
    else 
    	st.executeUpdate("update stock set units=units-'"+units1+"' where bloodgroup='"+bloodgroup+"'");
    	response.sendRedirect("manageStock.jsp?msg.valid");
    }
catch(Exception e)
{
	response.sendRedirect("manageStock.jsp?msg.invalid");
}
%>
    