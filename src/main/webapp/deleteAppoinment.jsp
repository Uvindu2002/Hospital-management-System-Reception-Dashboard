<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Patient</title>
</head>
<body>
	   <%
		try {
		    String mob = request.getParameter("appId");
		    
		    Connection con = null;
		    Statement stmt = null;
		    con = DBConnect.getConnection();
		    stmt = (Statement) con.createStatement();
		    
		    String query = "delete from apoinment where apoinmentId = '" + mob + "'";
		    
		    int rowsAffected = stmt.executeUpdate(query);
		    
		    con.close();
		    
		    
		    response.sendRedirect("apoinments.jsp");
		} catch (Exception e) {
		    e.printStackTrace();
		}
	   
	    
		%>

</body>
</html>
