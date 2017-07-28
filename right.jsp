
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Photoview</title>
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
ps=conn.prepareStatement("select * from photoadd where email=? and photono=?");
//String ffname=request.getParameter("photo");
String ffname=(String)session.getAttribute("photoemail");
ps.setString(1,ffname);
String fno=request.getParameter("no");
ps.setString(2,fno);

rs=ps.executeQuery(); 
if(rs.next())
{
 OutputStream oImage;
	byte[] bf =rs.getBytes(2);
response.setContentType("image/gif");
oImage=response.getOutputStream();
oImage.write(bf);
oImage.flush();
oImage.close();
}
}
catch(Exception e)
{ 
	out.println(e);
}
%>
</body>
</html>