<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<!-- ¾ÆÀÌÄÜ -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/static/fonts/font-awesome-4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" type="text/css" href="/static/css/header.css">


<section id="header">
	<div class="wrapper">

		<div class="title">
			<i class="fas fa-kiss-wink-heart"></i> noticeBoard
		</div>
		<div class="wrap mt-5">
			<div class="search">
				<input type="text" class="searchTerm" placeholder="What are you looking for?" id="searchInput">
				<button type="button" class="searchButton" id ="searchButton">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>



		<div class="d-flex">
			<a href="/memo/create_view">
				<i class="bi bi-pen-fill  mr-5"></i>
			</a>
			<a href="/memo/list_view">
				<i class="bi bi-house-door-fill"></i>
			</a>
		</div>


	</div>
</section>
</html>

<script type="module" src="/static/js/search.js"></script>