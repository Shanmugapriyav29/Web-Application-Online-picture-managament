<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
</head><body background="login.jpg">
<marquee direction="left" behavior ="alternate"> <h1>HIGHCONNECT</h1></marquee>
<form action="Login.jsp">
<table width=100%>
<tr>
<td align="left"><h4><%
	out.println("Welcome "+session.getAttribute("role")+"!...");%></h4><%
session.setAttribute("loginmessage","Successfully Logout");
%></td>
<td align="right"><p align="right"><a href="Login.jsp" target="_top">Logout</a></p></td>
</tr>
</table>
</form>
</body>
</html>