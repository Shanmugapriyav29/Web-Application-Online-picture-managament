<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
    <%@ page import="java.io.*,java.util.*, javax.servlet.*, java.lang.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@page import  = "java.util.*"%>
<%@page import  = "javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>photo add validation</title>
</head>
<body>
<%
Connection conn=null;
PreparedStatement statement=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/highconnect";
String user = "root";
String password = "admin";
try {
     conn = DriverManager.getConnection(url,user,password);
String sql = "insert into photoadd(photo) values (?)";
  statement = conn.prepareStatement(sql);
InputStream inputStream = null;
    Part filePart = request.getPart("photo");
    out.println("executing");
		if (filePart != null) {
		
			inputStream = filePart.getInputStream();
		}
   statement.setBlob(1, inputStream);

    int row = statement.executeUpdate();
    out.println("beforeif ");
    if (row>0) {
    	out.println("successfully updated");
       //response.sendRedirect("Main.jsp");
    }
    else
    {
    	out.println("not added");
    	//response.sendRedirect("addphoto.html");
    }
} catch (Exception ex)
{ 
	out.println(ex);
   // ex.printStackTrace();
}

%>
</body>
</html>