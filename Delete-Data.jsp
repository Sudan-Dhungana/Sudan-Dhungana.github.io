<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import= "java.sql.*"%>

<%
	String id = request.getParameter("id");
		
	Connection connect;
	PreparedStatement pstate;
	ResultSet res;
		
	Class.forName("com.mysql.jdbc.Driver");
	connect = DriverManager.getConnection("jdbc:mysql://localhost/student-data","root","");
	pstate = connect.prepareStatement("delete from records where id = ?");
		
	pstate.setString(1, id);
		
	// UPDATE
	pstate.executeUpdate();
	
	response.sendRedirect("student-data.jsp");
		
		
		
%>
