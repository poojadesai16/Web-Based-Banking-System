<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<HTML><HEAD></HEAD>
<Body background="3.jpg">
    <FORM NAME="InquireForm" ACTION="/Inquire" METHOD ="POST">
        <INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
	<h2><center><I><font color="Blue">Inquire Transaction Form</font></I></center><h2>
        <TABLE cellPadding=3 ALIGN='center'>

           <TR bgcolor='#ECFAEB'>
                <TD><B>Starting Date:</B></TD>
                    <TD>
		        <INPUT TYPE='text' NAME='StartDateField' Value='' SIZE='20' placeholder='Enter Starting Date'>
		    </TD>
            </TR>
            
            <TR bgcolor='#F1F1FD'>
	          <TD><B>Ending Date:</B></TD>
	            <TD>
	    	       <INPUT TYPE='text' NAME='EndDateField' Value='' SIZE='20' placeholder='Enter Ending Date'>
	          </TD>
            </TR>
            </TABLE><BR>
            <CENTER><INPUT TYPE="SUBMIT" NAME='submitBNTN' VALUE='Search Inquire Transaction' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px"></CENTER><BR>
	    </FORM>
	    </BODY>
	    </HTML>
	    <SCRIPT LANGUAGE='JavaScript'>
</SCRIPT>