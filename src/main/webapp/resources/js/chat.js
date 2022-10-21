$(document).ready(function() {

	$("#chatSendConfirm").click(function(){

		if($("#chatContent").val().length <= 0) {
			alert("1자 이상 입력해야합니다.");
			return false;
		}

		var params = $("#chatSend").serialize();
		$.ajax({
			url: "chatSend.ajax",
			type: "post",
			data: params,
			success: function(resData) {
				if(resData.result == -1) {
					alert("잘못된 접근입니다.");
				} else if(resData.result == 0) {
					alert("본인의 채팅방만 접근할 수 있습니다.");
				} else if(resData.result == 1) {
					$("#chattingFrame").attr("src", $("#chattingFrame").attr("src"));
					$("#chatContent").val("");
				}
			},
			error: function(){
				console.log("error");
			}
		});

		return false;
	});

});

function chatDelete(chatNo){
	var result = confirm('상대가 확인한 메세지는 나의 화면에서만 지워집니다.\n삭제하시겠습니까?');

	if(result){
		var params = "chatNo=" + chatNo;
		$.ajax({
			url: "chatDelete.ajax",
			type: "post",
			data: params,
			success: function(resData) {
				if(resData.result == 0) {
					alert("본인의 채팅만 삭제할 수 있습니다.");
				} else if(resData.result == 1) {
					$("#chattingFrame", window.parent.document).attr("src", $("#chattingFrame", window.parent.document).attr("src"));
				}
			},
			error: function(){
				console.log("error");
			}
		});
	}
}

function chatLeave(chatIds){
	var result = confirm('채팅방에서 나가시겠습니까?');

	if(result) location.replace("chatLeave?chatIds=" + chatIds);
}