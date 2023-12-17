<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

try{
	response.setContentType("text/html");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management","root","root123");
	PreparedStatement pd = con.prepareStatement("SELECT * FROM employee");
	ResultSet rs = pd.executeQuery();
	out.write("<table>");
	while(rs.next()){
		out.write("<tr><td>" + rs.getInt(1) + "</td><td>" + 
	rs.getString(2) + "</td><td>"+ rs.getInt(3)+
	"</td><td>" + rs.getString(4) + "</td><td>" + 
				"<form action=\"delete.jsp\"><input type='hidden' name='id' value='" + rs.getInt(1) + "'/><input type='submit' value='delete'/></form>"
				+ "</td></tr>");
	}
	out.write("</table>");
	out.write("<form action='insert.jsp'><input type='number' name='id' /><br><input type='text' name='name' /><br><input type='number' name='salary' /><br><input type='text' name='department' /><br><input type='submit' value='insert'/></form>");
	
}catch(Exception e){
	out.write(e.getMessage());
}

%>
</body>
</html>