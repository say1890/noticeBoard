var currentUrl = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname
	+ window.location.search;
//  Source: css-tricks


var twitterBtn = document.getElementById('twitterBtn');
var facebookBtn = document.getElementById('facebookBtn');
var deleteBtn = document.getElementById('deleteBtn');

deleteBtn.addEventListener('click', event => {
	let memoId = deleteBtn.dataset.memoId;
	$.ajax({

		type: "get",
		url: "/memo/delete",
		data: {
			"memoId": memoId
		},
		success: function(data) {
			if (data.result == "success") {
				alert("삭제 성공");
				location.href = "/memo/list_view"
			}
		},
		error: function() {
			alert("에러 발생");
		}

	});
});
twitterBtn.addEventListener('click', event => {
	shareTwitter();
});

facebookBtn.addEventListener('click', event => {
	shareFacebook();
});


function shareTwitter() {
	var sendText = "개발새발"; // 전달할 텍스트
	var sendUrl = currentUrl; // 전달할 URL
	window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}

function shareFacebook() {
	var sendUrl = currentUrl; // 전달할 URL
	window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}
