<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Highconnect/UpdateDetails</title>
</head>
<body background="login.jpg">
<%

Connection conn=null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
try
{
conn=DriverManager.getConnection(URL,"root","admin");
ps=conn.prepareStatement("update userdetails set fname=?,lname=?,dob=?,age=?,phoneno=? where email=?");
ps1=conn.prepareStatement("update login set role=? where uname=?");
String email=request.getParameter("email");
ps.setString(6,email);
ps1.setString(2,email);
String sfname=request.getParameter("fname");
String slname=request.getParameter("lname");
String sage=request.getParameter("age");
String sdob=request.getParameter("dob");
String sphoneno=request.getParameter("phoneno"); 
ps.setString(1,sfname);
ps.setString(2,slname);
ps.setString(3,sdob);
ps.setString(4,sage);
ps.setString(5,sphoneno);
ps1.setString(1,sfname);
int v1=ps1.executeUpdate();
int v=ps.executeUpdate();
if(v==1&&v1==1)
{ 
	session.setAttribute("editupmessage","Successfully updated");
	response.sendRedirect("editdetails.jsp");
}
else
{
	session.setAttribute("editupmessage","Unable to edit");
	response.sendRedirect("editdetails.jsp");

	out.println("Unable to add to database");
}
	ps.close();
conn.close();
}
catch(Exception e)
{session.setAttribute("editupmessage",e);
	response.sendRedirect("editdetails.jsp");
	
}
%>

</body>
</html>