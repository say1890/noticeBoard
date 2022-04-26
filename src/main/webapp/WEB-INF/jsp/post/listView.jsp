<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메모 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap -->

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- stylesheet -->



<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/static/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/static/css/util.css">
	<link rel="stylesheet" type="text/css" href="/static/css/main.css">
<!--===============================================================================================-->





</head>
<body>
<c:import url ="/WEB-INF/jsp/include/header.jsp" />



<div class="table100 ver1 m-b-110 mt-5">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">NO.</th>
									<th class="cell100 column2">제목</th>
									<th class="cell100 column3">시간</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll ps ps--active-y">
					
					
					
						<table>
							<tbody>
								<c:forEach var ="post" items = "${postlist}">
						
								<tr class="row100 body">
									<td class="cell100 column1">${post.id}</td>
									<td class="cell100 column2"><a href ="/post/detail_view?postId=${post.id}">${post.subject}</td>
									<td class="cell100 column3"><fmt:formatDate value ="${post.createdAt}" pattern = "yyyy년 MM월 dd일 h시 mm분"/></td>
								</tr>

								</c:forEach>
							</tbody>
						</table>
					<div class="ps__rail-x" style="left: 0px; bottom: -580px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 580px; height: 585px; right: 5px;"><div class="ps__thumb-y" tabindex="0" style="top: 291px; height: 293px;"></div></div></div>
				</div>
				<div class ="d-flex justify-content-center">
					  <ul>
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li><a href="${pageMaker.makeQuery(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
				</div>


<!--===============================================================================================-->	
	<script src="/static/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/static/vendor/bootstrap/js/popper.js"></script>
	<script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/static/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/static/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
<!--===============================================================================================-->
	<script src="/static/js/main.js"></script>
</body>
</html>