<%
	String usern = request.getParameter("adminName");
	String pass = request.getParameter("adminPass");
	
	if (usern.equals("root") && pass.equals("root")) 
	{
		session.setAttribute("session","TRUE");  
		session.setAttribute("username", usern);
		response.sendRedirect("student-data.jsp");
	
	}
	else
		response.sendRedirect("errorLogin.html");
%>