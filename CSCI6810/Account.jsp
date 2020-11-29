<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<HTML><HEAD></HEAD>
<Body background="3.jpg">
    <FORM NAME="AccountForm" ACTION="/Account" METHOD ="POST">
        <INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
         <h2><center><I><font color="Blue">Open Account Form</font></I></center><h2>   
         
        <TABLE cellPadding=3 ALIGN='center'>
        
        <TR bgcolor='#ECFAEB'>
	      <TD><B>Choose Account Type:</b></TD>
	         <TD>
	            <select size="1" name="CheckingOrSavings">
			 <option selected value="Checking">Checking</option>
			  <option value="Savings">Savings</option>  
	  	          </select>
	            </TD>
            </TR>
            <TR bgcolor='#F1F1FD'>
	          <TD><B>Username:</B></TD>
	              <TD>
	              <INPUT TYPE='text' NAME='UsernameField' Value='<%=request.getParameter("UserID")%>' SIZE='25'>
	              </TD>
            </TR>
             <TR bgcolor='#ECFAEB'>
             <TD><B>Customer Name:</B></TD>
	     	      <TD>
	     	      	<INPUT TYPE='text' NAME='CustomerNameField' Value='<%=request.getParameter("Name")%>' SIZE='25' placeholder='Enter Customer Name'>
	     	      </TD>
            </TR>
            <TR bgcolor='#F1F1FD'>
            <TD><B>Account Number:</B></TD>
	    	        <TD>
	    	        <INPUT TYPE='text' NAME='AccountNumberField' Value='' SIZE='25' placeholder='Enter Account Number'>
	    	        </TD>
            </TR>
            <TR bgcolor='#ECFAEB'>
            <TD><B>Opening Deposit:</B></TD>
	    	    	  <TD>
	    	    	   <INPUT TYPE='text' NAME='OpeningDepositField' Value='' SIZE='25' placeholder='Enter Opening Deposite'>
	    	    	  </TD>
            </TR>
            </TABLE><BR>
	                <CENTER><INPUT TYPE="SUBMIT" NAME='submitBNTN' VALUE='Open' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px"></CENTER><BR>
	    	    </FORM>
	    	    </BODY>
	    	    </HTML>
	    	    <SCRIPT LANGUAGE='JavaScript'>
</SCRIPT>