<%@page contentType="text/html; charset=UTF-8"%>
<%@page import ="java.sql.*"%>
<%@include file = "conn_db.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String msg = "./createAccount.jsp?error=1";
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	
	String sql = "insert into e2_user values(?,?,?,?,?,?)";
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setString(5, gender);
		pstmt.setString(6, "1");
		pstmt.executeQuery();
		msg = "./result.jsp?id="+id;
	}catch (Exception e ){
		 msg = "./createAccount.jsp?error=1";
	}
	
	
	response.sendRedirect(msg);	

%>