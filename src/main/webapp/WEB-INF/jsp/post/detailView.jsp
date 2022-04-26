<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޸� ����</title>
<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	
	
<!-- ��Ʈ��Ʈ�� ������ -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- stylesheet -->
	<link rel = "stylesheet" href = "/static/css/style.css" type = "text/css">
</head>
<body>
	
		<div id  ="wrap">
			<c:import url ="/WEB-INF/jsp/include/header.jsp" />
			<section class ="d-flex justify-content-center">
				<div class ="w-75 my-5">
					<div class ="d-flex">
						<label class ="mr-2 mt-2">����:</label>
						<input type ="text" class ="form-control col-11" placeholder = "���� �Է�" id ="titleInput"	value ="${post.subject}">
					</div>	
						<textarea class ="form-control mt-5" rows ="5" id="contentInput">${post.content}</textarea>
						<div>
							<img src = "${post.imagePath}">
						</div>
						
						
						<div class ="d-flex justify-content-between mt-5">
						<i class="bi bi-trash-fill text-danger" id ="deleteBtn" data-post-id ="${post.id}"></i>
						</div>
				</div>
			</section>
			
			<c:import url ="/WEB-INF/jsp/include/footer.jsp"/>
		</div>
		
		<script>
		$(document).ready(function(){
			$("#deleteBtn").on("click",function(){
				
				let postId = $(this).data('post-id');
				$.ajax({
					
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data){
						if(data.result=="success"){
							alert("���� ����");
							location.href = "/post/list_view"
						}
					},
					error:function(){
						alert("���� �߻�");
					}
					
					
				});
			});
		});
		</script>
</body>
</html>