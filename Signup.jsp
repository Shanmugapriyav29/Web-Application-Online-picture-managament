<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up Page</title>
<script type="text/javascript">
function validate()
{
var fn=signupform.fname.value;	
var ln=signupform.lname.value;
var d=signupform.dob.value;
var a=signupform.age.value;
var u=signupform.email.value;
var p=signupform.passwd.value;
var cp=signupform.cpasswd.value;
var ph=signupform.phoneno.value;
var phpat=/^[0-9]{10}$/;
var upat=/^\w{10}\w*@[a-z A-Z]{5}.[a-z A-Z]{2,3}$/;
var ppat=/^\w*(\d\w*[a-z A-Z]|[a-z A-Z]\w*\d)\w*$/;
fnpat=/^\w{3,20}$/;
lnpat=/^\w{3,20}$/;
dpat=/^([1]|[2])\d{3}-\d{2}-\d{2}$/;
apat=/^[^0]\d{2,3}$/;
if(fn==""||ln==""||d==""||a==""||u==""||p==""||cp==""||ph=="")
	{
	window.alert(" Fill all values");
	return false;
	}
else
	{
	if(!fnpat.test(fn)
		{
		window.alert(" Enter Firstname");
		return false;
		}
	else
		{
		if(!lnpat.test(ln))
			{
			window.alert(" Enter Lastname");
			return false;
			}
		else
			{
			if(!dpat.test(d))
			{
			window.alert(" Enter valid date of birth");
			return false;
			}
			else
				{
				if(!apat.test(a))
				{
				window.alert(" Enter age");
				return false;
				}
				else
				{
				if(!upat.test(u))
					{ 
					window.alert(" Enter correct username");
					return false;
					}
				else{
					if(p!=cp)
					{
 					window.alert(" password doesn't match");
 					return false;
					}
					else{
						if(phpat.test(ph))
						{
						window.alert("Reenter phone number");
						return false;
						}
						else
						{
						return true;
						}
						}
					}
				}
				}
			}
		}
	}
	}
	</script>
</head>
<body background="login.jpg">
<form method="post" name="signupform" action="admindb.jsp"onsubmit="return validate()">
<center><b>
<h1>SIGN UP FORM</h1>
FirstName 
&nbsp:<input type="text" name="fname"></br></br>
LastName&nbsp&nbsp:<input type="text" name="lname"></br></br>
DateofBirth:<input type="text" name="dob"></br></br>
Age&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:
<input type="text" name="age"></br></br>
Email&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:
<input type="text" name="email"></br></br>
Password&nbsp:<input type="password" name="passwd"></br></br>
Confirm&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
:<input type="password" name="cpasswd"></br></br>
Phoneno&nbsp&nbsp:<input type="text" name="phoneno"></br></br></b>
<input type="submit" value="SUBMIT">
<input type="reset" value="RESET">
</br>
</br>
<%
String d=(String)session.getAttribute("signupmessage");
if(d!=null)
{ out.println(d);
String c="Unable to Signup";
String u="Email Id already exits";
if(d==c||d==u)
	session.invalidate();
}
%></center> 
</form>
</body>
</html>