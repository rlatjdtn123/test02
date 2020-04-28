
<%@page import="com.hk.tour.dtos.LDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{background-image: url("img/back.jpg");
		background-repeat : no-repeat;
		background-size : cover; 
   		 
	}
	table{
		background-color: gray;
	}
</style>
</head>
<%
	List<LDto> list=(List<LDto>)request.getAttribute("list");
%>
<body>
<table border="1">
			<%
				for(LDto dto:list){
				%>
				<tr>
					<th>
						<a href="Lcontroller.do?command=detailInfo&tseq=<%=dto.getTseq()%>"><%=dto.getInfoname()%></a>
					</th>
					<td>
						<%=dto.getCitycounties()%>
					</td>
					<td>
						<%=dto.getPnumber()%>
					</td>
					<td>
						<%=dto.getGrade()%>
					</td>
				</tr>
				<%
			}
			%>
</table>
</body>
</html>