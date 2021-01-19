<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="conn_db.jsp"%>
<%
	PreparedStatement pstmt = null;
ResultSet rs = null;
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String GT = request.getParameter("GT");


String sql = "update e2_user set password = ?, name = ?, email = ?, gender = ? where id = ?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, password);
pstmt.setString(2, name);
pstmt.setString(3, email);
pstmt.setString(4, gender);
pstmt.setString(5, id);

pstmt.executeUpdate();
String msg = "./main.jsp";

response.sendRedirect(msg);
%>