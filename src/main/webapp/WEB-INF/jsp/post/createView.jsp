<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޸� �Է�</title>
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
						<label class ="mr-2 mt-2 ">����:</label>
						<input type ="text" class ="form-control col-9" placeholder = "���� �Է�" id ="titleInput">
						
					</div>
					<div class ="d-flex  col-12 justify-content-center">
						<textarea class ="form-control mt-5 col-10 " rows ="20" id="contentInput"></textarea>
					</div>	
					<div class="d-flex col-12">
						<input type ="file" class="ml-10 mt-2" id ="">
					</div>	
						
						<div class ="d-flex justify-content-between mt-5">
							<a href = "/post/list_view" class ="btn btn-info">�������</a>
							<button type ="button" class ="btn btn-success" id ="saveBtn">�����ϱ�</button>
						</div>
				</div>
			</section>
			
			<c:import url ="/WEB-INF/jsp/include/footer.jsp"/>
		</div>
		
		<script>
		$(document).ready(function(){
			$("#saveBtn").on("click",function(){
				var title  = $("#titleInput").val().trim();
				var content  = $("#contentInput").val();
				
				if(title == null || title == ""){
					alert("������ �Է��ϼ���.");
				}
				if(content == null || content == ""){
					alert("������ �Է��ϼ���");
				}
				
				var formData = new FormData();
				formData.append("subject",title);
				formData.append("content",content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				
				$.ajax({
					type :"post",
					url:"/post/create",
					data:formData,
					enctype:"multipart/form-data", //  ���� ���ε� �ʼ�
					processData:false,
					contentType:false,
					success:function(data){
						if(data.result == "success"){
							alert("����");
							location.href = "/post/list_view";
						}
						else{
							alert("�۾��� ����");
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