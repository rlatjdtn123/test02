<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function winlog(){
		opener.parent.location.reload();
		
		window.opener=self;
		self.close();
		 
	}
</script>
<body>
<form action="Ucontroller.do" method="post">
	<input type="hidden" name="command" value="loginForm"> 
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" required="required"/></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password" required="required"/></td>
		</tr>
		<tr> 
			<td>
				<input type="submit" value="로그인" onclick="winlog()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>