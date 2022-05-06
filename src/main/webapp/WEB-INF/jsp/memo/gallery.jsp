<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- script-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<!-- stylesheet -->
<link rel="stylesheet" href="/static/css/gallery.css" type="text/css">

<div class="demo-wrapper">
	<h1>인기 게시물</h1>
	<ul class="portfolio-items">
		<c:forEach var="memo" items="${popularMemos}">
			<li class="item">
				<figure>
					<div class="view">
						<a href="/memo/detail_view?memoId=${memo.id}">
							<img src="${memo.imagePath}" />
						</a>
					</div>
					<figcaption>
						<p>
						<h4>
							<a href="/memo/detail_view?memoId=${memo.id}">
								❝
								<c:set var="subject" value="${memo.subject}" />
								<c:choose>
									<c:when test="${fn:length(subject)>18}">
												 ${fn:substring(subject,0,17)}...
										</c:when>
									<c:otherwise>
												 ${memo.subject}
										</c:otherwise>
								</c:choose>
								❞
							</a>
						</h4>
						</p>
						<p>
							<c:set var="content" value="${memo.content}" />
							<c:choose>
								<c:when test="${fn:length(content)>30}">
													 ${fn:substring(content,0,30)}…
											</c:when>
								<c:otherwise>
														${memo.content}
											</c:otherwise>
							</c:choose>
						</p>
					</figcaption>
				</figure>
				<div class="views">👀${memo.view}</div>
			</li>
		</c:forEach>



	</ul>
</div>


<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="module" src="/static/js/gallery.js"></script>





