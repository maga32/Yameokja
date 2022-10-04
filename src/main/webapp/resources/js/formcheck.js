$(function() {	

	 $("#loginForm").submit(function(e){
	 	//e.preventDefault();
	 	if($("#mbId").val().length <= 0) {
			alert("아이디가 입력되지 않았습니다.");
			$("#mbId").focus();			
			return false;
		}	
	/*	else if($("#mbId").val() != "memberId01") {
			alert("아이디가 memberId01가 아닙니다.");
			$("#mbId").focus();			
			return false;
		}		 */
	 });
});