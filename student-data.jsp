<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import= "java.sql.*"%>

<%
	
	if (request.getParameter("submit") != null) 
	{
		String name = request.getParameter("uname");
		String course = request.getParameter("ucourse");
		String fee = request.getParameter("ufee");
		
		Connection connect;
		PreparedStatement pstate;
		ResultSet res;
		
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://localhost/student-data","root","");
		pstate = connect.prepareStatement("insert into records(uname,ucourse,ufee)Values(?,?,?)");
		
		pstate.setString(1, name);
		pstate.setString(2, course);
		pstate.setString(3, fee);
		
		// UPDATE
		pstate.executeUpdate();
		
	}

%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="look-style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@300&display=swap" rel="stylesheet">
    <title>Login Page |Welcome to Student Management System|</title>
  
</head>

<body>
    <header>
        <marquee direction="right">
     		Welcome to Student Management System
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
    	<div class="student-field" >
    		<p>STUDENT DATA FIELD</p>
    		<label for="username">Student Name: </label>
    		<input type="text" name="uname" placeholder = "Type student name here..." required autofocus>
    		
    		<label for="course">Course:</label>
    		<input type="text" name="ucourse" placeholder="Type student course here..." required>
    			
    		<label for="fee">Fee:</label>
    		<input type="text" name="ufee" placeholder="Type student fee here" required>
    			
    		<input type="submit" name="submit" value= "Add-Data">
    		<input type="reset" name="reset" value="Reset">	
    	</div>
    	<div class="student-table" style="overflow-x:auto;">
    		<table id = "stud_tbl">
    			<tr>
    				<th>Student Name</th>
    				<th>Course</th>
    				<th>Fee</th>
    				<th>Edit</th>
   					<th>Delete</th>
    			</tr>
    	
    			<%
    				Connection connect;
    				PreparedStatement pstate;
    				ResultSet res;
    			
    				Class.forName("com.mysql.jdbc.Driver");
    				connect = DriverManager.getConnection("jdbc:mysql://localhost/student-data","root","");	
    			
    				String query = "select * from records";
    				Statement state = connect.createStatement();
    				
    				res = state.executeQuery(query);
    				
    				while(res.next()) {
    					String id = res.getString("id");
    				
    			%>
    			<tr>
    				<td><%=res.getString("uname") %></td>
    				<td><%=res.getString("ucourse") %></td>
    				<td><%=res.getString("ufee") %></td>
    				<td><a href="Edit-Data.jsp?id=<%=id%>">Edit</a></td>
    				<td><a href="Delete-Data.jsp?id=<%=id%>">Delete</a></td>
    			</tr>	
    			
    			<%
    			}
    			%>
    		</table>
   			</div>
    </form>
    
    <footer id="forlast">
    	<div class="last">
            <h1>Group project by: Sudan Dhungana | Sohil Dhaubhadel | <a href="kathmandusudan@gmail.com"></a></h1>
          </div>
    </footer>   
    

</body>

</html>