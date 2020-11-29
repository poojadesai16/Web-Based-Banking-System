<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<HTML><HEAD></HEAD>
<Body background="3.jpg">
    <FORM NAME="WithdrawForm" ACTION="/Withdraw" METHOD ="POST">
        <INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
        <h2><center><I><font color="Blue">Withdraw Form</font></I></center><h2>
        <TABLE cellPadding=3 ALIGN='center'>

            <TR bgcolor='#ECFAEB'>
                <TD><B>Withdraw From:</B></TD>
                <TD>
                    <select size="1" name="CheckingOrSavings">
		    	<option selected value="Checking">Checking</option>
		    	<option value="Savings">Savings</option>    
  	            </select>
                </TD>
            </TR>

            <TR bgcolor='#F1F1FD'>
                <TD><B>Amount to Withdraw:</B></TD>
                <TD>
                   <INPUT TYPE='text' NAME='AmountField' Value='' SIZE='15' placeholder='Enter Amount'>
                </TD>
            </TR>
          </TABLE><BR>
<CENTER><INPUT TYPE="SUBMIT" NAME='submitBNTN' VALUE='Make Withdrawal' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px"></CENTER><BR>
</FORM>

</BODY>
</HTML>
<SCRIPT LANGUAGE='JavaScript'>
</SCRIPT>