<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file = "conn_db.jsp"%>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	
	String sql = "delete from e2_user where id = ?";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	pstmt.executeQuery();
	session.invalidate();
	response.sendRedirect("./main.jsp");

%>