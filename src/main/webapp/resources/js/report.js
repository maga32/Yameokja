$(function() {	
	
	 $("#deleteButton").click(function(){
	 	var con = confirm("삭제하시겠습니까?");
	 	if(!con){
	 	return false;
	 	}else{
	 	return true;
	 	}
	 });
	 
});