<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메모 입력</title>
<!-- bootstrap -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<!-- stylesheet -->
	<link rel = "stylesheet" href = "/static/css/header.css" type = "text/css">
	<link rel = "stylesheet" href = "/static/css/createView.css" type = "text/css">
</head>
<body>
	
		<div id  ="wrap">
			<c:import url ="/WEB-INF/jsp/include/header.jsp" />
			<section class ="d-flex justify-content-center">
				<div class ="w-75 my-5 mx-auto">
					
					<div class ="d-flex col-12 justify-content-center">
						<label class ="mr-2 mt-2 ">제목:</label>
						<input type ="text" class ="form-control col-9" placeholder = "제목 입력" id ="titleInput">
						
					</div>
					<div class ="d-flex  col-12 justify-content-center">
						<textarea class ="form-control mt-5 col-10 " rows ="20" id="contentInput"></textarea>
					</div>	
					<div class="d-flex col-12">
						<input type ="file" class="ml-10 mt-2" id ="fileInput">
					</div>
					
				<div class="d-flex col-10 justify-content-end">
					<label for="captcha">다중 업로드 방지</label>
					
						<img id ="captchaImg" class ="btn col-1 " title="캡차이미지" src="/captchaImg.do" alt="캡차이미지" class ="col-1 form-control" />
						<button id="reload" type="button"   onclick="javaScript:getImage()" >새로고침</button>
				<!-- class ="d-none" -->
					
						<input id="answer" type="text" class="form-control col-1">
						<button id="check" class ="btn  col-1" type="button">확인</button>
					
				</div>	


				<div class ="d-flex justify-content-between mt-5">
						
							<a href = "/post/list_view" class ="btn btn-info">목록으로</a>
							<button type ="button" class ="btn btn-success" id ="saveBtn">저장하기</button>
						</div>
				</div>
			</section>
			
			<c:import url ="/WEB-INF/jsp/include/footer.jsp"/>
		</div>
		
		<script>
		$(document).ready(function(){
			
			
			$("#captchaImg").on("click",function(){
				$("#reload").click();

			});	
			$("#saveBtn").on("click",function(){
				var title  = $("#titleInput").val().trim();
				var content  = $("#contentInput").val();
				
				if(title == null || title == ""){
					alert("제목을 입력하세요.");
					return;
				}
				if(content == null || content == ""){
					alert("내용을 입력하세요");
					return;
				}
				if(!content&&!title){
					alert("내용을 입력하세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("subject",title);
				formData.append("content",content);
				formData.append("file", $("#fileInput")[0].files[0]);

			
				
				$.ajax({
					type :"post",
					url:"/post/create",
					data:formData,
					enctype:"multipart/form-data", //  파일 업로드 필수
					processData:false,
					contentType:false,
					success:function(data){
						if(data.result == "success"){
							alert("성공");
							location.href = "/post/list_view";
						}
						else{
							alert("글쓰기 실패");
						}
					},
					error:function(){
						alert("에러 발생");
					}
				});
				
			});
			
		});
		</script>
<script src="/static/js/captcha.js"></script>
</body>
</html>