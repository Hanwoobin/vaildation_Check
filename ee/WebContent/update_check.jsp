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

String sql = "update e2_user set password = ?, name = ?, email = ? where id = ?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, password);
pstmt.setString(2, name);
pstmt.setString(3, email);
pstmt.setString(4, id);

pstmt.executeUpdate();
String msg = "./all_member.jsp";

response.sendRedirect(msg);
%>