$(function() {	
	
	 $("#mainForm").submit(function(e){
	 	//e.preventDefault();
	 	if($("#memberId").val().length <= 0) {
			alert("아이디가 입력되지 않았습니다.");
			$("#memberId").focus();			
			return false;
		}	
	/*	else if($("#mbId").val() != "memberId01") {
			alert("아이디가 memberId01가 아닙니다.");
			$("#mbId").focus();			
			return false;
		}		 */
	 });
	 $("#deleteButton").click(function(){
	 	var con = confirm("삭제하시겠습니까?");
	 	if(!con){
	 	return false;
	 	}else{
	 	return true;
	 	}
	 });
});