<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ChangePassword</title>
</head>
<script type="text/javascript">
function validate()
{
	newpass=myform.newpassword.value;
	confirmpass=myform.confirmpassword.value;
	if(newpass==confirmpass)
		{
		return true;
		}
	else
		{
		return false;
		}
		}
		</script>
<body background="login.jpg">
<form method="post" action="changepasswd.jsp">
<center><h1>CHANGE PASSWORD</h1></br>
OLD PASSWORD&nbsp;&nbsp;&nbsp;&nbsp;:<input type="password" name="oldpassword"></br></br>
NEW PASSWORD&nbsp;&nbsp;&nbsp;&nbsp;:<input type="password" name="newpassword"></br></br>
CONFIRM PASSWORD:<input type="password" name="confirmpassword"></br></br>
<input type="submit" value="CHANGE PASSWORD">
</center></form>
</body>
</html>