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
	
// 가게 댓글 작성 시 로그인 상태가 아닐 때
$("#storeDatailReply").on("submit", function() {
	
		var id = $("#memberId").val();
		
		if(id.length == 0){
			alert("댓글을 작성하려면 로그인해 주세요.");
			return false;
		}
		return false;
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