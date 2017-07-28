<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function showName(str)
{
	if(str.length==0)
		{
		document.getElementById("txtHint").innerHTML="";
		return;
		}
	else{
		var xmlhttp=new XMLHttpRequest();
		xmlhttp.onreadystatechange=function()
		{
			if(xmlhttp.readyState==4 && xmlhttp.status==200)
		{
				document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
		}
		}
		xmlhttp.open("GET","Message1.jsp?name="+str,true);
		xmlhttp.send();
		}
	}
		</script>
</head>
<body background="login.jpg">
 <center>
        <h1>WANT TO TAG WITH FRIENDS</h1>
        <form method="post" action="sample.jsp">
          </br>
        <input type="text" onkeyup="showName(this.value)" name="some">
       
         <p>Friends:<span id="txtHint"></span></p>
          <input type="submit" value="SUBMIT">
       </form>
    </center>
</body>
</html>