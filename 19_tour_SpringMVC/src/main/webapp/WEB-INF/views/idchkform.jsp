<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	onload=function(){
		var id=opener.document.getElementsByName("id")[0].value;
		document.getElementById("id").textContent=id;
	}



	function confirmId(resultId){
		var isS=resultId=='null'?true:false;
		var pid=opener.document.getElementsByName("id")[0];
		if(isS){
			opener.document.getElementsByName("name")[0].focus();
			pid.setAttribute("class", "y");
		}else{
			pid.setAttribute("class", "n");
			pid.value="";
			pid.focus();
		}
		
		
		window.self.close();
		
	}
</script>
</head>
<%
	String resultId=(String)request.getAttribute("resultId");
%>
<body>
<table>
	<tr>
		<td id="id"></td>
	</tr>
	<tr>
		<td>
			<%=resultId==null?"사용가능한 아이디입니다":"중복된 아이디입니다"%>
		</td>
	</tr>
	<tr>
		<td>
			<button onclick="confirmId('<%=resultId%>')">확인</button>
		</td>
	</tr>
</table>
</body>
</html>