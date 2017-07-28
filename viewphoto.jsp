<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Highconnect/ViewPhoto</title>
</head><body background="login.jpg"><center>
<table border='1' >
<% Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
try
{
conn=DriverManager.getConnection(URL,"root","admin");
ps=conn.prepareStatement("select * from photoadd where email=?");
String formemail=(String)session.getAttribute("photoemail");
String role=(String)session.getAttribute("role");
ps.setString(1,formemail);
rs=ps.executeQuery();
while(rs.next())
{ 
String event=rs.getString(3);//?accesskey=<%=rs.getString(1)%>

	<tr><%out.println(role);%></br></br></tr>
	
	<tr>
<img src="right.jsp?no=<%=rs.getString(3)%>" width="250" height="250"/></br></br></tr>
<%
}
}
catch(Exception e)
{
	out.println(e);
}
%></table></center>
</body>
</html>