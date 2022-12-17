<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <h1> Hello user.. Welcome</h1>
  
   <%
     try{
      String user = request.getParameter("user");
      String pass = request.getParameter("pass");
      String email = (session.getAttribute("email")).toString();
      String rollno = (session.getAttribute("rollno")).toString();
      out.println("<table border=1 width='50%'><tr><th >Name </th><th>Email</th><th >RollNo</th></tr>");
      out.println("<tr><td >"+user+"</td><td>" +email+ "<td>" +rollno+ "</td></tr>");
      out.println("</table>");
      
     }
    catch(Exception e) {
    	e.printStackTrace();
    }
   %> 
  
</body>
</html>