package firstpackage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateAccount
 */
@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String name=request.getParameter("name");
		String contact=request.getParameter("contact");
		long mobile=Long.parseLong(contact);
		String email=request.getParameter("email");
		String pass=request.getParameter("psw");
		String pass1=request.getParameter("cpsw");
		
		PrintWriter pw=response.getWriter();
		
		if(pass.equals(pass1))
		{
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Farm_App","root","root");
				PreparedStatement ps=con.prepareStatement("insert into  Customer_details values (?,?,?,?)");
				ps.setString(1, name);
				ps.setLong(2, mobile);
				ps.setString(3, email);
				ps.setString(4, pass);
				ps.execute();
				response.setContentType("text/html");
				pw.println("Account Created");
				RequestDispatcher rd=request.getRequestDispatcher("LoginPage.html");
				rd.include(request, response);	
			} 
			catch (ClassNotFoundException e) 
			{
				pw.println("Something went wrong please try after sometime class not fount");
			}
			catch(SQLIntegrityConstraintViolationException e )
			{
				response.setContentType("text/html");
				pw.println("Email or contact number allready present in our database");
				RequestDispatcher rd=request.getRequestDispatcher("CreateAccount.html");
				rd.include(request, response);
			}
			catch (SQLException e) 
			{
				pw.println("Something went wrong please try after sometime sql exception");
			}
		}
		else
		{
			response.setContentType("text/html");
			pw.println("password and confirm password not matched");
			RequestDispatcher rd=request.getRequestDispatcher("CreateAccount.html");
			rd.include(request, response);
		}
	}

}