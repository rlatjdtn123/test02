<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    

</head>
<body>

 
 <form action="Lcontroller.do" method="post">
	<input type="hidden" name="command" value="locationDetail">
	<div class="container">        
	<div class="form-group">
	 <div class="col-sm-2">
	<select title="지역 선택" name="location" onchange="selOptions(this.value)" class="form-control" id="gender1">
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
	<select title="지역 선택" name="citycounties" class="form-control" id="gender2">
		<option id="a">--선택--</option>
	</select>
	<input type="submit" value="선택">
		        </div>
	</div>          

</div>
	
</form>
</body>
</html>