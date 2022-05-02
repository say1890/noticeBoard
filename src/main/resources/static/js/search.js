

window.onload = function() {
	document.getElementById('searchButton').addEventListener('click', function() {
		var keyword = document.getElementById('keyword').value;
		var searchType = document.getElementById('searchType').value;

		if (!searchType) {
			document.getElementById('searchType').focus();
			alert("검색 조건을 선택하세요!");
			return;
		}
		if (!keyword) {
			document.getElementById('keyword').focus();
			alert("검색어를 입력하세요!");
			return;
		} else {
			$.ajax({
				url: "/memo/list_view",
				type: "GET",
				data: {
					"keyword": keyword,
					"searchType": searchType
				},
				success: function(result) {
					if (result) {
						var url = "list_view?page=1"
							+ "&perPageNum=" + 10
							+ "&searchType=" + searchType
							+ "&keyword=" + encodeURIComponent(keyword);
						window.location.href = url;
						
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