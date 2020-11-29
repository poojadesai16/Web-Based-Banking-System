<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>
<HTML><HEAD></HEAD>
<Body background="3.jpg">
    <FORM NAME="ChangePassword" ACTION="/ChangePass" METHOD ="POST">
        <INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
	<h2><center><I><font color="Blue">Change Password Form</font></I></center><h2>
        <TABLE cellPadding=3 ALIGN='center'>
        <TR bgcolor='#ECFAEB'>
	                <TD><B>User Name:</B></TD>
	                    <TD>
			        <INPUT TYPE='text' NAME='UserID' Value='<%=request.getParameter("UserID")%>' SIZE='20'>
			    </TD>
            </TR>
            <TR bgcolor='#ECFAEB'>
	    	                <TD><B>Current Password:</B></TD>
	    	                    <TD>
	    			        <INPUT TYPE='text' NAME='password' Value='' SIZE='20'>
	    			    </TD>
            </TR>
            <TR bgcolor='#F1F1FD'>
	    	          <TD><B>New Password:</B></TD>
	    	            <TD>
	    	    	       <INPUT TYPE='text' NAME='newpassword' Value='' SIZE='20'>
	    	          </TD>
	                </TR>
	                <TR bgcolor='#F1F1FD'>
				    	          <TD><B>ReNew Password:</B></TD>
				    	            <TD>
				    	    	       <INPUT TYPE='text' NAME='renewpassword' Value='' SIZE='20'>
				    	          </TD>
	                </TR>
	                </TABLE><BR>
	                <CENTER><INPUT TYPE="SUBMIT" NAME='submitBNTN' VALUE='Change Password' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px"></CENTER><BR>
	    	    </FORM>
	    	    </BODY>
	    </HTML>