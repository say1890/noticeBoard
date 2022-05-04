<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메모 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=3.0">

<!-- bootstrap -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- 테이블 관련  -->



<!--===============================================================================================-->
<link rel="icon" type="image/png" href="/static/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/static/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/static/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/static/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/static/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/static/css/util.css">
<link rel="stylesheet" type="text/css" href="/static/css/table.css">
<link rel="stylesheet" type="text/css" href="/static/css/body.css">
<!--===============================================================================================-->

<!-- 인기 게시물 stylesheet -->
<link rel="stylesheet" href="/static/css/gallery.css" type="text/css">

<!-- tablesorter  -->
<script type="module" src="/static/js/jquery.tablesorter.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />

	<table class="tablesorter mt-5" cellpadding="0" cellspacing="0" border="0">

		<thead class="tbl-header" >
			<tr>
				<th class="text-center" >NO.</th>
				<th>제목</th>
				<th>시간</th>
				<th>조회수</th>
			</tr>
		</thead>





		<tbody class="tbl-content">
			<c:forEach var="memo" items="${memolist}">

				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="nowday">
					<fmt:formatDate value="${now}" pattern="yyyyMMdd" />
				</c:set>
				<c:set var="createdAt">
					<fmt:formatDate value="${memo.createdAt}" pattern="yyyyMMdd" />
				</c:set>

				<tr>

					<td>

						<c:choose>
							<c:when test="${nowday eq createdAt }">
								<a href="/memo/detail_view?memoId=${memo.id}">
									<div class="text-center text-danger">${memo.id}</div>
								</a>
							</c:when>
							<c:otherwise>
							<a href="/memo/detail_view?memoId=${memo.id}" >
								<div class="text-center">${memo.id}</div>
							</a>	
							</c:otherwise>
						</c:choose>

					</td>
					 <td><a href="/memo/detail_view?memoId=${memo.id}"> ${memo.subject}</a></td> 



					<c:set var="createdTime">
						<fmt:formatDate value="${memo.createdAt}" pattern="HH" />
					</c:set>
					<c:set var="time">
						<fmt:formatDate value="${memo.createdAt}" pattern="h:mm" />
					</c:set>


					<td>
						<c:if test="${nowday eq createdAt }">
						오늘
							<c:choose>
								<c:when test="${ createdTime <12 }">
											오전
								</c:when>
								<c:otherwise>
											오후
								</c:otherwise>
							</c:choose>
								${time}		
						</c:if>

						<c:if test="${nowday ne createdAt }">
							<fmt:formatDate value="${memo.createdAt}" pattern="M월 d일" />
							<c:choose>
								<c:when test="${ createdTime <12 }">
											오전
								</c:when>
								<c:otherwise>
											오후
								</c:otherwise>
							</c:choose>
							${time}
						</c:if>


					</td>


					<td>${memo.view}</td>
				</tr>
			</c:forEach>

		</tbody>





	</table>
	<div class="d-flex justify-content-center mt-5 ">

		<c:if test="${pageMaker.prev}">
			<a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<a href="${pageMaker.makeQuery(idx)}" class="mr-3">${idx}</a>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a>
		</c:if>

	</div>
	<c:if test="${!empty popularMemos}">
		<c:import url="/WEB-INF/jsp/memo/gallery.jsp" />
	</c:if>









	<!--===============================================================================================-->
	<script src="/static/vendor/bootstrap/js/popper.js"></script>
	<script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="/static/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="/static/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
			$('.js-pscroll').each(function() {
				var ps = new PerfectScrollbar(this);

				$(window).on('resize', function() {
					ps.update();
				})
			});

			$(function() {
				$(".tablesorter").tablesorter({
					widgets : [ 'zebra' ],
					sortList : [ [ 0, 1 ] ]
				});
			});
		</script>
	<!--===============================================================================================-->
	<script src="/static/js/table.js"></script>
</body>
</html>