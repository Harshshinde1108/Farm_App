<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome</h1>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Farm_App","root","root");
PreparedStatement ps=con.prepareStatement("select * from Customer_details where contact=?");
Cookie []cookies=request.getCookies();
String contact=cookies[0].getValue	();
long mobile=Long.parseLong(contact);
PrintWriter pw=response.getWriter();
ps.setLong(1, mobile);
ResultSet rs=ps.executeQuery();
rs.next(); 
if(rs.getLong(2)==mobile)
{ %>
<form action="Sell.jsp">
<button type="submit">Sell</button>
</form>
<form action="Buy">
<button type="submit">Buy</button>
</form>

<%
}
else
{%> 
<h2>error occur</h2>
<%}

%>
</body>
</html>