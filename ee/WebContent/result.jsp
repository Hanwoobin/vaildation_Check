<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="conn_db.jsp"%>
<html>
<head>
<title>회원정보</title>

</head>

<body>
	<%
		String id = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from e2_user where id = ?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();

	if (rs.next()) {
	%>
	<p>ID : <%=rs.getString("id") %></p>
	<p>password : 공개 되지 않습니다.</p>
	<p>name : <%=rs.getString("name") %></p>
	<p>email : <%=rs.getString("email") %></p>
	<p>성별 : <%=rs.getString("gender") %></p>
	
	<%
		}
	%>
	
	<button type = "button" onclick="location.href='./main.jsp'">메인페이지</button>
</body>

</html>