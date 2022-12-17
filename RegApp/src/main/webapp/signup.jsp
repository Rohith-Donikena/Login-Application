<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>	
<!DOCTYPE html>

<html lang="en">
<head>
<title>Registration Form</title>
<style>
.con {
	margin: auto;
	width: 50%;
	border: 3px solid green;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="con">
		<h1>Student Registration Form</h1>

		<form action="signup.jsp" target="_blank" method="get">
			<table>
				<tr>
					<td><label for="uname">Username</label></td>
					<td><input type="text" id="uname" placeholder="Enter Username" name="user" required></td>
				</tr>


				<tr>
					<td><label for="pass">Password</label></td>
					<td><input type="password" id="pass"
						placeholder="Enter Password" name="pass" required></td>
				</tr>


				<tr>
					<td><label for="email">Email id </label></td>
					<td><input type="email" id="email" placeholder="Enter EmailId" name="email" required></td>
				</tr>


				<tr>
					<td><label for="dob">Date Of Birth</label></td>
					<td><input type="date" id="dob" placeholder="Enter DOB" name="dob" required></td>
				</tr>


				
				<tr>
					<td><label for="gender">Gender</label>
					<td>Male <input type="radio" id="gender" name="gender">
						Female <label for="gender"></label> <input type="radio"
						id="gender" name="gender" ></td>
				</tr>

				<tr>
					<td><label for="course">Course</label></td>
					<td><select name="choice" id="" name="course" required>
							<option value="btech">B-TECH</option>
							<option value="mtech">M-TECH</option>
							<option value="bsc">BSC</option>
							<option value="bcom">BCOM</option>
					</select></td>
				</tr>

				<tr>
					<td><label for="mobile">Mobile</label></td>
					<td><input type="tel" id="mobile" pattern="[0-9]{10}" name="phone" required></td>
				</tr>
				<tr>
					<td><label for="add">Address</label></td>
					<td><textarea name="" id="add" cols="21" rows="6" name="add" required></textarea></td>
				</tr>
				<tr>
					<td><input type="checkbox" id="cbox" required></td>
					<td><label for="cbox">Agree Terms and Conditions</label></td>
				</tr>

				<tr>
					<td><input type="submit" name="" id=""></td>
					<td><input type="reset" name="" id=""></td>
				</tr>

			</table>
		</form>
	</div>
	
	<%
	    try {
		    Class.forName("oracle.jdbc.driver.OracleDriver");
		    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "rohith", "rohith");
    	    String usr = request.getParameter("user");
    	    String pass = request.getParameter("pass");
    	    String email = request.getParameter("email");
    	    String dob = request.getParameter("dob");
    	    String gender;
    	    if(request.getParameter("male").equals("on")) gender = "Male";
    	    else  gender = "Female";
    	    String course = request.getParameter("course");
    	    String phone = request.getParameter("phone");
    	    String add = request.getParameter("add");
    	        	    
    	    PreparedStatement stmt=con.prepareStatement("insert into person values(?,?,?,?,?,?,?,?)");
    	    stmt.setString(1,usr);
    	    stmt.setString(2,pass);
    	    stmt.setString(3,email);
    	    stmt.setString(4,dob);
    	    stmt.setString(5,gender);
    	    stmt.setString(6,course);
    	    stmt.setString(7,phone);
    	    stmt.setString(8,add);
    	  
    	    ResultSet rs = stmt.executeQuery();
    	    if(rs.next()) {
    	    	RequestDispatcher rd = request.getRequestDispatcher("RegSuccess.jsp");
    	    	rd.forward(request,response);
    	    }
    	    else {
    	    	out.println("<font color=red size=10>Registration Failed!!><br>");
    	    }
    	
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
