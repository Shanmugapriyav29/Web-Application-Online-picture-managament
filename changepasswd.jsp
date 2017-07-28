<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="login.jpg">
<%
String oldp=request.getParameter("oldpassword");
String newp=request.getParameter("newpassword");
Connection conn=null;
ResultSet rs=null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
String ffname=(String)session.getAttribute("photoemail");
try
{
conn=DriverManager.getConnection(URL,"root","admin");
ps=conn.prepareStatement("select * from login where passwd=?");
ps.setString(1,oldp);
rs=ps.executeQuery();
if(rs.next())
{
	ps1=conn.prepareStatement("update login set passwd=? where uname=?");
	ps2=conn.prepareStatement("update userdetails set passwd=? where email=?");
	ps1.setString(1,newp);
	ps2.setString(1,newp);
	ps1.setString(2,ffname);
	ps2.setString(2,ffname);
	int v1=ps1.executeUpdate();
	int v2=ps2.executeUpdate();
	if(v1>=1&&v2>=1)
	{
		session.setAttribute("changepasswordmessage","PASSWORD CHANGED");
		response.sendRedirect("Message1.jsp");
	}
	else
	{
		session.setAttribute("changepasswordmessage","PASSWORD NOT CHANGED");
		response.sendRedirect("Message1.jsp");
	}
}
else
{
	session.setAttribute("changepasswordmessage","PASSWORD NOT CHANGED");
	response.sendRedirect("Message1.jsp");
}
}
catch(Exception e)
{
	session.setAttribute("changepasswordmessage",e);
	out.println(e);
}
%>
</body>
</html>