<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Farm_App","root","root");
PreparedStatement ps=con.prepareStatement("select * from Customer_details where contact=?");
Cookie []cookies=request.getCookies();
String contact=cookies[0].getValue();
long mobile=Long.parseLong(contact);
PrintWriter pw=response.getWriter();
ps.setLong(1, mobile);
ResultSet rs=ps.executeQuery();
rs.next(); 
if(rs.getLong(2)==mobile)
{
%>

<%
}
%>
<%
}
catch (ClassNotFoundException e) 
{
%>
	<h2>Something went wrong please try after sometime sell class not fount</h2>
<%
}
catch(Exception e)
{
%>
	<h2>Something went wrong please try after sometime sell exception</h2>
<% 
}
%>
</body>
</html>