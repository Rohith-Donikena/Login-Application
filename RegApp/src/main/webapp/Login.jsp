<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="Login.css">
    <title>Login Form</title>
</head>
<body>
    <div class="container">
 <div class="mid">
    <h1>Login Form</h1> <br>
    <h3>Login</h3> 
    <form action="Login.jsp" method="get">
    <label for="uname">Username:</label>  <input type="text" id="uname" name="user"><br><br>
    <label for="pass">Password :</label> <input type="password" id="pass" name="pass"><br><br>
    
    <input type="submit" value="Login"><br><br>
    <a href="">Forgot Password</a> 
    <p>Not a Member? <a href="StudentRegister.jsp">SignUp</a></p> <br>
    </div>  

    <div class="cnt"><a href="../week1/resume.html">About Us</a>
    <a href="contactus.html">Contact Us</a> </div>
    </form>
</div>
  <%
     try {
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "rohith", "rohith");  
	    Statement stmt=con.createStatement();
	    String usr = request.getParameter("user");
	    String pass = request.getParameter("pass");
	    ResultSet rs = stmt.executeQuery("select * from student");
	    boolean fnd=false;
	    while(rs.next()) {
	    	String dusr = rs.getString(1);
	    	String dpass = rs.getString(2);
	    	if(usr.equals(dusr) && pass.equals(dpass)) {
	    		RequestDispatcher rd = request.getRequestDispatcher("Welcome.jsp");
	    		session.setAttribute("email",rs.getString(3));
	    		session.setAttribute("rollno",rs.getString(4));
    	    	rd.forward(request,response);
    	    	fnd=true;
    	    	break;
	      	}
	      }
	    if(fnd==false) out.println("<p align='center' style='color: white',font-family: 'Montserrat Alternates', sans-serif'>Login failed Enter valid details</p>");	
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