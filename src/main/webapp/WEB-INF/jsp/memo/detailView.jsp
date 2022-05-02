<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메모 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=3.0">

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- fancy box css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css" />
<!-- stylesheet -->
<link rel="stylesheet" href="/static/css/util.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/static/css/body.css">
<link rel="stylesheet" type="text/css" href="/static/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<div id="wrap">
		
		<section class="d-flex justify-content-center">
			<div class="w-75 my-5">
				<div class="d-flex">

					<div class="col-11" id="titleInput">
						<h1>
							<c:out value="${memo.subject}"></c:out>
						</h1>
						<c:set var="createdAt"><fmt:formatDate value ="${memo.createdAt}" pattern = "yyyy-MM-dd hh:mm"/></c:set>
						<span class = "d-flex justify-content-end">${createdAt}</span>
					</div>

				</div>
				<hr>
				<textarea readonly class="form-control mt-5"  cols="30" rows="5" id="contentInput">${memo.content}</textarea>
				<div>
					<a href="${memo.imagePath}" data-fancybox>
						<img src="${memo.imagePath}">
					</a>

				</div>


				<div class="d-flex justify-content-between mt-5">
					<i class="bi bi-trash-fill text-danger" id="deleteBtn" data-memo-id="${memo.id}"></i>
				</div>
			</div>
		</section>

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function(){
			$("#deleteBtn").on("click",function(){
				
				let memoId = $(this).data('memo-id');
				$.ajax({
					
					type:"get",
					url:"/memo/delete",
					data:{"memoId":memoId},
					success:function(data){
						if(data.result=="success"){
							alert("삭제 성공");
							location.href = "/memo/list_view"
						}
					},
					error:function(){
						alert("에러 발생");
					}
					
					
				});
			});
		});
		</script>

	<!-- fancybox -->
	<script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
</body>
</html>