<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Highconnect/Deactivate Account</title>
</head>
<body background="login.jpg">

<%
Connection conn=null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;
ResultSet rs=null;
ResultSet rs1=null;
ResultSet rs2=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
try
{
conn=DriverManager.getConnection(URL,"root","admin");
ps=conn.prepareStatement("delete from login where uname=?");
ps1=conn.prepareStatement("delete from userdetails where email=?");
ps2=conn.prepareStatement("delete from photoadd where email=?");
String email=(String)session.getAttribute("photoemail");
out.println(email);
ps.setString(1,email);
ps1.setString(1,email);
ps2.setString(1,email);
int v=ps.executeUpdate();
int v1=ps1.executeUpdate();
int v2=ps2.executeUpdate();
if(v>=1&&v1>=1)
{ session.setAttribute("loginmessage","Account is Deactivated");
	response.sendRedirect("Login.jsp");
}
else
{ 
	response.sendRedirect("Main.jsp");
}
ps.close();
ps1.close();
ps2.close();
conn.close();
}
catch(Exception e)
{ 
	out.println(e);
}
%>
</body>
</html>