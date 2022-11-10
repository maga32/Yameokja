$(function(){

// 가게 검색어 미입력시
	$("#storeSearchKeyword").click(function(){
	
		var type1 = $("#type1").val();
		
		var keyword = $("#keyword").val();
		
		if(type1 == "선택"){
			alert("지역을 선택해주세요");
			return false;
			
		} else if(keyword.length == 0){
			alert("검색어를 한 글자 이상 입력해주세요");
			return false;
		}
			
	});
	
	// 별점입력 시작-----------------------------------------
	$("#rate5").click(function(){
		$("#postStar").val("5");
	});
	$("#rate4").click(function(){
		$("#postStar").val("4");
	});
	$("#rate3").click(function(){
		$("#postStar").val("3");
	});
	$("#rate2").click(function(){
		$("#postStar").val("2");
	});
	$("#rate1").click(function(){
		$("#postStar").val("1");
	});

// 가게 정보 작성할 때 회원이 아닐 시
	$("#storeWriteForm").click(function() {

		var id = $("#memberId").val();

		if(id.length == null){
			alert("가게를 등록하려면 로그인이 필요합니다.");
			return false;
		}

	});
	
});
	function storeAddress() {
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 우편번호 검색 결과 항목을 클릭했을때 실행할 코드를 여기에 작성한다.
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고 항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				// 사용자가 도로명 주소를 선택했을 경우
	            if (data.userSelectedType === 'R') { 
	                addr = data.roadAddress;

	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
					// 모두 도로명 주소가 선택되도록 변경했음
					addr = data.roadAddress; 
	                //addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고 항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? 
												', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고 항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
					
	                // 조합된 참고 항목을 상세주소에 추가한다.
	                addr += extraAddr;
	            }

				// 우편번호와 주소 정보를 해당 입력상자에 출력한다.
				$("#zipcode").val(data.zonecode);
				$("#address1").val(addr);
				
				// 커서를 상세주소 입력상자로 이동한다.
				$("#address2").focus();
	       	}
		}).open();
}