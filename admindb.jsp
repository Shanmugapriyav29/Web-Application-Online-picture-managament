<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Details</title>
</head>
<body background="login.jpg">
<%

Connection conn=null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
try
{
conn=DriverManager.getConnection(URL,"root","admin");
ps2=conn.prepareStatement("select * from userdetails where email=?");
ps=conn.prepareStatement("insert into userdetails values(?,?,?,?,?,?,?)");
ps1=conn.prepareStatement("insert into login values(?,?,?)");

String spasswd=request.getParameter("passwd");
String sfname=request.getParameter("fname");
String slname=request.getParameter("lname");
String sage=request.getParameter("age");
String sdob=request.getParameter("dob");
String semail=request.getParameter("email");
String sphoneno=request.getParameter("phoneno");
ps2.setString(1,semail);
rs=ps2.executeQuery();
if(!rs.next())
{
ps.setString(1,sfname);
ps.setString(2,slname);
ps.setString(3,sdob);
ps.setString(4,sage);
ps.setString(5,semail);
ps.setString(6,spasswd);
ps.setString(7,sphoneno);
ps1.setString(1,semail);
ps1.setString(2,spasswd);
ps1.setString(3,sfname);

int v1=ps1.executeUpdate();
int v=ps.executeUpdate();

if(v==1&&v1==1)
{ 
	session.setAttribute("role",sfname);
	out.println("successfully Added");
	response.sendRedirect("Main.jsp");
}
else
{
	session.setAttribute("signupmessage","Unable to Signup");
	response.sendRedirect("Signup.jsp");

	out.println("Unable to add to database");
}
}else
{
	session.setAttribute("signupmessage","Email Id already exits");
	response.sendRedirect("Signup.jsp");
}

ps.close();
conn.close();
}
catch(Exception e)
{session.setAttribute("signupmessage",e);
	response.sendRedirect("Signup.jsp");
	out.println(e);
}
%>

</body>
</html>