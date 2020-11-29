import java.io.*;
import javax.servlet.*;  //package for GenericServlet
import javax.servlet.http.*;  //package for HttpServlet
import java.util.*;
import com.desai.*;

public class AccountServlet extends HttpServlet
{
private String Username, CustomerName, AccountType, AccountNumber, OpeningDeposit;
private PrintWriter output;

//a method called automatically to initialize the servlet
   public void init( ServletConfig config )
      throws ServletException
   {
      super.init( config );
      Username = new String("");

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
      Username = req.getParameter( "UsernameField" );
      CustomerName = req.getParameter( "CustomerNameField" );
      AccountType = req.getParameter( "CheckingOrSavings" );
      AccountNumber = req.getParameter( "AccountNumberField" );
      OpeningDeposit = req.getParameter( "OpeningDepositField" );
		if(AccountType.equals("Checking")) {
			CheckingAccount check = new CheckingAccount(AccountNumber, CustomerName, Username, OpeningDeposit);
			if(check.openAcct())
			output.println("Username: " + Username + " CustomerName: " +CustomerName + " AccountType: " + AccountType + " AccountNumber: " + AccountNumber + " OpeningDep: " + OpeningDeposit);
		} else {
			SavingsAccount savings = new SavingsAccount(AccountNumber, CustomerName, Username, OpeningDeposit);
			if(savings.openAcct()) output.println("Username: " + Username + " CustomerName: " +CustomerName + " AccountType: " + AccountType + " AccountNumber: " + AccountNumber + " OpeningDep: " + OpeningDeposit);
		}
	}

   //this "cleanup" method is called when a servlet is terminated by the server
   public void destroy() {
       output.close();
   }
}
