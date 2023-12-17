<%@page import="java.sql.*"%>
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

int id = Integer.parseInt(request.getParameter("id"));
String name = request.getParameter("name");
int salary = Integer.parseInt(request.getParameter("salary"));
String department = request.getParameter("department");

response.setContentType("text/html");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management","root","root123");
PreparedStatement pd = con.prepareStatement("INSERT INTO employee VALUES(?,?,?,?)");
pd.setInt(1, id);
pd.setString(2, name);
pd.setInt(3, salary);
pd.setString(4, department);
pd.executeUpdate();
response.sendRedirect("index.jsp");
%>
</body>
</html>