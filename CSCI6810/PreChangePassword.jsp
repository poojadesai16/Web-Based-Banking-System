<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<%
String sav[] = LoginServlet.getSavingAccountNumbers(request.getParameter("UserID"));
String check[] = LoginServlet.getCheckingAccountNumbers(request.getParameter("UserID"));
%>
<HTML><HEAD></HEAD>
<Body background="T1.jpg">
    <FORM NAME="ChangePassword" ACTION="/ChangePassword" METHOD ="POST">
        <INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
	<br>
	<br>
        <br>
        <center>
         <fieldset style="width:450px">
         <legend align="left"><b><font size ='6'color="red">Change Password</font></b></legend><br>
        <TABLE cellPadding=3 ALIGN='center'>

           <TR background='T1.jpg'>
                <TD><B><font size ='5' color='white'><font >User Name:</font></B></TD>
                    <TD>
		        <INPUT TYPE='text' NAME='UserID' Value='<%=request.getParameter("UserID")%>' SIZE='20' >
		    </TD>
            </TR>
             <TR background='T1.jpg'>
	                    <TD><B><font size ='5' color='white'><font >Current Password:</font></B></TD>
	                        <TD>
	    		        <INPUT TYPE='text' NAME='password' Value='' SIZE='20' >
	    		    </TD>
            </TR>
            
             <TR background='T1.jpg'>
	    	          <TD><B><font size ='5' color='white'>New Password:</B></TD>
	    	            <TD>
	    	    	       <INPUT TYPE='text' NAME='newpassword' Value='' SIZE='20' placeholder='Enter Password'>
	    	          </TD>
	                </TR>
	                <TR background='T1.jpg'>
				    	          <TD><B><font size ='5' color='white'>ReNew Password:</B></TD>
				    	            <TD>
				    	    	       <INPUT TYPE='text' NAME='renewpassword' Value='' SIZE='20' placeholder='Enter Password'>
				    	          </TD>
	                </TR>
	                </TABLE><BR>
	                <CENTER><INPUT TYPE="SUBMIT" NAME='submitBNTN' VALUE='Change Password' style="font-size:12pt;color:black;background-color:White;border:2px solid #336600;padding:7px"></CENTER><BR>
	    	    </fieldset>
	    	    </center>
	    	    </FORM>
	    	    </BODY>
	    	    </HTML>
        