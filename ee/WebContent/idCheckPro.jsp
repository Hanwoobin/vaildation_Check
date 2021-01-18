<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file = "conn_db.jsp"%>
<html>
<head>
<title>중복체크확인란</title>
</head>
<body>
	<div class = "text-center">
		<h3>중복체크 확인 결과</h3>
		
		<%
			String ID = request.getParameter("id");
			int cnt = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from e2_user where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt++;
			}
			out.println("입력 ID : "+ID);
			if (cnt == 0) {
				out.println("사용 가능한 ID입니다.");
				out.println("<a href ='javascript:apply(\""+ID+"\")'>적용</a>");
			
		%>
		<script>
		function apply(id) {
			opener.document.createForm.id.value=id;
			window.close();
		}
		</script>
		<%}
		else {
			out.println("<p style ='color:red;'>해당 ID는 사용할 수 없습니다.");
		}
		%>
		<a href="javascript:history.back()">다시 시도</a>
		<a href = "javascript:window.close()">닫기</a>
	</div>
</body>
</html>