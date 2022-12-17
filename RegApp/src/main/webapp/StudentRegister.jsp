<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="StudentRegister.css">
</head>
<body>

  <div class="con">
  <h1>Student Registration Form </h1>
    <form action="StudentRegister.jsp" method="get">
	    UserName &nbsp;<input type="text" name="user" required> <br> <br> 
	    Password &ensp;<input type="password" name="pass" required>	<br> <br> 
	    Email &ensp;&ensp;&ensp;&ensp;<input type="email" name="email" required> <br><br> 
	    RollNo &ensp;&ensp; <input type="text" name="roll" required> <br><br> 
        <button type="submit">Register</button> &nbsp;&nbsp; 
        <button type="reset">Reset</button> <br><br> 
    </form>
   </div>
  
	<%
	     try {
		    Class.forName("oracle.jdbc.driver.OracleDriver");
		    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "rohith", "rohith");
    	    String usr = request.getParameter("user");
    	    String pass = request.getParameter("pass");
    	    String email = request.getParameter("email");
    	    String rollnoSt = request.getParameter("roll");
    	    int rollno=Integer.parseInt(rollnoSt);    	    
    	    PreparedStatement stmt=con.prepareStatement("insert into student values(?,?,?,?)");
    	    stmt.setString(1,usr);
    	    stmt.setString(2,pass);
    	    stmt.setString(3,email);
    	    stmt.setInt(4,rollno);
    	    ResultSet rs = stmt.executeQuery();
    	    if(rs.next()) {
    	    	RequestDispatcher rd = request.getRequestDispatcher("RegSuccess.jsp");
    	    	rd.forward(request,response);
    	    }
    	    else {
    	    	out.println("<font color=red size=10>Registration Failed!!><br>");
    	    }
    	
    	    out.println("Data Entered Successfully");
    	    con.close();
	      } 
	   catch (SQLException e) {
	      	e.printStackTrace();
	      } 
	   catch (ClassNotFoundException e) {
	      	e.printStackTrace();
	      }
	   catch(Exception e){
		   e.printStackTrace();
	   }
	


	%>
	
</body>
</html>