
window.onload = function() {

	getImage(); // 이미지 가져오기

}
var checkNum = false;
let checkInput = document.querySelector("#checkInput");
let captchaImg = document.querySelector("#captchaImg");
const checkBtn = document.querySelector("#checkBtn");
const saveBtn = document.querySelector("#saveBtn");

checkBtn.addEventListener("click", function() {

	if (!checkInput.value) {
		alert("다중 업로드 방지 문자를 입력하세요!");
	}
	else {
		var params = {
			answer: checkInput.value
		};

		$.ajax({
			type: "GET",            // HTTP method type(GET, POST) 형식이다.
			url: "/chkAnswer.do",      // 컨트롤러에서 대기중인 URL 주소이다.
			data: params,            // Json 형식의 데이터이다.
			success: function(returnData) {
				if (returnData == 200) {
					alert("입력값이 일치합니다.");
					checkNum = true;
					// 성공 코드 
				} else {
					alert("입력값이 일치하지 않습니다.");
					getImage();
					checkInput.setAttribute("value", "");
				}

			},
			error: function() {
				alert("통신 실패.")
			}
		});

	}


});

captchaImg.addEventListener("click", function() {
	getImage();
});

saveBtn.addEventListener("click", function() {
	var title = $("#titleInput").val().trim();
	var content = $("#contentInput").val();
	if (checkNum != true) {
		alert("다중 업로드 방지 문자를 확인해주세요.");
		return;
	}
	if (!title) {
		alert("제목을 입력하세요.");
		return;
	}
	if (content == null || content == "") {
		alert("내용을 입력하세요");
		return;
	}
	if (!content && !title) {
		alert("내용을 입력하세요");
		return;
	}

	var formData = new FormData();
	formData.append("subject", title);
	formData.append("content", content);
	formData.append("file", $("#fileInput")[0].files[0]);

	$.ajax({
		type: "post",
		url: "/memo/create",
		data: formData,
		enctype: "multipart/form-data", //  파일 업로드 필수
		processData: false,
		contentType: false,
		success: function(data) {
			if (data.result == "success") {
				alert("성공");
				location.href = "/memo/list_view";
			} else {
				alert("글쓰기 실패");
			}
		},
		error: function() {
			alert("에러 발생");
		}
	});

});

/*매번 랜덤값을 파라미터로 전달하는 이유 : IE의 경우 매번 다른 임의 값을 전달하지 않으면 "새로고침" 클릭해도 정상 호출되지 않아 이미지가 변경되지 않는 문제가 발생된다 */
function getImage() {
	var rand = Math.random();
	var url = "/captchaImg.do?rand=" + rand;
	document.querySelector("img").setAttribute("src", url);
}