<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Farm_App","root","root");
PreparedStatement ps=con.prepareStatement("select date,category,subcategory,sell_qty_in_kg,price,address,deliver,take,contact from sell_data");
ResultSet rs=ps.executeQuery();
%>
	<table style="border: 2px solid black;">
		<tbody>
			<tr style="border: 2px solid black;">
				<th style="border: 2px solid black;">date</th>
				<th style="border: 2px solid black;">category</th>
				<th style="border: 2px solid black;">sub category</th>
				<th style="border: 2px solid black;">sell_qty_in_kg</th>
				<th style="border: 2px solid black;">price</th>
				<th style="border: 2px solid black;">address</th>
				<th style="border: 2px solid black;"> available deliver</th>
				<th style="border: 2px solid black;"> available to take away</th>
				<th style="border: 2px solid black;"> contact number</th>
				<!--<th style="border: 2px solid black;">view</th> -->
			</tr><% 
			while(rs.next())
			{
			%>
			<tr style="border: 2px solid black;">
			<form action="product.jsp">
				<td style="border: 2px solid black;"><%=rs.getString(1) %></td>
				<td style="border: 2px solid black;"><%=rs.getString(2) %></td>
				<td style="border: 2px solid black;"><%=rs.getString(3) %></td>
				<td style="border: 2px solid black;"><%=rs.getInt(4) %></td>
				<td style="border: 2px solid black;"><%=rs.getInt(5) %></td>
				<td style="border: 2px solid black;"><%=rs.getString(6) %></td>
				<td style="border: 2px solid black;"><%=rs.getString(7) %></td>
				<td style="border: 2px solid black;"><%=rs.getString(8) %></td>
				<td style="border: 2px solid black;"><%=rs.getInt(9) %></td>
				<!-- <td style="border: 2px solid black;"><button type="submit">submit</td> -->
			</form>
			</tr>
			<% 
			} 
			%>
		</tbody>
	</table>
</body>
</html>