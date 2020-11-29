
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<%
String sav[] = LoginServlet.getSavingAccountNumbers(request.getParameter("UserID"));
String check[] = LoginServlet.getCheckingAccountNumbers(request.getParameter("UserID"));
%>
<HTML><HEAD></HEAD>
<Body background="Deposit.jpg">
    <FORM NAME="DepositForm" ACTION="/Deposit" METHOD ="POST">
        <INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
         <br>
	 <br>
        <br>
        <center>
        <fieldset style="width:450px">
         <legend align="left"><b><font size ='6'color="red">Deposit</font></b></legend><br>
        <TABLE cellPadding=3 ALIGN='center'>

            <TR background='Deposit.jpg'>
                <TD><B><font size ='5'>Deposit To:</font></B></TD>
                <TD>
			<select size="1" name="CheckingOrSavings">
				<option selected value="x">Checking Account</option>
				<% for(int i = 0; i < check.length; i++) {
				if(check[i] != null) {
					out.println("<option value='c" + check[i] + "'>Checking- ****"+ check[i].substring(4) + "</option>");
				}
				}%>
				<option value="x"><b></u>Savings Account<u></b></option> 
				<% for(int i = 0; i < sav.length; i++) {
				if(sav[i] != null) {
					out.println("<option value='s" + sav[i] + "'>Savings- ****"+ sav[i].substring(4) + "</option>");
				}
				}%>	
			</select>
                </TD>
            </TR>

            <TR background='Deposite.jpg'>
                <TD><B><font size ='5'>Amount to Deposit:</font></B></TD>
                <TD>
                   <INPUT TYPE='text' NAME='AmountField' Value='' SIZE='15' placeholder='Enter Amount'>
                </TD>
            </TR>
          </TABLE><BR>
<CENTER><INPUT TYPE="SUBMIT" NAME='submitBNTN' VALUE='Make Deposit' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px"></CENTER><BR>
</fieldset>
</center>
</FORM>

</BODY>
</HTML>
<SCRIPT LANGUAGE='JavaScript'>
</SCRIPT>