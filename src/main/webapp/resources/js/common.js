$(document).ready(function() {

	// 채팅시작 => <a href="" class="chatStart" data-targetId="상대방id">채팅하기</a>
	$(".chatStart").click(function() {
		var targetId = $(this).attr("data-targetId");
		window.open("/yameokja/chat/chatDetail?targetId="+targetId,"채팅","width=500, height=800");
	});

});

// 차단하기 => <a href="javascript:;" id="block-${ 상대방아이디 }" onclick="blockTarget('${ 상대방아이디 }')"> 내부내용은 마음대로지만 '차단' 이 들어가야함 </a>
function blockTarget(targetId){
	var params = "targetId=" + targetId;
	$("#block-" + targetId).attr("onclick", "unblockTarget('"+ targetId + "')");
	$("#block-" + targetId).html($("#block-" + targetId).html().replace("차단", "차단해제"));

	$.ajax({
		url: "/yameokja/memberBlock.ajax",
		type: "post",
		data: params,
		context: this,
		success: function(resData) {
			if(resData.result == 0) {
				alert("이미 차단된 아이디입니다.");
			} else if(resData.result == 1) {
				alert("차단되었습니다.");
			}
		},
		error: function(){
			console.log("error");
		}
	});
	
	return false;
}

// 차단해제 => <a href="javascript:;" id="block-${ 상대방아이디 }" onclick="unblockTarget('${ 상대방아이디 }')"> 내부내용은 마음대로지만 '차단해제' 가 들어가야함 </a>
function unblockTarget(targetId){
	var params = "targetId=" + targetId;
	$("#block-" + targetId).attr("onclick", "blockTarget('"+ targetId + "')");
	$("#block-" + targetId).html($("#block-" + targetId).html().replace("차단해제", "차단"));

	$.ajax({
		url: "/yameokja/memberUnblock.ajax",
		type: "post",
		data: params,
		context: this,
		success: function(resData) {
			if(resData.result == 0) {
				alert("이미 차단해제된 아이디입니다.");
			} else if(resData.result == 1) {
				alert("차단이 해제되었습니다.");
			}
		},
		error: function(){
			console.log("error");
		}
	});
	
	return false;
}