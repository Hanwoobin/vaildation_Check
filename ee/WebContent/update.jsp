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

		String GT = null;	
	
	String sql = "select * from e2_user where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		
		if(rs.getString("GT").equals("2")){
			GT = "관리자";
		}else if(rs.getString("GT").equals("3")) {
			GT ="휴면 회원";
		}else {
			GT = "일반 회원";
		}
		
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
			
			성별 : <input type="radio" name = "gender" value="남자" <%if(rs.getString("gender").equals("남자")){%>checked<%}%>>남자
				 <input type="radio" name = "gender" value="여자" <%if(rs.getString("gender").equals("여자")){ %>checked<%}%>>여자
		</p>
		<p>
			권한 : <select name = "GT" >
				<option value = <%=rs.getInt("GT") %> ><%=GT %></option>
				<option value = "1">일반 회원</option>
				<option value = "2">관리자</option>
				<option value = "3">휴먼 회원</option>
				
			</select>
		</p>
		<%
			}
		%>
		<button type="submit">수정</button>
	</form>
	
</body>
</html>