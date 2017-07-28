<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="login.jpg">
<center><h1>STATUS</h1>
<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
try
{
conn=DriverManager.getConnection(URL,"root","admin");
ps=conn.prepareStatement("delete from photoadd where email=?");
String e=(String)session.getAttribute("photoemail");
ps.setString(1,e);
System.out.println(e);
int v=ps.executeUpdate();
if(v>=1)
{
	out.println("PHOTO DELETED");
}
else
{
	out.println("UNABLE TO DELETE PHOTOS");
}
ps.close();
conn.close();
}
catch(Exception e)
{ 
	out.println(e);
}
%>
</center>
</body>
</html>