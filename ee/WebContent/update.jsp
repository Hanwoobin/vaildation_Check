<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="conn_db.jsp"%>
<html>
<head>
<title>수정</title>
</head>
<body>
	<%
		PreparedStatement pstmt = null;
	ResultSet rs = null;
	String id = request.getParameter("id");

	String sql = "select * from e2_user where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();

	if (rs.next()) {
	%>
	<form action="./update_check.jsp" method="POST">
		ID : <input type = "text" id = "productId" name = "id" value = '<%=rs.getString("id") %>' readonly>
		<p>
			password : <input type="password" name = "password"
				value="<%=rs.getString("password")%>">
		</p>
		<p>
			이름 : <input type="text" name = "name" value="<%=rs.getString("name")%>">
		</p>
		<p>
			이메일 : <input type="text" name = "email" value="<%=rs.getString("email")%>">
		</p>
		<p>
			성별 : <input type="text" name = "gender" value="<%=rs.getString("gender")%>">
		</p>
		<%
			}
		%>
		<button type="submit">수정</button>
	</form>
	
</body>
</html>