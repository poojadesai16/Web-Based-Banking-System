import java.io.*;
import javax.servlet.*;  //package for GenericServlet
import javax.servlet.http.*;  //package for HttpServlet
import java.util.*;
import com.desai.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import java.util.Vector;
import javax.swing.table.TableColumn;


public class LoginServlet extends HttpServlet
{
private String Username, Password, CustomerName;
private PrintWriter output;

//a method called automatically to initialize the servlet
   public void init( ServletConfig config )
      throws ServletException
   {
      super.init( config );
      Username = new String("");
      Password = new String("");

   }

   //a method included in class HttpServlet to respond
   //to post requests from a client.
   public void doGet ( HttpServletRequest req, HttpServletResponse res )
      throws ServletException, IOException
   {	doPost(req, res);

   }

   //a method included in class HttpServlet to respond
   //to post requests from a client.
   public void doPost ( HttpServletRequest req, HttpServletResponse res )
      throws ServletException, IOException
   {
      //obtains a character-based output stream that enables
      //text data to be sent to the client
      output = res.getWriter();

      //specifies the MIME type of the response to the browser
      res.setContentType( "text/html" );
      //returns the value associated with a parameter sent to
      //the servlet as part of a post request
      String RequestURL = req.getServletPath();
      if(RequestURL.equals("/LoginServlet")){
      	Username = req.getParameter( "UserName" );
      	Password = req.getParameter( "PassWord" );
      	Account Acct = new Account(Username, Password);
      	CustomerName = Acct.signIn();
	  	//System.out.println("Customer name: (" + CustomerName + ")");
        if (!CustomerName.equals(""))
           showSuccess();
      	else
           output.println("<br><br><b><center>Login failed because of invalid username or password. Please try again!</center></b>");

	   } else if(RequestURL.equals("/Account")) {
			 String Username = req.getParameter( "UsernameField" );
			 String CustomerName = req.getParameter( "CustomerNameField" );
			 String AccountType = req.getParameter( "CheckingOrSavings" );
			 String AccountNumber = req.getParameter( "AccountNumberField" );
			 String OpeningDeposit = req.getParameter( "OpeningDepositField" );
			/*if(AccountType.equals("Checking")) {
				CheckingAccount check = new CheckingAccount(AccountNumber, CustomerName, Username, Float.parseFloat(OpeningDeposit));
				if(check.openAcct())
				output.println("Username: " + Username + " CustomerName: " +CustomerName + " AccountType: " + AccountType + " AccountNumber: " + AccountNumber + " OpeningDep: " + OpeningDeposit);
			} else {
				SavingsAccount savings = new SavingsAccount(AccountNumber, CustomerName, Username, Float.parseFloat(OpeningDeposit));
				if(savings.openAcct()) output.println("Username: " + Username + " CustomerName: " +CustomerName + " AccountType: " + AccountType + " AccountNumber: " + AccountNumber + " OpeningDep: " + OpeningDeposit);
			}*/


			if(AccountNumber.length() != 8 )
                output.println("<br><br><b><center>Please Enter an Account Number with Exactly 8 Characters!</center.</b>");
                else
			if(AccountType.equals("Checking"))
						{
							CheckingAccount check = new CheckingAccount(AccountNumber, CustomerName, Username, OpeningDeposit);
							if(check.openAcct())
							{
							Date date = new Date();
							String h = String.format("%02d", date.getHours());
				            String m = String.format("%02d", date.getMinutes());
						    String s = String.format("%02d", date.getSeconds());
			                String time = (h + ":" + m + ":" + s);
							Transactions tr=new Transactions(date,Float.parseFloat(OpeningDeposit), "Deposit", time, "", AccountNumber, Username);

							 if(tr.recordTransaction())
							  {
							    //System.out.println("successful!");
							     output.println("<br><br><b><center>Opening a Checking Account is Successful!</center></b>");
							   }
							     else
							       //System.out.println("fail!");
							        output.println("<br><br><b><center>Opening a Checking Account failed.</center></b>");
							  }
			       		 }
							else if(AccountType.equals("Savings"))
							        {

										SavingsAccount savings = new SavingsAccount(AccountNumber, CustomerName, Username, OpeningDeposit);
										if (savings.openAcct())
										{
											Date date = new Date();
											String h = String.format("%02d", date.getHours());
											String m = String.format("%02d", date.getMinutes());
											String s = String.format("%02d", date.getSeconds());
											String time = (h + ":" + m + ":" + s);
											Transactions tr = new Transactions(date,Float.parseFloat(OpeningDeposit), "Deposit", time, "", AccountNumber, Username);
											if(tr.recordTransaction())
											{
												//System.out.println("successful!");
											   output.println("<br><br><b><center>Opening a Savings Account is Successful!</center></b>");
											}
										}
										else
											 //System.out.println("fail!");
											output.println("<br><br><b><center>Opening a Savings Account failed.</center></b>");
				        	 }

	   } else if(RequestURL.equals("/Withdraw")){
		String account = req.getParameter("CheckingOrSavings");
		String amount = req.getParameter("AmountField");
		String userID = req.getParameter("UserID");
		float amountf;
		if(account.equals("x"))
			{
			output.println("<br><br><b><center>Please select an account!</center></b>");
			return;
			}
			try {
					amountf = Float.parseFloat(amount);
				}   catch (NumberFormatException e)
				{
					output.println("<br><br><b><center>Please enter a valid amount to withdraw!</center></b>");
					return;
				}

				String accType = account.substring(0,1);
				if (accType.equals("s")) {
				SavingsAccount sav = new SavingsAccount(account.substring(1), CustomerName, userID, amount);
				Boolean resultdoneSav = sav.Withdraw(sav.getSANum(), Float.parseFloat(amount));

				if (resultdoneSav) {
				output.println("<br><br><b>Successfully Withdraw Amount From Savings Account!</center></b>");
				Date date = new Date();
				String h = String.format("%02d", date.getHours());
				String m = String.format("%02d", date.getMinutes());
				String s = String.format("%02d", date.getSeconds());
				String time = (h + ":" + m + ":" + s);
				Transactions transct = new Transactions(new Date(), Float.parseFloat(amount), "Withdraw", time, account.substring(1), null,userID);
				transct.recordTransaction();
				} else {
                output.println("<br><br><b><center>Unsuccessfully Withdraw Amount From Savings Account!</center></b>");
		           }
		        } else  if(accType.equals("c")) {
				CheckingAccount check = new CheckingAccount(account.substring(1), CustomerName, userID, amount);
		        Boolean resultdonecheck = check.Withdraw(check.getCANum(), Float.parseFloat(amount));
                if (resultdonecheck)
		        output.println("<br><br><b><center>Successfully Withdraw Amount from Checking Account!</center></b>");
		        Date date = new Date();
		        String h = String.format("%02d", date.getHours());
		        String m = String.format("%02d", date.getMinutes());
		        String s = String.format("%02d", date.getSeconds());
		        String time = (h + ":" + m + ":" + s);
		        Transactions transct = new Transactions(new Date(), Float.parseFloat(amount),"Withdraw", time,  account.substring(1), null, userID);
		        transct.recordTransaction();
			     } else {
			      output.println("<br><br><b><center>UnSuccessfully Withdraw Amount from Checking Account!</center></b>");
	         }

	   } else if(RequestURL.equals("/Deposit")){

						String account = req.getParameter("CheckingOrSavings");
						String amount = req.getParameter("AmountField");
						String userID = req.getParameter("UserID");
						float amountf;
						if(account.equals("x")) {
							output.println("<br><br><b><center>Please select an account!</center></b>");
							return;
						}
						try {
							amountf = Float.parseFloat(amount);
						} catch (NumberFormatException e) {
							output.println("<br><br><b><center>Please enter a valid amount to withdraw!</center></b>");
							return;
						}
						String accType = account.substring(0,1);
						 if (accType.equals("s")) {
						SavingsAccount sav = new SavingsAccount(account.substring(1), CustomerName, userID, amount);
						Boolean resultdoneSav = sav.deposit(sav.getSANum(), Float.parseFloat(amount));

						if (resultdoneSav) {
						output.println("<br><br><b><center>Successfully Deposit Amount To Savings Account!</center></b>");
						Date date = new Date();
						String h = String.format("%02d", date.getHours());
						String m = String.format("%02d", date.getMinutes());
						String s = String.format("%02d", date.getSeconds());
						String time = (h + ":" + m + ":" + s);
						Transactions transct = new Transactions(new Date(), Float.parseFloat(amount), "Deposit", time, null, account.substring(1),userID);
						transct.recordTransaction();
						} else {
			                     output.println("<br><br><b><center>Unsuccessfully Deposit Amount To Savings Account!</center></b>");
			                }
			            } else  if(accType.equals("c")) {
							CheckingAccount check = new CheckingAccount(account.substring(1), CustomerName, userID, amount);
			                Boolean resultdonecheck = check.deposit(check.getCANum(), Float.parseFloat(amount));
                        if (resultdonecheck)
			                    output.println("<br><br><b><center>Successfully Deposit Amount To Checking Account!</center></b>");
			                    Date date = new Date();
			                    String h = String.format("%02d", date.getHours());
			                    String m = String.format("%02d", date.getMinutes());
			                    String s = String.format("%02d", date.getSeconds());
			                    String time = (h + ":" + m + ":" + s);
			                    Transactions transct = new Transactions(new Date(), Float.parseFloat(amount),"Deposit", time, null, account.substring(1), userID);
			                    transct.recordTransaction();
			                } else {
			                    output.println("<br><br><b><center>UnSuccessfully Deposit Amount To Checking Account!</center></b>");
			                }
	   } else if(RequestURL.equals("/Transfer")){
		   String toAccount = req.getParameter("ToAccount");
		   String fromAccount = req.getParameter("FromAccount");
		   String amount = req.getParameter("AmountField");
		   String userID = req.getParameter("UserID");
		   if(toAccount.equals("x") || fromAccount.equals("x")) {
		   	output.write("Please select valid accounts.");
		   	return;
		   	}
		   	float amountf;
		   	try {
		   	amountf = Float.parseFloat(amount);
		   	} catch (NumberFormatException e) {
		   	output.println("Please enter a valid amount to transfer.");
		   	return;
		   	}
		   	String toType = toAccount.substring(0,1);
			String fromType = fromAccount.substring(0,1);
			//boolean success = false;
			if(fromType.equals("c") && toType.equals("c")){
			            CheckingAccount check = new CheckingAccount(fromAccount.substring(1), CustomerName, userID, amount);
			            Boolean withdrawstatus = check.Withdraw(check.getCANum(), Float.parseFloat(amount));
			            Boolean depositstatus = false;
			            if(withdrawstatus)
			            {
			                CheckingAccount check2 = new CheckingAccount(toAccount.substring(1), CustomerName, userID, amount);
			                depositstatus = check2.deposit(check2.getCANum(), Float.parseFloat(amount));
			            }
			            if (withdrawstatus && depositstatus) {
			                output.println("<br><br><b><center>Successfully Transfer From Checking To Checking!</center></b>");
			                Date date = new Date();
			                String h = String.format("%02d", date.getHours());
			                String m = String.format("%02d", date.getMinutes());
			                String s = String.format("%02d", date.getSeconds());
			                String time = (h + ":" + m + ":" + s);
			                Transactions transct = new Transactions(new Date(), Float.parseFloat(amount), "Transfer", time, fromAccount.substring(1),toAccount.substring(1), userID);
			               	transct.recordTransaction();
			            } else {
			                output.println("<br><br><b><center>UnSuccessfully Transfer From Checking To Checking!</center></b>");

			            }
			        }
			if(fromType.equals("s") && toType.equals("s")){
			            SavingsAccount sav = new SavingsAccount(fromAccount.substring(1), CustomerName, userID, amount);
			            Boolean withdrawstatus = sav.Withdraw(sav.getSANum(), Float.parseFloat(amount));
			            Boolean depositstatus = false;
			            if(withdrawstatus)
			            {
			                SavingsAccount sav2 = new SavingsAccount(toAccount.substring(1), CustomerName, userID, amount);
			                depositstatus = sav2.deposit(sav2.getSANum(), Float.parseFloat(amount));
			            }
			            if (withdrawstatus && depositstatus) {
			                output.println("<br><br><b><center>Successfully Transfer From Savings To Savings!</center></b>");
			                Date date = new Date();
			                String h = String.format("%02d", date.getHours());
			                String m = String.format("%02d", date.getMinutes());
			                String s = String.format("%02d", date.getSeconds());
			                String time = (h + ":" + m + ":" + s);
			                Transactions transct = new Transactions(new Date(), Float.parseFloat(amount), "Transfer", time, fromAccount.substring(1),toAccount.substring(1), userID);
			               	transct.recordTransaction();
			            } else {
			                output.println("<br><br><b><center>UnSuccessfully Transfer From Savings To Savings!</center></b>");

			            }
			        }
			if(fromType.equals("c") && toType.equals("s")){
			            CheckingAccount check = new CheckingAccount(fromAccount.substring(1), CustomerName, userID, amount);
			            Boolean withdrawstatus = check.Withdraw(check.getCANum(), Float.parseFloat(amount));
			            Boolean depositstatus = false;
			            if(withdrawstatus)
			            {
			                SavingsAccount sav = new SavingsAccount(toAccount.substring(1), CustomerName, userID, amount);
			                depositstatus = sav.deposit(sav.getSANum(), Float.parseFloat(amount));
			            }
			            if (withdrawstatus && depositstatus) {
			                output.println("<br><br><b><center>Successfully Transfer From Checking To Savings!</center></b>");
			                Date date = new Date();
			                String h = String.format("%02d", date.getHours());
			                String m = String.format("%02d", date.getMinutes());
			                String s = String.format("%02d", date.getSeconds());
			                String time = (h + ":" + m + ":" + s);
			                Transactions transct = new Transactions(new Date(), Float.parseFloat(amount), "Transfer", time, fromAccount.substring(1),toAccount.substring(1), userID);
			               	transct.recordTransaction();
			            } else {
			                output.println("<br><br><b><center>UnSuccessfully Transfer From Checking To Savings!</center></b>");

			            }
			        }
			       if(fromType.equals("s") && toType.equals("c")){
			            SavingsAccount sav = new SavingsAccount(fromAccount.substring(1), CustomerName, userID, amount);
			            Boolean withdrawstatus = sav.Withdraw(sav.getSANum(), Float.parseFloat(amount));
			            Boolean depositstatus = false;
			            if(withdrawstatus){
			                CheckingAccount check = new CheckingAccount(toAccount.substring(1), CustomerName, userID, amount);
			                depositstatus = check.deposit(check.getCANum(), Float.parseFloat(amount));
			            }

			            if (withdrawstatus && depositstatus) {
			                output.println("<br><br><b><center>Successfully Transfer From Savings To Checking!</center></b>");
			                CheckingAccount check = new CheckingAccount(toAccount.substring(1), CustomerName, userID, amount);
			                Date date = new Date();
			                String h = String.format("%02d", date.getHours());
			                String m = String.format("%02d", date.getMinutes());
			                String s = String.format("%02d", date.getSeconds());
			                String time = (h + ":" + m + ":" + s);
			                Transactions transct = new Transactions(new Date(), Float.parseFloat(amount), "Transfer", time, fromAccount.substring(1),toAccount.substring(1),userID);
			                transct.recordTransaction();
			            } else {
			                output.println("<br><br><b><center>UnSuccessfully Transfer From Savings To Checking!</center></b>");
						}
				}
		} else if(RequestURL.equals("/Inquire")){
			String str1=req.getParameter("StartDateField");
			String str2=req.getParameter("EndDateField");
			Account user=new Account(req.getParameter("UserID"));
			Vector [] arr = user.Inquire(str1, str2);
			Vector columnNames = arr[0];
			Vector data = arr[1];
			output.println("<html><head></head<body>");
			output.println("<BODY bgcolor='#B0E0E6'>");
			output.println("<h2><font color='Blue'><u><b><center>Inquire Transaction Record</center></font></b></u></h4>");
			output.println("<TABLE align='center' border='1'>");
			output.println("<TR align='center'>");
			for(int i = 0; i < arr[0].size(); i++) {
				output.println("<TD>"+ arr[0].get(i) + "</TD>");
			}
			output.println("</TR>");

			int size2 = arr[1].size();
			for(int i = 0; i < arr[1].size(); i++) {
				Vector currRow = (Vector)arr[1].get(i);
				output.println("<TR align='center'>");
				for(int j = 0; j < currRow.size(); j++){
					output.println("<TD>" + currRow.get(j) + "</TD>");
				}
				output.println("</TR>");
			}

			output.println("<TR align='center'>");
			output.println("</TR>");

			output.println("</TABLE>");
			output.println("</body>");
			output.println("</html>");

		}
		else if(RequestURL.equals("/ChangePassword"))
		{
			String str1=req.getParameter("UserID");
			String Password = req.getParameter("password");
			String NewPassword=req.getParameter("newpassword");
			String ReNewPassword=req.getParameter("renewpassword");
			Account a = new Account(str1, Password,NewPassword,ReNewPassword);
			a.changePassword(ReNewPassword);
			output.println("Success");
			if(Password != "" && NewPassword != "" && ReNewPassword != "")
			{
				a.changePassword(ReNewPassword);
			}
		}
	}


   public void showSuccess()
   {
        StringBuffer Buf = new StringBuffer();
		Buf.append("<HTML><HEAD></HEAD>\n");
		Buf.append("<BODY bgcolor='#FF8C00'>\n");
		Buf.append("<h3 ALIGN='center'><font color='blue'>Welcome To Provident Bank!</font></h4>\n");
		Buf.append("<FORM NAME=\"LoginPage\" ACTION=\"/LoginServlet\" METHOD =\"POST\">\n");
		Buf.append("<A HREF='/CSCI6810/PreOverview.jsp?UserID="+Username+"&Name="+CustomerName+"' TARGET='display'><font color='black' size ='5'><b>Account Overview</b></font></A>&nbsp;&nbsp;&nbsp;");
		Buf.append("<A HREF='/CSCI6810/PreAccount.jsp?UserID="+Username+"&Name="+CustomerName+"' TARGET='display'><font color='black' size ='5'><b>Account</b></font></A>&nbsp;&nbsp;&nbsp;");
		Buf.append("<A HREF='/CSCI6810/PreWithdraw.jsp?UserID="+Username+"&Name="+CustomerName+"' TARGET='display'><font color='black' size ='5'><b>Withdraw</b></font></A>&nbsp;&nbsp;&nbsp;");
		Buf.append("<A HREF='/CSCI6810/PreDeposit.jsp?UserID="+Username+"&Name="+CustomerName+"' TARGET='display'><font color='black' size ='5'><b>Deposit</b></font></A>&nbsp;&nbsp;&nbsp;");
		Buf.append("<A HREF='/CSCI6810/PreTransfer.jsp?UserID="+Username+"&Name="+CustomerName+"' TARGET='display'><font color='black' size ='5'><b>Transfer</b></font></A>&nbsp;&nbsp;&nbsp;");
		Buf.append("<A HREF='/CSCI6810/PreInquire.jsp?UserID="+Username+"&Name="+CustomerName+"' TARGET='display'><font color='black' size ='5'><b>Inquire Transaction</b></font></A>&nbsp;&nbsp;&nbsp;");
		Buf.append("<A HREF='/CSCI6810/PreChangePassword.jsp?UserID="+Username+"&Name="+CustomerName+"' TARGET='display'><font color='black' size ='5'><b>Change Password</b></font></A>&nbsp;&nbsp;&nbsp;");
		Buf.append("<A HREF='/CSCI6810/index.html' TARGET='_top'><b><font color='black' size ='5'>Logout</font></b></A>");
		Buf.append("</FORM>\n");
		Buf.append("</BODY>\n");

		Buf.append("<SCRIPT LANGUAGE=\"JavaScript\">\n");
		   Buf.append("function checkInputs()\n");
		   Buf.append("{\n");
			   Buf.append("var Prompts = \"\";\n");
			   Buf.append("Username = window.document.LoginPage.UserName.value;\n");
			   Buf.append("Password = window.document.LoginPage.PassWord.value;\n");
			   Buf.append("if (Username == \"\" || Password == \"\") {\n");
				  Buf.append("if (Username == \"\")\n");
					 Buf.append("Prompts +=\"Please enter your username!\\n\";\n");
				  Buf.append("if (Password == \"\")\n");
					 Buf.append("Prompts +=\"Please enter your password!\\n\";\n");
				  Buf.append("if (Prompts != \"\")\n");
					 Buf.append("window.alert(Prompts);\n");
			   Buf.append("} else {\n");
				  Buf.append("document.LoginPage.submit();\n");
			   Buf.append("}\n");
		   Buf.append("}\n");

		Buf.append("</SCRIPT>\n");
		Buf.append("</HTML>\n");
		output.println(Buf.toString());
   }

   //this "cleanup" method is called when a servlet is terminated by the server
   public void destroy() {
       output.close();
   }

	public static String[] getAccountList(String UserID){
		String[] accs = getCheckingAccountNumbers(UserID);
		return accs;
	}

	public static String[] getCheckingAccountNumbers(String UName){
		String[] checkingAccountNumbers = new String[3];

		try{
			DBConnection ToDB = new DBConnection(); //Have a connection to the DB
			Connection DBConn = ToDB.openConn();
			Statement Stmt = DBConn.createStatement();
			String SQL_command;
			SQL_command = "SELECT CheckingAccountNumber FROM CheckingAccount WHERE CustomerID = '"+ UName +"' ";

			ResultSet Rst = Stmt.executeQuery(SQL_command);

			int count = 0;
			while (Rst.next()){
				if(count < 3){
					String result = Rst.getString(1);
					//System.out.println(result);
					checkingAccountNumbers[count] = result;
				}
				count ++;
			}

			Stmt.close();
			DBConn.close();
		}
		catch(java.sql.SQLException e){
			System.out.println("SQLException: " + e);
			while (e != null)
			{   System.out.println("SQLState: " + e.getSQLState());
				System.out.println("Message: " + e.getMessage());
				System.out.println("Vendor: " + e.getErrorCode());
				e = e.getNextException();
				System.out.println("");
			}
		}
		catch (java.lang.Exception e)
		{
			System.out.println("Exception: " + e);
			e.printStackTrace ();
		}

		return checkingAccountNumbers;
	}

	public static String[] getSavingAccountNumbers(String UName){

		String[] savingAccountNumbers = new String[3];

		try{
			DBConnection ToDB = new DBConnection(); //Have a connection to the DB
			Connection DBConn = ToDB.openConn();
			Statement Stmt = DBConn.createStatement();
			String SQL_command;
			SQL_command = "SELECT SavingsAccountNumber FROM SavingsAccount WHERE CustomerID = '"+UName +"' ";
			ResultSet Rst = Stmt.executeQuery(SQL_command);
			int count = 0;
			while (Rst.next()){
				if(count < 3){
					String result = Rst.getString(1);
					System.out.println(result);
					savingAccountNumbers[count] = result;
				}
				count ++;
			}
			Stmt.close();
			DBConn.close();
		}
		catch(java.sql.SQLException e){
			System.out.println("SQLException: " + e);
			while (e != null)
			{   System.out.println("SQLState: " + e.getSQLState());
				System.out.println("Message: " + e.getMessage());
				System.out.println("Vendor: " + e.getErrorCode());
				e = e.getNextException();
				System.out.println("");
			}
		}
		catch (java.lang.Exception e)
		{
			System.out.println("Exception: " + e);
			e.printStackTrace ();
		}

		return savingAccountNumbers;
	}
}