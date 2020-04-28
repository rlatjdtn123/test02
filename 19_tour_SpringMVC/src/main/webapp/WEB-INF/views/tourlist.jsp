
<%@page import="com.hk.tour.dtos.LDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	body{background-image: url("img/back.jpg");
		background-repeat : no-repeat;
		background-size : cover; 
   		 
	}
	
	select{
		 width: 400px;
	}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function selOptions(location){
		$("select[name=citycounties]").empty();
		var citycounties=$("#a").val();
		$.ajax({
			url:"cityDetail.do",
			method:"post",
			data:{"location":location,"citycounties":citycounties},
			dataType:"json",
			success:function(obj){				
				var lists=obj.list; //[dto,dto,dto..]
				var str;
				$.each(lists, function(i){ 
					str +='<option>' + lists[i].citycounties+ '</option> ';    		
			
				}); 
				
				$("select[name=citycounties]").append(str);
				 
			}
		}); 
	}
	
</script>
</head>
<%
	List<LDto> list=(List<LDto>)request.getAttribute("list");
%>
<body>
<form action="locationDetail.do" method="post" style="margin: 300px;">
	<br/>
	<br/>
	<br/>
	<select title="지역 선택" name="location" onchange="selOptions(this.value)" class="form-control" id="gender1" style="width: 800px;">
		<option>지역 선택</option>
		<option value="서울">서울</option>
		<option value="인천">인천</option>
		<option value="세종">세종</option>
		<option value="경기도">경기도</option>
		<option value="대전">대전</option>
		<option value="전라북도">전라북도</option>
		<option value="제주도">제주도</option>
		<option value="대구">대구</option>
		<option value="충청북도">충청북도</option>
		<option value="경상남도">경상남도</option>
		<option value="전라남도">전라남도</option>
		<option value="광주">광주</option>
		<option value="강원도">강원도</option>
		<option value="경상북도">경상북도</option>
		<option value="울산">울산</option>
		<option value="고흥군">고흥군</option>
		<option value="충청남도">충청남도</option>
		<option value="location">전체보기</option>
	</select>
	<br/>
	<select title="지역 선택" name="citycounties" class="form-control" id="gender2" style="width: 800px;">
		<option id="a">--선택--</option>
	</select>
	<br/>
	<input type="submit" value="선택">
</form>
</body>
</html>