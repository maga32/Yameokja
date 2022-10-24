$(document).ready(function() {

	$("#openAdminMenu").click(function(){
		$(".defaultClosed").css("display","block");
		$(".defaultOpened").css("display","none");
	});

	$("#closeAdminMenu").click(function(){
		$(".defaultClosed").css("display","none");
		$(".defaultOpened").css("display","block");
	});
});

function categoryDelete(categoryNo, type){
	var result = confirm('카테고리에 연결된 내용이 있는경우 오류가 발생할 수 있습니다.\n삭제하시겠습니까?');

	if(result){
		location.href="deleteCategory?categoryNo=" + categoryNo + "&type=" + type;
	}
}