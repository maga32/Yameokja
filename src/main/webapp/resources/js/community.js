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
	
	// 커뮤니티 모집글 등록 유효성 검사
	$("#community102WriteForm").on("submit", function() {	
		var title = $("#co102Title").val();
		var content = $("#co102Content").val();
		var partyDDay = $("#co102PartyDDay").val();
		var co102PartyPlace = $("#co102PartyPlace").val();
		
		if(title.length < 2){
			alert("제목은 두 글자 이상 작성해주세요.");
			return false;
		}
		else if(content.length < 2){
			alert("내용을 입력해주세요.");
			return false;
		}
		else if(partyDDay.length == 0){
			alert("모집일을 선택해주세요.");
			return false;
		}
		else if(co102PartyPlace.length == 0){
			alert("모집장소를 입력해주세요.");
			return false;
		}	
	});
	
	
// 커뮤니티 댓글 작성
	$(document).on("submit", "#communityReplyWriteForm", function() {
	
	
		if(($("#communityContent").val().length <= 1) && ($("#communityReplyContent").val().length <= 1)) {
			alert("댓글은 한 글자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		var id = $("#memberId").val();
		
		if(id.length == 0){
			alert("댓글을 작성하려면 로그인해 주세요.");
			return false;
		}
		
		var params = $(this).serialize();
		var u = "replyWrite.ajax";

		replyAjaxAction(u, params);
		
		// 폼이 submit 되는 것을 취소한다.
		return false;
	});
	
	
// 커뮤니티 댓글 수정
	$(document).on("submit", "#communityReplyUpdateForm", function() {
	
	
		if(($("#communityContent").val().length <= 1) && ($("#communityReplyContent").val().length <= 1)) {
			alert("댓글은 한 글자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		var id = $("#memberId").val();
		
		if(id.length == 0){
			alert("댓글을 작성하려면 로그인해 주세요.");
			return false;
		}
		
		var u = "replyUpdate.ajax";
		var params = $(this).serialize();
		// communityReRely > co

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
	
// 커뮤니티 답글 작성폼 출력
	$("#communityReplyArea").on("click", ".btnCommunityReReplyWriteFormOpen", function(){
		var target = $(this).val();
		target = target.split(",");
		
		var targetNo = target[0];
		var targetId = target[1];
		var status = $("div[id=communityReReplyWriteFormNo" + targetNo+ "]").attr("style");
		var communityParent = $("#communityReReplyParentNoAt" + targetNo).val();
		alert(communityParent);
		
		alert(target+ " - " + targetNo + " - " + targetId + " - " + communityParent);
		alert("답글을 달아주세요!" + targetNo + status);
		if( status == "display : none"){
			$("div[id=communityReReplyWriteFormNo" + targetNo+ "]").attr("style", "display : block");
			$("#communityReReplyAt" + targetNo).val(targetNo);
			$("#communityReplyTargetAt" + targetNo).val(targetId);
			if( communityParent != '0' ){
				$("#communityReReplyAt" + targetNo).val(communityParent);
			}
		}
		else if( status == "display : block"){
			$("div[id=communityReReplyWriteFormNo" + targetNo+ "]").attr("style", "display : none");
		}	
	});
	
// 커뮤니티 답글 수정폼 출력
	$("#communityReplyArea").on("click", ".btnCommunityReReplyUpdateFormOpen", function(){
		var target = $(this).val();
		target = target.split(",");
		
		var targetNo = target[0];
		var targetId = target[1];
		var status = $("div[id=communityReReplyWriteFormNo" + targetNo+ "]").attr("style");
		var content = $("div[id=communityReplyContentResultAt" +targetNo+ "]").text();
		alert(target+ " - " + targetNo + " - " + targetId + " - " + content);
			
		alert("답글을 수정해주세요!" + targetNo + status);
		if( status == "display : none"){
			$("#communityReplyContentAt" +targetNo).val(content);
			$("div[id=communityReReplyWriteFormNo" + targetNo+ "]").attr("style", "display : block");
			$("#communityNo" + targetNo).val(targetNo);
		}
		else if( status == "display : block"){
			$("div[id=communityReReplyWriteFormNo" + targetNo+ "]").attr("style", "display : none");
		}	
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
			
				console.log(resultData);
				
				if(resultData== false) {
					alert("작성자가 아닙니다.");
					return false;
				}else{
					$("#communityReplyList").empty();				
					$.each(resultData, function(index, value) {					
	
						var id = $("#communityParentNo").val();
						var communityReReplyZeroCheck = value.communityReReply;
						let parentCommunityNo = value.communityNo;
						
						if(communityReReplyZeroCheck == 0){
							var result1 = 
								"<div style='border:1px solid black'>"
								+ "	작성자" + value.memberId + "<br>"
								+ "	작성일" + value.communityRegDate + "<br>"
								+ '	<div id="communityReplyContentResultAt' + value.communityNo + '">' + value.communityContent + '</div><br>'
								// 답글 여부, 글 번호 체크
								+ "	글 번호" + value.communityNo + "<br>"
								+ "	답글 여부" + value.communityReReply + "<br>"
								+ '<button class="btnCommunityReReplyWriteFormOpen" value="' + value.communityNo + ',' + value.memberId + '">답글</button>'
								+ '<input type="hidden" id="communityReReplyParentNoAt' + value.communityNo + '" value="' + value.communityReReply + '">';
								
							if( value.categoryNo == -1 ){
								var result2 = "";
							}else{
								var result2 = 
								'<button class="btnCommunityReReplyUpdateFormOpen" value="' + value.communityNo + ',' + value.memberId + '">수정</button>'
								+ '<form id="communityReplyDeleteForm" name="communityReplyDeleteForm">'
								+ '<input type="hidden" name="replyCommunityParentNo" value="'+id+'">'
								+ '<input type="hidden" name="replyCommunityNo" value="'+value.communityNo+'">'
								+ '<input type="submit" name="replyDelete">'
								+ '</form>';					
							}							
					
							var result3 = 
								'<input type="button" id="" value="신고">'
								+ '<div id="communityReReplyWriteFormNo' + value.communityNo + '" style="display : none">'
								+ '<form id="communityReplyWriteForm" name="communityReplyWriteForm" >'
								+ '<input type="hidden" name="communityParentNo" id="communityParentNo" value="' + value.communityParentNo + '">'
								+ '<input type="hidden" name="communityReReply" id="communityReReplyAt' + value.communityNo + '" value=0>'
								+ '<input type="hidden" name="communityReplyTarget" id="communityReplyTargetAt' + value.communityNo + '"	 value="">'
								+ '<input type="hidden" name="communityReplyUpdateNo" value="' + value.communityNo + '">'
								+ '<input type="hidden" name="communityNo" id="communityNo' + value.communityNo + '" value="">'
								+ '<div>'
								+ '<textarea id="communityReplyContentAt' + value.communityNo + '" name="communityContent" placeholder="댓글을 입력해주세요">'
								+ '</textarea>'
								+ '<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="확인">'
								+ 	'</div>'
								+ '</form>'
								+ "</div>"
								+ "</div>";
								
								var str = result1 + result2 + result3;
								$("#communityReplyList").append(str);		
								
								$.each(resultData, function(index, value){
									
									// 반복되는 parentCommunityNo = 0 초기화 해결 - 값 유지하기
									if(parentCommunityNo != 0) {
										var parentCommunityNoEach2 = parentCommunityNo;
									}
	
									var childCommunityReReply = value.communityReReply;
									//console.log("parentCommunityNoEach2 : " +parentCommunityNoEach2+ " - childCommunityReReply : " + childCommunityReReply);
									
									// 355번호 글 = 새로운 for문 안의 reReply가 355일 때
									if(parentCommunityNoEach2 == childCommunityReReply){
										var result2 = 
											"<div style='border:1px solid black'>"
											+ "	작성자" + value.memberId + "<br>"
											+ "	작성일" +  value.communityRegDate + "<br>"
											+ "	내용 @"+ value.communityReplyTarget + " " + value.communityContent + "<br>"
											// 답글 여부, 글 번호 체크
											+ "	글 번호" + value.communityNo + "<br>"
											+ "	답글 여부" + value.communityReReply + "<br>"
											+ '<button class="btnCommunityReReplyWriteFormOpen" value="' + value.communityNo + ',' + value.memberId + '">답글</button>'
											+ '<input type="hidden" id="communityReReplyParentNoAt' + value.communityNo + '" value="' + value.communityReReply + '">'
											+ '<input type="button" id="" value="수정">'
											+ '<form id="communityReplyDeleteForm" name="communityReplyDeleteForm">'
											+ '<input type="hidden" name="replyCommunityParentNo" value="'+id+'">'
											+ '<input type="hidden" name="replyCommunityNo" value="'+value.communityNo+'">'
											+ '<input type="submit" name="replyDelete">'
											+ '</form>'
											+ '<input type="button" id="" value="신고">'
											+ '<div id="communityReReplyWriteFormNo' + value.communityNo + '" style="display : none">'
											+ '<form id="communityReplyWriteForm" name="communityReplyWriteForm" >'
											+ '<input type="hidden" name="communityParentNo" id="communityParentNo" value="' + value.communityParentNo + '">'
											+ '<input type="hidden" name="communityReReply" id="communityReReplyAt' + value.communityNo + '" value=0>'
											+ '<input type="hidden" name="communityReplyTarget" id="communityReplyTargetAt' + value.communityNo + '"	 value="">'
											+ '<div>'
											+ '<textarea id="communityReplyContentAt' + value.communityNo + '" name="communityContent" placeholder="댓글을 입력해주세요">'
											+ '</textarea>'
											+ '<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="확인">'
											+ 	'</div>'
											+ '</form>'
											+ "</div>"
											+ "</div>";
											
											$("#communityReplyList").append(result2);
											// console.log("parentCommunityNoEach : " +parentCommunityNoEach2+ " - childCommunityReReply : " + childCommunityReReply);
											// console.log("출력 시점 - communityNo:" + value.communityNo);
									}
								});
							}
											
					}); 
				}// else end			
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});

}

// url 복사 함수
function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}