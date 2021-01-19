<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<script type ="text/javascript">
	function deleteConfirm(id) {
		if (confirm("ID를 삭제합니다!!")== true)
			location.href = "./deleteUser_process.jsp?id=" +id;
		else
			return;
	}
</script>
</head>
<body>
	<button onclick="deleteConfirm(<%=session.getAttribute("id")%>)">삭제하기</button>
</body>
</html>