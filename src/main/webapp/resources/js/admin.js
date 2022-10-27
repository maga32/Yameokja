$(document).ready(function() {

	$("#openAdminMenu").click(function() {
		$(".defaultClosed").css("display","block");
		$(".defaultOpened").css("display","none");
	});

	$("#closeAdminMenu").click(function() {
		$(".defaultClosed").css("display","none");
		$(".defaultOpened").css("display","block");
	});
});

function categoryDelete(categoryNo, type) {
	var result = confirm('카테고리에 연결된 내용이 있는경우 오류가 발생할 수 있습니다.\n삭제하시겠습니까?');

	if(result){
		location.href="deleteCategory?categoryNo=" + categoryNo + "&type=" + type;
	}
}

function categoryUpdatePrepare(categoryNo) {
	$("#updateName_" + categoryNo).css("display","block");
	$("#categoryName_" + categoryNo).css("display","none");
	$("#updateOrder_" + categoryNo).css("display","block");
	$("#categoryOrder_" + categoryNo).css("display","none");
	$("#categoryUpdateCancel_" + categoryNo).css("display","block");
	$("#categoryUpdatePrepare_" + categoryNo).css("display","none");
}

function categoryUpdateCancel(categoryNo) {
	$("#updateName_" + categoryNo).css("display","none");
	$("#categoryName_" + categoryNo).css("display","block");
	$("#updateOrder_" + categoryNo).css("display","none");
	$("#categoryOrder_" + categoryNo).css("display","block");
	$("#categoryUpdateCancel_" + categoryNo).css("display","none");
	$("#categoryUpdatePrepare_" + categoryNo).css("display","block");
}

function updateCategoryName(categoryNo, type) {
	location.href="updateCategory?categoryNo=" + categoryNo + "&categoryName=" + $("#updateCategoryName_"+categoryNo).val() + "&categoryOrder=" + $("#updateCategoryOrder_"+categoryNo).val() + "&type=" + type;
}

function changeLevel(memberId, page, sort, order, searchBy, keyword) {
	location.href="updateMemberLevel?memberId=" + memberId + "&memberLevel=" + $("#" + memberId + "Level").val() + "&page=" + page + "&sort=" + sort + "&order=" + order + "&searchBy=" + searchBy + "&keyword=" + keyword;
}

function searchMember() {
	location.href="adminMember?searchBy=" + $("#searchBy").val() + "&keyword=" + $("#keyword").val();
}