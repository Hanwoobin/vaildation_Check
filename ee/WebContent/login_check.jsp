<%@page contentType="text/html; charset=UTF-8"%>
<%@include file = "conn_db.jsp"%>
<%@page import="java.sql.*"%>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String msg = "./login.jsp?error=1";
	String ID = request.getParameter("ID");
	String password = request.getParameter("password");
	
	String sql = "select * from e2_user where id =? and password =?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ID);
	pstmt.setString(2, password);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		String name = rs.getString("name");
		session.setAttribute("name", name);
		session.setAttribute("id", ID);
		msg = "./main.jsp";
	}
	response.sendRedirect(msg);
%>