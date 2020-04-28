<%@page import="com.hk.tour.dtos.RDto"%>
<%@page import="com.hk.tour.dtos.LDto"%>
<%@page import="com.hk.tour.dtos.UDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/star.js"></script>
<script type="text/javascript">
	onload=function(){
		starRating();
		
	}
	
	$(function(){
		$("#bt").click(function(){
			var tseq=$("input[name=tseq]").val();
			$("#view").toggle();
			$.ajax({
				url: "Lcontroller.do",    //요청 URL
				data:{"command":"contentAjax","tseq":tseq},//서버쪽으로 보낼 데이터
				dataType:"json",			 	        //서버에서 받게될 데이터 타입 정의                                            // text 문자열하나보낼경우
				method:"post",                          //전송방식 정의
				success:function(obj){                 // 서버통신에 성공했다면 기능실행(obj는 전달된 데이터 받기)  //content
// 					$("#view").text(obj.list.length);
					var results=obj.list;
					var str= '<tr>';
// 					alert(results.length);
					var count=0;
					
					//append하기전에 내용지우기
					if(results.length<(results.length+1)){	
						$("#view").empty();
					}
					
					
					$("#view").append(str);
					$.each(results, function(i){ 
						str +='<td>ID : ' + results[i].id+ '</td> ';        //results===>   [dto,dto,{"id":"hk","title":"aaaa"..}]
						str +='<td> / 내용 : ' + results[i].content+ '</td>'; 
						str +='<td> / 평점 : ' + results[i].usergrade+ '</td>'; 
						str +='</tr>';	
							
						
				
					});
					
					$("#view").append(str);
					
					
				}
				
				
				
			});
	
		});
	})
	
	//window.open("url","title","브라우저의 속성설정")
	function login(){
		window.open("window_login.jsp",
			 "", 
			 "width=500px, height=300px");
	}
	
	
	
	
	
	
	
</script>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
body{background-image: url("img/back.jpg");
		background-repeat : no-repeat;
		background-size : cover; 
   		 
	}
</style>
</head>
<%
	LDto dto=(LDto)request.getAttribute("dto");
	UDto ldto=(UDto)session.getAttribute("ldto");
	List<RDto> list=(List<RDto>)request.getAttribute("list");
	
	
%>
<body>

<h1><%=dto.getInfoname()%></h1>
<h3>상세정보</h3>
<ul>
	<li>문의 및 안내 : <%=dto.getPnumber()%></li> 
	<li>주소 : <%=dto.getAddress()%></li>
	<%
		if(dto==null){
			%>
				<li>평점없음</li>
			<%
		}else{
			%>
				<li>평점: <%=dto.getGradeavg()%></li>
			<%
		}
	%>
	 
</ul>
			<button id="bt"><b>===============후기 목록보기===============</b></button>
<div><table id="view" style="display: none;"></table></div>
<form action="Lcontroller.do" method="post" >
	<input type="hidden" name="command" value="write">
	<input type="hidden" name="tseq" value="<%=dto.getTseq()%>">
	<input type="hidden" name="dto" value="<%=dto%>">
	<table>
		<tr>
			<td> 
				<textarea rows="3" cols="60" name="content"></textarea>
			</td>
		</tr>
		<%
			if(ldto!=null){
		%>
		<tr>
			<td>
				<span class="star-input">
					<span class="input">
				    	<input type="radio" name="star-input" value="1" id="p1">
				    	<label for="p1">1</label>
				    	<input type="radio" name="star-input" value="2" id="p2">
				    	<label for="p2">2</label>
				    	<input type="radio" name="star-input" value="3" id="p3">
				    	<label for="p3">3</label>
				    	<input type="radio" name="star-input" value="4" id="p4">
				    	<label for="p4">4</label>
				    	<input type="radio" name="star-input" value="5" id="p5">
				    	<label for="p5">5</label>
				  	</span>
				  	<output for="star-input"><b>0</b>점</output>						
				</span>
			</td>
		</tr>
		<%
			}
		%>
		<tr>
			<td> 
				<%
					if(ldto==null){
					%>
						<input type="button" onclick="login()" style="width: 440px;" value="로그인"/>
					<%	
				}else{
					%>
						<input type="submit" value="글등록" style="width: 440px;">
					<%	
				}
					%> 
			</td>
		</tr>
	</table>
</form>
<!-- <span class="star-input"> -->
<!--   <span class="input"> -->
<!--     <input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label> -->
<!--     <input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label> -->
<!--     <input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label> -->
<!--     <input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label> -->
<!--     <input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label> -->
<!--     <input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label> -->
<!--     <input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label> -->
<!--     <input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label> -->
<!--     <input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label> -->
<!--     <input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label> -->
<!--   </span> -->
<!--   <output for="star-input"><b>0</b>점</output> -->
<!-- </span> -->
</body>
</html>