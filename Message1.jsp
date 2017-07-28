<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="login.jpg"><center>
<%
Connection conn=null;
ResultSet rs=null;
Statement st;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver");
String URL="jdbc:mysql://localhost:3306/highconnect";
conn=DriverManager.getConnection(URL,"root","admin");
st = conn.createStatement();

//ps=conn.prepareStatement("select * from login where role like ?% ");
String q=request.getParameter("name").toUpperCase();
//ps.setString(1,q);
rs=st.executeQuery("select * from login where upper(role) like '" + q + "%'");

String rec = "";
while(rs.next())
{
rec = rec + "," + rs.getString(3);

}
out.println(rec);
%>
</center>
</body>
</html>