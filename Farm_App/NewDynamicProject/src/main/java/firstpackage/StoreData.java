package firstpackage;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StoreData
 */
@WebServlet("/StoreData")
public class StoreData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreData() {
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
		doGet(request, response);
		String category=request.getParameter("slct1");
		System.out.println("category: "+category);
		String type=request.getParameter("slct2");
		System.out.println("type: "+type);
		String img1=request.getParameter("img1");
		System.out.println("img1: "+img1);
		int img1_size=(img1.length());
		System.out.println("img1_size: "+img1_size);
		String img2=request.getParameter("img2");
		System.out.println("img2: "+img2);
		int img2_size=(img2.length());
		System.out.println("img2_size: "+img2_size);
		String img3=request.getParameter("img3");
		System.out.println("img3: "+img3);
		int img3_size=(img3.length());
		System.out.println("img3_size: "+img3_size);
		String img4=request.getParameter("img4");
		System.out.println("img4: "+img4);
		int img4_size=(img4.length());
		System.out.println("img4_size: "+img4_size);
		String add=request.getParameter("add");
		System.out.println("Add: " +add);
		String deliver=request.getParameter("deliver");
		if(deliver!=null)
		{
			deliver="Yes";
		}
		else
		{
			deliver="No";
		}
		System.out.println("deliver: "+deliver);
		String take=request.getParameter("take");
		if(take!=null)
		{
			take="Yes";
		}
		else
		{
			take="No";
		}
		System.out.println("take: "+take);
		String price=request.getParameter("price");
		System.out.println("price: "+price);
		int price1=Integer.parseInt(price);
		System.out.println("price1: "+price1);
		String qty=request.getParameter("qty");
		int qty1=Integer.parseInt(qty);
		System.out.println("qtyINT: "+qty1);
		Cookie []cookies=request.getCookies();
		String contact=cookies[0].getValue();
		String pass=cookies[1].getValue();
		long mobile=Long.parseLong(contact);
		Date date = new Date();
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy");
	    String str = formatter.format(date);
	    System.out.print("Current date: "+str);
	    System.out.println();
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Farm_App","root","root");
			PreparedStatement ps=con.prepareStatement("insert into sell_data(contact,date,category,subcategory,sell_qty_in_kg,price,img1,img1_filesize,img2,img2_filesize,img3,img3_filesize,img4,img4_filesize,address,deliver,take)"+" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setLong(1, mobile);
			ps.setString(2, str);
			ps.setString(3, category);
			ps.setString(4, type);
			ps.setInt(5, qty1);
			ps.setInt(6, price1);
			ps.setString(7, img1);
			ps.setInt(8, img1_size);
			ps.setString(9, img2);
			ps.setInt(10, img2_size);
			ps.setString(11, img3);
			ps.setInt(12, img3_size);
			ps.setString(13, img4);
			ps.setInt(14, img4_size);
			ps.setString(15, add);
			ps.setString(16, deliver);
			ps.setString(17, take);
			ps.execute();
			
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}

}
