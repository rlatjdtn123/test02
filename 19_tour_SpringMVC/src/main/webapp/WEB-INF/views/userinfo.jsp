
<%@page import="com.hk.tour.dtos.UDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		background-color: gray;
	}
</style>
</head>
<%
	UDto dto=(UDto)request.getAttribute("dto");
%>
<body>
<table border="1">
	<tr>
		<th>아이디</th>
		<td><%=dto.getId()%></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=dto.getName()%></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%=dto.getAddress()%></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%=dto.getPhone()%></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=dto.getEmail()%></td>
	</tr>
	<tr>
		<th>가입일</th>
		<td><%=dto.getRegdate()%></td>
	</tr>
	<tr>
		<td>
			<input type="button" value="정보수정" onclick="location.href='Ucontroller.do?command=updateForm&id=<%=dto.getId()%>'">
			<input type="button" value="메인페이지" onclick="location.href='mainpage.jsp'">
			<input type="button" value="탈퇴" onclick="location.href='Ucontroller.do?command=delUser&id=<%=dto.getId()%>'">
			<input type="button" value="로그아웃" onclick="location.href='Ucontroller.do?command=logOut'">
		</td>
	</tr>
</table>
</body>
</html>