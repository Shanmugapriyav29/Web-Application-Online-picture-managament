<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title><script type="text/javascript">
function validate()
{ 
var u=loginform.username.value;
var p=loginform.passwd.value;
var upat=/^\w{10}\w*@[a-z A-Z]{5}.[a-z A-Z]{2,3}$/;
var ppat=/^\w*(\d\w*[a-z A-Z]|[a-z A-Z]\w*\d)\w*$/;
if(upat.test(u))
{ 
if(ppat.test(p))
{
return true;
}
else
{
window.alert(" Enter correct password");
return false;
}
}
else
{
window.alert(" Enter correct username");
return false;
}

}
</script>
</head>
<body background="login.jpg">
<form method="post" action="loginvalidate.jsp" name="loginform" onsubmit="return validate()">
<center><b>
<h1>
 HIGH CONNECT
</h1>
Username:<input type="text" name="username" id="uname"></br></br>
Password :<input type="password" name="passwd" id="pwd"></br></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Login" name="login">&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="Reset" name="clear"></br></br>&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="Signup.jsp">Create a New Account</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="forgot.html">FORGORT PASSWORD</a></br><br> 
&nbsp;
<%
if(null!=session.getAttribute("loginmessage"))
{
String a=(String)session.getAttribute("loginmessage");
String b="Successfully Logout";
String c="Account is Deactivated";
String d="Enter Correct Username and Password";
out.println(a);
if(a==b||a==c||a==d)
{
	session.invalidate();
}
}%>
</b>
</center>
</form>
</body>
</html>