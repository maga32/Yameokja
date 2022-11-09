$(document).ready(function() {

	// 회원정보 클릭 => <button class="btn memberInfo" data-memberId="${ 상대방아이디 }"> 상대방 닉네임 등 </button>
	$(".memberInfo").click(function() {
		$(".memberInfoView").remove();

		var memberId = $(this).attr("data-memberId");;
		var tmp = "";

		$.ajax({
			url: "/yameokja/memberInfo.ajax",
			type: "post",
			data: "targetId=" + memberId,
			context: this,
			success: function(resData) {
				tmp += "<button data-targetId='" + memberId + "' class='btn btn-secondary";

				// 차단여부 판별				
				if(resData.block) {
					tmp += " unblockTarget'>차단해제</button>";
				} else {
					tmp += " blockTarget'>차단</button>";
				}
				
				// 관리자권한 판별
				if(resData.memberLevel >= 7) {
					tmp += "<a href='/yameokja/admin/adminMember?searchBy=id&keyword=" + memberId + "' class='btn btn-warning'>회원정보변경</a>";
				}
			},
			error: function(){
				console.log("not logined");
			},
			complete: function(){
				var info = "<div class='memberInfoView' style='position: absolute;'>"
					+ "<div class='btn-group-vertical'>"
						+ "<button class='btn btn-secondary viewProfile' data-userId='" + memberId + "'>프로필보기</button>"
						+ "<button class='btn btn-secondary viewMyPage' data-userId='" + memberId + "'>활동내역</button>"
						+ "<button class='btn btn-secondary chatStart' data-targetId='" + memberId + "'>채팅하기</button>"
						+ tmp
					+ "</div>"
				+ "</div>";

				$(this).append(info);
			}
		});

	});

	// 회원정보 닫기
	$("html").click(function(e) {
		if(!$(e.target).hasClass("memberInfo")) $(".memberInfoView").remove();
	});


	// 윙버튼
	$("#wingButton").click(function() {
		$("#wing").addClass("open");
		$("#wingMask").fadeIn();
	});

	// 윙버튼 닫기
	$("#wingMask").click(function() {
		$("#wing").removeClass("open");
		$(this).css("display", "none");
	});
});


// 회원 드롭메뉴 관련 시작 ----------------------------------------------------------------------------------------------------------------

// 프로필 보기 => <button class="btn viewProfile" data-userId=${ 대상아이디 }">프로필보기</button>
$(document).on("click", ".viewProfile", function() {
	var userId = $(this).attr("data-userId");
	window.open("/yameokja/userProfile?userid="+ userId, "프로필", "width=500, height=800");
});

// 마이페이지 보기 => <button class="btn viewMyPage" data-userId=${ 대상아이디 }">활동내역</button>
$(document).on("click", ".viewMyPage", function() {
	var memberId = $(this).attr("data-userId");
	
	if(opener) {
		opener.location.href = "/yameokja/myPagePost?userId=" + memberId;
		window.close();
	} else {
		location.href = "/yameokja/myPagePost?userId=" + memberId;
	}
	
});

// 차단하기 => <button class="btn blockTarget" data-targetId="${ 상대방아이디 }"> 내부내용은 마음대로지만 '차단' 이 들어가야함 </button>
$(document).on("click", ".blockTarget", function() {
	var targetId = $(this).attr("data-targetId");
	$(this).addClass("unblockTarget").removeClass("blockTarget");
	$(this).html($(this).html().replace("차단", "차단해제"));

	$.ajax({
		url: "/yameokja/memberBlock.ajax",
		type: "post",
		data: "targetId=" + targetId,
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
	
});

// 차단해제 => <button class="btn unblockTarget" data-targetId="${ 상대방아이디 }"> 내부내용은 마음대로지만 '차단해제' 가 들어가야함 </button>
$(document).on("click", ".unblockTarget", function() {
	var targetId = $(this).attr("data-targetId");
	$(this).addClass("blockTarget").removeClass("unblockTarget");
	$(this).html($(this).html().replace("차단해제", "차단"));

	$.ajax({
		url: "/yameokja/memberUnblock.ajax",
		type: "post",
		data: "targetId=" + targetId,
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
});

// 채팅시작 => <a href="" class="chatStart" data-targetId="${ 상대방id }">채팅하기</a>
$(document).on("click", ".chatStart", function() {
	var targetId = $(this).attr("data-targetId");
	window.open("/yameokja/chat/chatDetail?targetId="+targetId,"채팅","width=500, height=800");
});

// 회원 드롭메뉴 관련 끝 ----------------------------------------------------------------------------------------------------------------

// wing 주소변경
$(document).on("click", "#memberChangeAddress", function() {
	var address = $("#address1").val() + "," + $("#address2").val();
	$.ajax({
		url: "/yameokja/memberChangeAddress.ajax",
		type: "post",
		data: "memberAddress=" + address,
		context: this,
		success: function(resData) {		
			if(resData) {
				alert("변경 완료");
				$("#myAddress").html("<i class='fa fa-map-marker' aria-hidden='true'></i>&nbsp;&nbsp;&nbsp;" + address);
			} else {
				alert("로그인이 필요합니다");
			}
		},
		error: function(){
			console.log("not logined");
		}
	});
});