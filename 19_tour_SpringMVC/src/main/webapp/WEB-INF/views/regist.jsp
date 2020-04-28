<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{width: 500px; height: 700px;
	margin-left: auto; margin-right: auto;
	} 
</style>
<script type="text/javascript">
	window.onload=function(){
		var pwInputs=document.querySelectorAll("input[type=password]");
		pwInputs[1].onblur=function(){
			if(pwInputs[0].value!=pwInputs[1].value){
				alert("패스워드를 확인하세요");
				pwInputs[0].value="";
				pwInputs[1].value="";
				pwInputs[0].focus(); 
				
			}
		}
	
		var inputs=document.querySelectorAll("input[name]");
		for (var i = 2; i < inputs.length; i++) {
			inputs[i].onfocus=function(){
				if(inputs[1].className=='n'){
					alert("아이디중복체크먼저하세요");
					inputs[1].focus();
				}
			}
		}
		
		
		var form=document.getElementsByTagName("form")[0];
		form.onsubmit=function(){ 
			var pwInputs=document.querySelectorAll("input[type=password]")
			if(pwInputs[0].value!=pwInputs[1].value){
				alert("패스워드를 확인하세요");
				pwInputs[0].value="";
				pwInputs[1].value="";
				pwInputs[0].focus(); 
				
				return false;
			}
		}
	
	}
	
	
	
	//window.open("url","title","브라우저의 속성설정")
	function idCheck(){
		var id=document.getElementsByName("id")[0].value;
		open("idCheck.do?id="+id,
				"",
				"width=300px,height=300px");
	}
	
</script>
</head>
<body>
<form action="insertUser.do" method="post">
	<table border="1" >
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" required="required" class="n">
				<input type="button" value="중복체크" onclick="idCheck()">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" required="required"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password" required="required"></td>
		</tr>
		<tr>
			<th>패스워드확인</th>
			<td><input type="password" name="password2" required="required"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" required="required"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="phone" required="required"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email" required="required"></td>
		</tr>
		<tr>
			<td colspan="2">
				<% %>
				<input type="submit" value="가입완료">
				<input type="button" value="메인페이지" onclick="location.href='index.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>