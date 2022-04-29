window.onload = function() {
	document.getElementById('searchButton').addEventListener('click', function() {
		var searchInput = document.getElementById('searchInput').value;
		if (!searchInput) {
			alert("검색어를 입력하세요.");
		} else {
			$.ajax({
				url: "/memo/search_view/",
				type: "GET",
				data: {"keyword":searchInput},
				success: function(result) {
					if (result) {
						location.href= "/memo/search_view?keyword=${keyword}";
					} else {
						alert("검색 실패! :(");
					}
				}, error: function() {
					alert("에러 발생");
				}
			})

		}


	});
}