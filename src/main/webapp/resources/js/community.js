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
		
		
		/*
		var communityNo = $("#communityNo").val()
		
		
		
		alert($("#communityContent").val().length);
		
		
		if(($("#communityContent").val().length <= 1) && ($("#communityReplyContent").val().length <= 1)) {
			alert("댓글은 한 글자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		*/
		
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
		var targetNickname = target[1];
		// 클릭한 버튼의 타겟번호가 포함된 답글 폼을 id 기준으로 찾아 숨김 or 보임 처리
		var status = $("div[id=communityReReplyWriteFormNo" + targetNo+ "]").attr("style");
		var communityParent = $("#communityReReplyParentNoAt" + targetNo).val();
		// alert(communityParent);
		
		// alert(target+ " - " + targetNo + " - " + targetNickname + " - " + communityParent);
		// alert("답글을 달아주세요!" + targetNo + status);
		if( status == "display : none"){
			$("div[id=communityReReplyWriteFormNo" + targetNo+ "]").attr("style", "display : block");
			$("#communityReReplyAt" + targetNo).val(targetNo);
			$("#communityReplyTargetAt" + targetNo).val(targetNickname);
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
		var targetNickname = target[1];
		var targetContentNo =""; 
		var str = "";

		// 배열의 길이가 3이라는 것은, 답글임을 의미한다.
		if(target.length > 2){
			var targetContentNo = target[2];
			// alert("답글이며, 답글의 댓글번호 : " + targetContentNo);
			var content = $("div[id=communityReplyContentResultAt" +targetContentNo+ "]").text();
			str = '<input type="hidden" name="communityNo" value="' + targetContentNo + '">'
		}else{
			var content = $("div[id=communityReplyContentResultAt" +targetNo+ "]").text();
			str = '<input type="hidden" name="communityNo" value="' + targetNo + '">'
		}
		
		$("form[class=communityReReplyWriteFormNo" + targetNo+ "]").append(str);
		
		var status = $("div[id=communityReReplyWriteFormNo" + targetNo+ "]").attr("style");
		
		// alert(target+ " - " + targetNo + " - " + targetNickname + " - " + content);
		// alert("답글을 수정해주세요!" + targetNo + status);
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

	// alert(d)

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
						
						var sessionMemberId = $("#memberId").val();
						var id = $("#communityParentNo").val();
						var communityReReplyZeroCheck = value.communityReReply;
						let parentCommunityNo = value.communityNo;
						
						// 날짜 출력형식 지정
						var regDate = new Date(value.communityRegDate);
						regDate = "(" + regDate.getFullYear() + "-" + (regDate.getMonth()+1) + "-" + regDate.getDate() + " " + regDate.getHours() + ":" + regDate.getMinutes() + ":" + regDate.getSeconds() + ")";
						
						if(communityReReplyZeroCheck == 0){
						
							var result1 = 
								"<div class='row border-bottom pt-1'>"				
								+ "<div class='col-2 my-auto text-center'>"				
								+ "<img class='rounded-circle userImg' alt='" + value.memberNickname + "' src=\"resources/IMG/member/" + value.memberPhoto + "\"	onclick='window.open(\"userProfile?userId='" +value.memberId + " ',\"LoginForm\",\"width=500, height=600\")'/>"
								+ "	<br><span style=\"font-size: 10px;\"> " + value.memberNickname + "</span>"
								+ "</div>"
								
								+ '<div class="col-8 my-2">'
								// 댓글 하위 데이터 / 댓글 삭제, 답글
								+ '<div class="fw-bold">'
								+ regDate
								+ '</div>'
								+ '<div class="replyContent" id="communityReplyContentResultAt' + value.communityNo + '">' + value.communityContent
								+ '</div>'
								+ '</div>'
								
								+ '<div class="col-2 border-start text-center">'
								+ '<button class="btnCommunityReReplyWriteFormOpen btnReply" value="' + value.communityNo + ','+ value.memberNickname + '">답글</button><br>'
								
							if( value.categoryNo == -1 || value.memberId != sessionMemberId){
								var result2 = "";
							}else{
								var result2 = 
								'<button class="btnCommunityReReplyUpdateFormOpen btnReply" value="' + value.communityNo + ',' + value.memberNickname + '">수정</button><br>'
								+ '<form id="communityReplyDeleteForm" name="communityReplyDeleteForm">'
								+ '<input type="hidden" name="replyCommunityParentNo" value="'+id+'">'
								+ '<input type="hidden" name="replyCommunityNo" value="'+value.communityNo+'">'
								+ '<button class="replyDelete btnReply">삭제</button>'
								+ '</form>';					
							}							
					
							var result3 = 
								'<button class="reportButton btnReply" onclick=\'window.open("reportForm?categoryNo=' + value.categoryNo + '&communityNo=' + value.communityNo + '&reportTarget=' + value.memberId + ' ","reportForm","width=500, height=600")\'>신고</button>'
								+ '</div>'
								+ '<div class="my-1" id="communityReReplyWriteFormNo' + value.communityNo + '" style="display : none">'
								+ '<form class="communityReReplyWriteFormNo' + value.communityNo + '" id="communityReplyWriteForm" name="communityReplyWriteForm" >'
								+ '	<input type="hidden" name="communityParentNo" id="communityParentNoAt' + value.communityNo + '" value="' + value.communityParentNo + '">'
								+ '	<input type="hidden" name="communityReReply" id="communityReReplyAt' + value.communityNo + '" value=0>'
								+ '	<input type="hidden" name="communityReplyTarget" id="communityReplyTargetAt' + value.communityNo + '"	 value="">'
								+ '	<input type="hidden" name="communityReReplyParentNo" id="communityReReplyParentNoAt' + value.communityNo + '"	value="' + value.communityReReply + '">'
								// + '	<input type="hidden" name="communityReplyUpdateNo" value="' + value.communityNo + '">'
								+ '	<input type="hidden" name="communityNo2" id="communityNo' + value.communityNo + '" value="">'
								+ '<div class="row">'
								+ '<textarea class="col-10 p-1" id="communityReplyContentAt' + value.communityNo + '" name="communityContent" placeholder="댓글을 입력해주세요">'
								+ '</textarea>'
								+ '<div class="col-2">'
								+ '<input type="submit" id="communityReplySubmit" name="communityReplySubmit" value="확인">'
								+ 	'</div>'
								+ 	'</div>'
								+ '</form>'
								+ '</div>';
								
								
								var str = result1 + result2 + result3;
								$("#communityReplyList").append(str);		
								
								$.each(resultData, function(index, value){
								
									// 날짜 출력형식 지정2
									var regDate2 = new Date(value.communityRegDate);
									regDate2= "(" + regDate2.getFullYear() + "-" + (regDate2.getMonth()+1) + "-" + regDate2.getDate() + " " + regDate2.getHours() + ":" + regDate2.getMinutes() + ":" + regDate2.getSeconds() + ")";
						
									
									// 반복되는 parentCommunityNo = 0 초기화 해결 - 값 유지하기
									if(parentCommunityNo != 0) {
										var parentCommunityNoEach2 = parentCommunityNo;
									}
	
									var childCommunityReReply = value.communityReReply;
									var result4 = "";
									//console.log("parentCommunityNoEach2 : " +parentCommunityNoEach2+ " - childCommunityReReply : " + childCommunityReReply);
									
									// ex) 355번호 글 = 새로운 for문 안의 reReply가 355일 때
									if(parentCommunityNoEach2 == childCommunityReReply){
										var result4 =
											'<div class="row border-bottom">' 
											+'<div class="col-1 d-flex align-items-center d-flex justify-content-end pe-2">'
											+ '<div class="fs-3">↳'
											+ '</div>'
											+ '</div>'
											
											+ '<div class="col-2 pt-1  text-center reReply">'
											+ '<div class="col-12 align-self-center">'
											+ "<img class='rounded-circle userImg' alt='" + value.memberNickname + "' src=\"resources/IMG/member/" + value.memberPhoto + "\"	onclick='window.open(\"userProfile?userId='" +value.memberId + " ',\"LoginForm\",\"width=500, height=600\")'/>"
											+ "	<br><span style=\"font-size: 10px;\"> " + value.memberNickname + "</span>"
											+ '</div>'
											+ '</div>'	

											+ '<div class="col-7 py-2 reReply">'
											+ '<div class="col-12 my-auto">'						
											+ '<div class="fw-bold">'
											+ regDate2
											+ '</div> <span class="text-primary">@' + value.communityReplyTarget + '</span>&nbsp;'
											+ '<div class="inlineBlock replyContent" id="communityReplyContentResultAt' + value.communityNo + '">' + value.communityContent
											+ '</div>'
											+ '</div>'
											+ '</div>'
											
											+ '<div class="col-2 border-start text-center reReply">'
											
											+ '<button class="btnCommunityReReplyWriteFormOpen btnReReply" value="' + parentCommunityNoEach2 + ',' + value.memberNickname + '">답글</button><br>'
											+ '<input type="hidden" id="communityReReplyParentNoAt' + value.communityNo + '" value="' + value.communityReReply + '">';
											
										if( value.categoryNo == -1 || value.memberId != sessionMemberId){
											var result5 = "";
										}else{
											var result5 = 
											'<button class="btnCommunityReReplyUpdateFormOpen btnReply" value="' + parentCommunityNoEach2 + ',' + value.memberNickname + ',' + value.communityNo + '">수정</button><br>'
											+ '<form id="communityReplyDeleteForm" name="communityReplyDeleteForm">'
											+ '	<input type="hidden" name="replyCommunityParentNo" value="'+id+'">'
											+ '	<input type="hidden" name="replyCommunityNo" value="'+value.communityNo+'">'
											+ '	<button class="replyDelete btnReply">삭제</button>'
											+ '</form>';					
										}				
											
											var result6 =
											'<button class="reportButton btnReply" onclick=\'window.open("reportForm?categoryNo=' + value.categoryNo + '&communityNo=' + value.communityNo + '&reportTarget=' + value.memberId + ' ","reportForm","width=500, height=600")\'>신고</button>'	
											+ "</div>";
											
											var str2 = result4 + result5 + result6;
											$("#communityReplyList").append(str2);
											// console.log("parentCommunityNoEach : " +parentCommunityNoEach2+ " - childCommunityReReply : " + childCommunityReReply);
											// console.log("출력 시점 - communityNo:" + value.communityNo);
									}
								});
							}
							// 답글이 없을 경우 div 닫기
											
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