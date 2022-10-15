$(function(){

// 커뮤니티 검색
	$("#communitySearchForm").on("submit", function(){
	
		var keyword = $("#communitySearchKeyword").val()
		
		if(keyword.length == 0){
			alert("검색어를 한 글자 이상 입력해주세요");
			return false;
		}
	});
	
// 커뮤니티 수다글 등록 유효성 검사
	$("#community101WriteForm").on("submit", function() {	
		var title = $("#co101Title").val();
		var content = $("#co101Content").val();
		
		if(title.length < 2){
			alert("제목은 두 글자 이상 작성해주세요.");
			return false;
		}
		else if(content.length < 2){
			alert("내용을 입력해주세요.");
			return false;
		}	
	});
	
	
// 커뮤니티 댓글 작성
	$(document).on("submit", "#communityReplyWriteForm", function() {
	
		if($("#communityContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		var id = $("#memberId").val();
		
		if(id.length == 0){
			alert("댓글을 작성하려면 로그인해 주세요.");
			return false;
		}
		
		var u = "replyWrite.ajax";
		var params = $(this).serialize();

		replyAjaxAction(u, params);
		
		// 폼이 submit 되는 것을 취소한다.
		return false;
	});
	
// 커뮤니티 댓글 삭제
	$(document).on("submit", "#communityReplyDeleteForm", function() {
	
		var id = $("#memberId").val();
		
		if(id.length == 0){
			alert("댓글을 삭제하려면 로그인해 주세요.");
			return false;
		}
		
		var u = "replyDelete.ajax";
		var params = $(this).serialize();

		replyAjaxAction(u, params);
		
		// 폼이 submit 되는 것을 취소한다.
		return false;
	});	
	
});

// 댓글 ajax 처리
function replyAjaxAction(u, d){

	alert(d)

	$.ajax({
			url: u,
			type: "post",
			data: d,
			dataType: "json",
			success: function(resultData, status, xhr) {								

				$("#communityReplyList").empty();				
				console.log(resultData);
				$.each(resultData, function(index, value) {					

					var id = $("#communityParentNo").val();
					var communityReReplyZeroCheck = value.communityReReply;
					let parentCommunityNo = value.communityNo;
					
					if(communityReReplyZeroCheck == 0){
						var result = 
							"<div style='border:1px solid black'>"
							+ "	작성자" + value.memberId + "<br>"
							+ "	작성일" + value.communityRegDate + "<br>"
							+ "	내용" + value.communityContent + "<br>"
							// 답글 여부, 글 번호 체크
							+ "	글 번호" + value.communityNo + "<br>"
							+ "	답글 여부" + value.communityReReply + "<br>"
							+ '<input type="button" id="" value="답글">'
							+ '<input type="button" id="" value="수정">'
							+ '<form id="communityReplyDeleteForm" name="communityReplyDeleteForm">'
							+ '<input type="hidden" name="replyCommunityParentNo" value="'+id+'">'
							+ '<input type="hidden" name="replyCommunityNo" value="'+value.communityNo+'">'
							+ '<input type="submit" name="replyDelete">'
							+ '</form>'
							+ '<input type="button" id="" value="신고">'
							+ "</div>";
							
							$("#communityReplyList").append(result);		
							
							$.each(resultData, function(index, value){
								
								// 반복되는 parentCommunityNo = 0 초기화 해결 - 값 유지하기
								if(parentCommunityNo != 0) {
									var parentCommunityNoEach2 = parentCommunityNo;
								}

								var childCommunityReReply = value.communityReReply;
								console.log("parentCommunityNoEach2 : " +parentCommunityNoEach2+ " - childCommunityReReply : " + childCommunityReReply);
								
								// 355번호 글 = 새로운 for문 안의 reReply가 355일 때
								if(parentCommunityNoEach2 == childCommunityReReply){
									var result2 = 
										"<div style='border:1px solid black'>"
										+ "	작성자" + value.memberId + "<br>"
										+ "	작성일" + value.communityRegDate + "<br>"
										+ "	내용" + value.communityContent + "<br>"
										// 답글 여부, 글 번호 체크
										+ "	글 번호" + value.communityNo + "<br>"
										+ "	답글 여부" + value.communityReReply + "<br>"
										+ '<input type="button" id="" value="답글">'
										+ '<input type="button" id="" value="수정">'
										+ '<form id="communityReplyDeleteForm" name="communityReplyDeleteForm">'
										+ '<input type="hidden" name="replyCommunityParentNo" value="'+id+'">'
										+ '<input type="hidden" name="replyCommunityNo" value="'+value.communityNo+'">'
										+ '<input type="submit" name="replyDelete">'
										+ '</form>'
										+ '<input type="button" id="" value="신고">'
										+ "</div>";
										
										$("#communityReplyList").append(result2);
										console.log("parentCommunityNoEach2 : " +parentCommunityNoEach2+ " - childCommunityReReply : " + childCommunityReReply);
										console.log("출력 시점 - communityNo:" + value.communityNo);
								}
							});
						}
					
											
				});				
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});

}