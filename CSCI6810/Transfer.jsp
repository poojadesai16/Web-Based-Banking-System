<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<HTML><HEAD></HEAD>
<Body background="3.jpg">
    <FORM NAME="TransferForm" ACTION="/Transfer" METHOD ="POST">
        <INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
	<h2><center><I><font color="Blue">Transfer Form</font></I></center><h2>
        <TABLE cellPadding=3 ALIGN='center'>

            <TR bgcolor='#ECFAEB'>
                <TD><B>Transfer From:</B></TD>
                <TD>
                    <select size="1" name="FromCheckingOrSavings">
		    	<option selected value="Checking">Checking</option>
		    	<option value="Savings">Savings</option>
  	            </select>
                </TD>
            </TR>
            <TR bgcolor='#F1F1FD'>
                <TD><B>Transfer To:</B></TD>
                <TD>
                    <select size="1" name="ToCheckingOrSavings">
		    	<option value="Checking">Checking</option>
		    	<option selected value="Savings">Savings</option>
  	            </select>
                </TD>
            </TR>
            <TR bgcolor='#ECFAEB'>
                <TD><B>Amount to Transfer:</B></TD>
                <TD>
                   <INPUT TYPE='text' NAME='AmountField' Value='' SIZE='15' placeholder='Enter Amount'>
                </TD>
            </TR>
          </TABLE><BR>
<CENTER><INPUT TYPE="SUBMIT" NAME='submitBNTN' VALUE='Make Transfer' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px"></CENTER><BR>
</FORM>

</BODY>
</HTML>
<SCRIPT LANGUAGE='JavaScript'>
</SCRIPT>