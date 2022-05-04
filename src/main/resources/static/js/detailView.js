var currentUrl = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname
+window.location.search;
//  Source: css-tricks


var twitterBtn = document.getElementById('twitterBtn');
var facebookBtn = document.getElementById('facebookBtn');

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
