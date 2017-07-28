<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Highconnect/MyProfile</title>
</head>
<body background="login.jpg">
<%
Connection conn=null;
ResultSet rs=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
try
{
conn=DriverManager.getConnection(URL,"root","admin");
ps=conn.prepareStatement("select * from userdetails where email=?");
String demail=(String)session.getAttribute("photoemail");
ps.setString(1,demail);
rs=ps.executeQuery();
if(rs.next())
{ 
	out.println("<html><head><title>Highconnect/ViewProfile</title></head><body>");
out.println("<form method='post' action='profileedit.jsp'>");
out.println("<center>");
out.println("FirstName&nbsp:<input type='text' name='fname' value='"+rs.getString(1)+"'></br></br>");
out.println("LastName&nbsp&nbsp:<input type='text' name='lname' value='"+rs.getString(2)+"'></br></br>");
out.println("DateofBirth:<input type='text' name='dob' value='"+rs.getString(3)+"'></br></br>");
out.println("Age&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:");
out.println("<input type='text' name='age' value='"+rs.getString(4)+"'></br></br>");
out.println("Email&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:");
out.println("<input type='text' name='email' value='"+rs.getString(5)+"' readonly></br></br>");
out.println("Phoneno&nbsp&nbsp:<input type='text' name='phoneno' value='"+rs.getString(7)+"'></br></br>");
out.println("<input type='submit' value='SUBMIT'></br></br>");
if(null!=session.getAttribute("editupmessage"))
{
	String msg=(String)session.getAttribute("editupmessage");
	out.println(msg);
}
}
else
{ 
	
	response.sendRedirect("Settings.jsp");
	out.println("something went wrong");
}
out.println("</center></form></body></html>");
ps.close();
conn.close();
}
catch(Exception e)
{ 
	out.println(e);
}
%>
</body>
</html>