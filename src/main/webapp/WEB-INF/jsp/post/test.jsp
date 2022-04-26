<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<!-- script-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>


<!-- stylesheet -->
<link rel = "stylesheet" href = "/static/css/test.css" type = "text/css">





<div class="demo-wrapper">
	<h1>인기 게시물</h1>
    <ul class="portfolio-items">
    <c:forEach var = "posts" items ="${popularPosts}">
				<li class="item">
					<figure>
						<div class="view">
							<a href = "/post/detail_view?postId=${posts.id}" ><img src="${posts.imagePath}" /></a>
						</div>
						<figcaption>
							<p>
								<h4>
									<a href ="/post/detail_view?postId=${posts.id}">
									❝ 
									<c:set var="subject" value="${posts.subject}"/>
									<c:choose>
										<c:when test = "${fn:length(subject)>14}">
											 ${fn:substring(subject,0,14)}...
										</c:when>
										<c:otherwise>
											 ${posts.subject}
										</c:otherwise>
										
									</c:choose>
									❞
									</a>
								</h4>
							</p>
							<p>
								${posts.content}
							</p>
						</figcaption>
					</figure>
					<div class="views">👀${posts.view}</div>
				</li>
	</c:forEach>
    
 
    

  </ul>
  </div>
  

 <!-- jquery -->
 	<script src="http://code.jquery.com/jquery-latest.js"></script> 
<!-- javascript -->
	<script type="module" src="/static/js/test.js"></script>	 

  
  

  
 