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

