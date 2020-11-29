
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<HTML><HEAD></HEAD>
<Body background="account.jpg">
    <FORM NAME="AccountForm" ACTION="/Account" METHOD ="POST">
        <INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
      	<br>
      	<br>
      	<br>
        <center>  
        <fieldset style="width:450px">
         <legend align="left"><b><font size ='6'color="red">Open Account</font></b></legend><br>
        <TABLE cellPadding=3 ALIGN='center'>
        
        <!--<TR bgcolor='#ECFAEB'>-->
        <TR background='account.jpg'>
	      <TD><B><font size ='5'>Choose Account Type:</font></b></TD>
	         <TD>
	            <select size="1" name="CheckingOrSavings">
	               
			 <option selected value="Checking">Checking Account</option>
			  <option value="Savings">Savings Account</option>  
	  	          </select>
	            </TD>
            </TR>
           <!-- <TR bgcolor='#F1F1FD'>-->
            <TR background='account.jpg'>
	          <TD><B><font size ='5'>Username:</font></B></TD>
	              <TD>
	              <INPUT TYPE='text' NAME='UsernameField' Value='<%=request.getParameter("UserID")%>' SIZE='25'>
	              </TD>
            </TR>
            <!-- <TR bgcolor='#ECFAEB'>-->
             <TR background='account.jpg'>
             <TD><B><font size ='5'>Customer Name:</font></B></TD>
	     	      <TD>
	     	      	<INPUT TYPE='text' NAME='CustomerNameField' Value='<%=request.getParameter("Name")%>' SIZE='25' placeholder='Enter Customer Name'>
	     	      </TD>
            </TR>
           <!-- <TR bgcolor='#F1F1FD'>-->
           <TR background='account.jpg'>
            <TD><B><font size ='5'>Account Number:</font></B></TD>
	    	        <TD>
	    	        <INPUT TYPE='text' NAME='AccountNumberField' Value='' SIZE='25' placeholder='Enter Account Number'>
	    	        </TD>
            </TR>
            <!--<TR bgcolor='#ECFAEB'>-->
            <TR background='account.jpg'>
            <TD><B><font size ='5'>Opening Deposit:</font></B></TD>
	    	    	  <TD>
	    	    	   <INPUT TYPE='text' NAME='OpeningDepositField' Value='' SIZE='25' placeholder='Enter Opening Deposit'>
	    	    	  </TD>
            </TR>
            </TABLE><BR>
            
         
	                <CENTER><INPUT TYPE="SUBMIT" NAME='submitBNTN' VALUE='Open' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px"></CENTER><BR>
	    	   </fieldset>
	    	     </center>
	    	   </FORM>
	    	    </BODY>
	    	    </HTML>
	    	    <SCRIPT LANGUAGE='JavaScript'>
</SCRIPT>