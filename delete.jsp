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

out.write(request.getParameter("id"));
int id = Integer.parseInt(request.getParameter("id"));

try{
	response.setContentType("text/html");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management","root","root123");
	PreparedStatement pd = con.prepareStatement("DELETE FROM employee WHERE id=?");
	pd.setInt(1, id);
	pd.executeUpdate();
	response.sendRedirect("index.jsp");
	
}catch(Exception e){
	out.write(e.getMessage());
}

%>
</body>
</html>