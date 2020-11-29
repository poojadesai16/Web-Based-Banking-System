
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.desai.*;" %>

<%
String sav[] = LoginServlet.getSavingAccountNumbers(request.getParameter("UserID"));
String check[] = LoginServlet.getCheckingAccountNumbers(request.getParameter("UserID"));
%>

<Html>
<head>
<title></title></head>
<Body background="acc.jpg">

<FORM NAME="OverviewPage" ACTION="/CSCI6810/PreOverview.jsp?UserID=<%=request.getParameter("UserID")%>&Name=<%=request.getParameter("Name")%>" METHOD ="POST">
<INPUT TYPE='hidden' NAME='UserID' VALUE='<%=request.getParameter("UserID")%>'>
<br>
<center>
<fieldset style="width:470px">
           
        <legend align='left'><b><font size ='6'color="red">Account Overview</font></b></legend><br>
        <fieldset style='width:300px'>
        <legend align='left'><b><font size ='3'color="blue">Checking Accounts</font></b></legend>
        <%
        int i = 0;
        while(i < check.length) {
        	if(check[i] != null) {
			CheckingAccount checkAccs = new CheckingAccount(request.getParameter("UserID"));
			checkAccs.setCANum(check[i]);
			float bal = checkAccs.getBalance();
        		out.println("<label><b>Account Number:</b></label>");
        		out.println("<input name='CheckingAccountNumber' type='CheckNumber' value='"+ check[i] +"'>");
        		out.println("<br><label><b>Current Balance:</label>");
        		out.println("<input name='CheckCurrtBal' type='CheckBal' value='$"+ bal + "'><BR><br>");
        	}
        	i++;
        }
        %>
       </fieldset>
        
        <fieldset style='width:300px'>
        <legend align='left'><b><font size ='3'color="blue">Savings Accounts</font></b></legend>
        <%
        int j = 0;
        while(j < sav.length) {
        	if(sav[j] != null) {
			SavingsAccount savAccs = new SavingsAccount(request.getParameter("UserID"));
			savAccs.setSANum(sav[j]);
			float bal = savAccs.getBalance();
        		out.println("<label><b>Account Number:</b></label>");
        		out.println("<input name='SavingAccountNumber' type='SavingNumber' value='"+ sav[j] +"'>");
        		out.println("<br><label><b>Current Balance:</label>");
        		out.println("<input name='SavCurrtBal' type='SavBal' value='$"+ bal +"'><BR><br>");
        	}
        	j++;
        }
        %>
       </fieldset>

     <INPUT TYPE="SUBMIT" NAME='RefreshBNTN' VALUE='Refresh' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px">&nbsp;&nbsp;
     <INPUT TYPE="SUBMIT" NAME='InterestBNTN' VALUE='Show Me Interest' style="font-size:12pt;color:white;background-color:black;border:2px solid #336600;padding:7px"> 
         
    </fieldset>
        </center>
    </form>

    
    </body>
    </html>