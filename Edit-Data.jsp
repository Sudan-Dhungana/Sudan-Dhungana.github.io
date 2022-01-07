<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@page import= "java.sql.*"%>   
<%
	if (request.getParameter("submit") != null) 
	{
		String id = request.getParameter("id");
		String name = request.getParameter("uname");
		String course = request.getParameter("ucourse");
		String fee = request.getParameter("ufee");
		
		Connection connect;
		PreparedStatement pstate;
		ResultSet res;
		
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://localhost/student-data","root","");
		pstate = connect.prepareStatement("update records set uname = ?, ucourse = ?, ufee = ? where id = ?");
		
		pstate.setString(1, name);
		pstate.setString(2, course);
		pstate.setString(3, fee);
		pstate.setString(4, id);
		
		// UPDATE
		pstate.executeUpdate();
	}
%>
 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>STUDENT DATA EDIT PAGE</title>
		<link rel="stylesheet" href="look-style.css">
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300&display=swap" rel="stylesheet">	
	</head>
	<body>
    <header>
        <marquee direction="right">
            Welcome to Student Management System Web Application.
        </marquee>
    </header>
    <div class="logo"> <img src="./images/logo.png" alt=""> </div>
    <nav role="navigation">
        <div class="navbar">
            <ul>
                <li><a href="index.html"><i class="fa fa -fw fa-home"></i> Home</a></li>
                <li><a href="userLogin.html"><i class="fa fa-fw fa-user"></i> Student</a></li>
                <li><a href="sdata-search.html"><i class="fa fa -fw fa-search"></i> Search</a> </li>

                <li><a href=""><i class="fa fa-fw fa-user-circle-o"></i></a></li>
            </ul>
        </div>
    </nav>
    	
    <form method="post" action="#">
    
    	<%
    	Connection connect;
		PreparedStatement pstate;
		ResultSet res;
	
		Class.forName("com.mysql.jdbc.Driver");
		
		connect = DriverManager.getConnection("jdbc:mysql://localhost/student-data","root","");	
		
		String id = request.getParameter("id");
		pstate = connect.prepareStatement("select * from records where id=?");
		pstate.setString(1,id);
		
		res = pstate.executeQuery();
		
		while (res.next()) {
	
    	%>
    	<div class="student-field" >
    		<p>STUDENT DATA EDIT FIELD</p>
    		<label for="username">Student Name: </label>
    		<input type="text" name="uname" placeholder = "Type student name here..." 
    		value="<%= res.getString("uname")%>" required autofocus>
    		
    		<label for="course">Course:</label>
    		<input type="text" name="ucourse" placeholder="Type student course here..." 
    		value="<%= res.getString("ucourse")%>" required>
    			
    		<label for="fee">Fee:</label>
    		<input type="text" name="ufee" placeholder="Type student fee here" 
    		value="<%= res.getString("ufee")%>" required>
    			
    		<% } %>
    		<input type="submit" name="submit" value= "Update">
    		
    		
    		<a href="student-data.jsp"><button style="position:fixed; 
    		height:55px; width:80px; border:none; background-color:skyblue; 
    		border-radius:10px; margin-left:55%; margin-top:8%;">Go Back</a></button>
    		
    		
    	</div>
    </form>
    
    <footer id="forlast">  
            <h1>Group project by: Sudan Dhungana | Sohil Dhaubhadel | <a href="kathmandusudan@gmail.com"></a></h1>
    </footer>   
    

</body>
</html>