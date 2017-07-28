<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Highconnect/ForgotPassword1</title>
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
ps=conn.prepareStatement("select * from userdetails where email=?");
String username=request.getParameter("username");
ps.setString(1,username);
rs=ps.executeQuery();
if(rs.next())
{
	String msgcode="http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?username=bhuvangates&password=reccseit&sendername=bhuvan&mobileno=91"+rs.getString(7)+"&message="+rs.getString(6);
    response.sendRedirect(msgcode);
   }
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