<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<Html>
<head>
<title></title></head>
<Body background="3.jpg">

<FORM NAME="OverviewPage" ACTION="/Overview" METHOD ="POST">
<INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
<br>
<br>
<center>
<fieldset style="width:470px">
           
        <legend><b><font color="blue">Account Overview</font></b></legend><br>
   <fieldset style="width:370px">
        <legend align="left"><b>Checking Account</b></legend>
        
        <label><b>Account Number:</b></label>
       
        <input name="CheckingAccountNumber" type="CheckNumber" value=""><BR><BR>
     
          <label><b>Current Balance:</label>

        <input name="CheckCurrtBal" type="CheckBal" value=""><BR>
        
        </fieldset>
        <BR><BR>
<fieldset style="width:370px">
          <legend align="left"><b>Savings Account</b></legend>
   
	         
	         <label><b>Account Number:</b></label>
	        
	         <input name="SavingsAccountNumber" type="SavingsNumber" value=""><BR><BR>
	           <label>Current Balance:</label>
	 
        <input name="SavingsCurrtBal" type="SavingsBal" value=""><BR>
</fieldset>
     <BR>

     <INPUT TYPE="SUBMIT" NAME='RefreshBNTN' VALUE='Refresh' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px">&nbsp;&nbsp;
        <INPUT TYPE="SUBMIT" NAME='InterestBNTN' VALUE='Show Me Interest' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px"> 
    </fieldset>
        </center>
    </form>

    
    </body>
    </html>