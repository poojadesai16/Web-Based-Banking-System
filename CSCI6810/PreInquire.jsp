
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
    <FORM NAME="InquireForm" ACTION="/Inquire" METHOD ="POST">
        <INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
	<br>
	<br>
        <br>
        <center>
         <fieldset style="width:450px">
         <legend align="left"><b><font size ='6'color="red">Inquire Transaction</font></b></legend><br>
        <TABLE cellPadding=3 ALIGN='center'>

           <TR background='T1.jpg'>
                <TD><B><font size ='5' color='white'><font >Starting Date:</font></B></TD>
                    <TD>
		        <INPUT TYPE='text' NAME='StartDateField' Value='' SIZE='20' placeholder='YYYY-MM-DD'>
		    </TD>
            </TR>
            
            <TR background='T1.jpg'>
	          <TD><B><font size ='5' color='white'>Ending Date:</B></TD>
	            <TD>
	    	       <INPUT TYPE='text' NAME='EndDateField' Value='' SIZE='20' placeholder='YYYY-MM-DD'>
	          </TD>
            </TR>
            </TABLE><BR>
            <CENTER><INPUT TYPE="SUBMIT" NAME='submitBNTN' VALUE='Search Inquire Transaction' style="font-size:12pt;color:black;background-color:White;border:2px solid #336600;padding:7px"></CENTER><BR>
	    </fieldset>
	    </center>
	    </FORM>
	    </BODY>
	    </HTML>
	    <SCRIPT LANGUAGE='JavaScript'>
</SCRIPT>