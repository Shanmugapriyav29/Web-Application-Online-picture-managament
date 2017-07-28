<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    <html>
<head>
<meta charset="ISO-8859-1">
<title>sample</title>
</head>
<body background="login.jpg">
<%
Connection conn=null;
ResultSet rs=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
conn=DriverManager.getConnection(URL,"root","admin");
ps=conn.prepareStatement("select * from login where role=?");
String some=request.getParameter("some");
ps.setString(1,some);
rs=ps.executeQuery();
while(rs.next())
{
session.setAttribute("frndemail",rs.getString(1));
//out.println(frndemail);
response.sendRedirect("Upload.jsp");}
%>
</body>
</html>