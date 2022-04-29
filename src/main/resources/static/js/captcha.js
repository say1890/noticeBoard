var checkNum = false;

window.onload = function() {
	getImage(); // 이미지 가져오기
	document.querySelector('#check').addEventListener('click', function() {
		if(!document.getElementById('answer').value){
			alert("다중 업로드 방지 문자를 입력하세요!");
			
		}
		else{
			var params = {
			answer : document.getElementById('answer').value
			};
			
		$.ajax({
			type: "GET",            // HTTP method type(GET, POST) 형식이다.
			url: "/chkAnswer.do",      // 컨트롤러에서 대기중인 URL 주소이다.
			data: params,            // Json 형식의 데이터이다.
			success:function(returnData) { 
				if (returnData == 200) {
					alert('입력값이 일치합니다.');
					checkNum = true;
					// 성공 코드 
				} else {
					alert('입력값이 일치하지 않습니다.');
					getImage();
					document.querySelector('#answer').setAttribute('value', '');
				}
				
			},
			error: function() { 
				alert("통신 실패.")
			}
		});
			
		}
		
			
		});


}

/*매번 랜덤값을 파라미터로 전달하는 이유 : IE의 경우 매번 다른 임의 값을 전달하지 않으면 '새로고침' 클릭해도 정상 호출되지 않아 이미지가 변경되지 않는 문제가 발생된다 */
function getImage() {
	var rand = Math.random();
	var url = '/captchaImg.do?rand=' + rand;
	document.querySelector('img').setAttribute('src', url);
}