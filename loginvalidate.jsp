<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login validation form</title>
</head>
<body background="login.jpg">
<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
try
{
conn=DriverManager.getConnection(URL,"root","admin");
ps=conn.prepareStatement("select * from login where uname=? and passwd=?");
String username=request.getParameter("username");
String passwd=request.getParameter("passwd");
ps.setString(1,username);
ps.setString(2,passwd);
rs=ps.executeQuery();
session.setAttribute("photoemail",username);
session.setAttribute("useremail",username);

if(rs.next())
{ 
	session.setAttribute("role",rs.getString(3));

	out.println("successfully login");
	response.sendRedirect("Main.jsp");
}
else
{ int c1=1;
	session.setAttribute("loginmessage","Enter Correct Username and Password");
	response.sendRedirect("Login.jsp");
	out.println("something went wrong");
}
ps.close();
conn.close();
}
catch(Exception e)
{ 
	session.setAttribute("loginmessage",e);
	response.sendRedirect("Login.jsp");
}
%>
</body>
</html>`