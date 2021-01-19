<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="conn_db.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
</head>
<body>
	<div class="text-center">
		<div class="container">
			<%
				PreparedStatement pstmt = null;
			ResultSet rs = null;

			String id = session.getAttribute("id").toString();

			String sql = "select * from e2_user where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			String GT = null;
			if (rs.next()) {

				if (rs.getString("GT").equals("2")) {
					GT = "관리자";
				} else if (rs.getString("GT").equals("3")) {
					GT = "휴면 회원";
				} else {
					GT = "일반 회원";
				}
			%>
			<p>
				ID :
				<%=rs.getString("id")%></p>
			<p>password : 공개 되지 않습니다.</p>
			<p>
				name :
				<%=rs.getString("name")%></p>
			<p>
				email :
				<%=rs.getString("email")%></p>
			<p>
				성별 :
				<%=rs.getString("gender")%></p>
			<p>
				회원등급 :
				<%=GT%></p>
			<%
				}
			%>
		</div>
		<button onclick="location.href='./main.jsp'">홈으로</button>
	</div>
</body>
</html>