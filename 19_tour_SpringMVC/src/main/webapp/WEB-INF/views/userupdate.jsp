
<%@page import="com.hk.tour.dtos.UDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head> 
<%
	UDto dto=(UDto)request.getAttribute("dto");
%>
<body>
<form action="Ucontroller.do" method="post">
	<input type="hidden" name="command" value="userUpdate">
	<input type="hidden" name="id" value="<%=dto.getId()%>">
	<table>
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
			<td><input type="text" name="address" value="<%=dto.getAddress()%>"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" value="<%=dto.getPhone()%>"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="<%=dto.getEmail()%>"></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate()%></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정완료">
				<input type="button" value="메인페이지" onclick="location.href='mainpage.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>