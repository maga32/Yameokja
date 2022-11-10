$(document).on("click", "#submit", function() {
	var imgdata = $("iframe").contents().find("body img").attr("data-cke-saved-src");

	if($("#postTitle").val().length < 5){
		alert("제목은 5자이상 입력해주세요.");
		return false;	
	}

	if(imgdata == null){
		alert("이미지를 한 개 이상 첨부해주시기 바랍니다");
		return false;
	}

});