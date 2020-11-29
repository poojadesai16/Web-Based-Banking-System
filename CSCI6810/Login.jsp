

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<%
	String Username = new String("");
	String Password = new String("");
	
	Username = request.getParameter( "UserName" );
	Password = request.getParameter( "PassWord" );
	
        Account Acct = new Account(Username, Password);
          String CustomerName = Acct.signIn();
	 if (!CustomerName.equals(""))
            out.println("Login failed because of invalid username or password.. Please try again!");
        else { 
%>

		<HTML><HEAD></HEAD>
		<BODY background='7.jpg'>
		<h4 ALIGN='center'><font color='blue'>Welcome To Provident Bank!</font></h4>
		<FORM NAME="LoginPage" ACTION="/LoginServlet" METHOD ="POST">
		<TABLE cellPadding='3' ALIGN='Right'>
		
		<TR bgcolor='#ECFAEB'>
		<TD><B>USERNAME:</B></TD>
		<TD>
		<INPUT TYPE='text' NAME='UserName' Value='<%= Username %>' SIZE='15' placeholder='Enter Username' focused>
		</TD>
		</TR>
		<TR bgcolor='#ECFAEB'>
		<TD><B>PASSWORD:</B></TD>
		<TD>
		<INPUT TYPE='password' NAME='PassWord' Value='' SIZE='15'>
		<INPUT TYPE='button' NAME='submitBTN' VALUE='Login' onClick="checkInputs()" style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px">
		</TD>
		</TR>
		</TABLE>
		</FORM>
		</BODY>
		<SCRIPT LANGUAGE="JavaScript"> 
		function checkInputs()
		{
		var Prompts = "";
		Username = window.document.LoginPage.UserName.value;
		Password = window.document.LoginPage.PassWord.value;
		if (Username == "" || Password == "") {
		if (Username == "")
		Prompts +="Please enter your username!\n";
		if (Password == "")
		Prompts +="Please enter your password!\n";
		if (Prompts != "")
		window.alert(Prompts);
		} else {
		document.LoginPage.submit();
		}
		}
		</SCRIPT>
		</HTML>

<%		}
%>
 