$(function() {	

	$("#translateAddress2").on("click", function(){
		alert($("#address").val());
		
		$("#mapArea").attr("style", "display : block;");
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng('37.4765337' , '126.965918'), 
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		geocoder.addressSearch($("#address").val(), function(result, status) {
			alert(status + result);
			if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				alert("위도 : " + result[0].y + " , 경도 : " + result[0].x);
				var latitude = result[0].y;
				var longitude = result[0].x; 
				
				$("#longitude").val(longitude);
				$("#latitude").val(latitude);
			}
			
			var markerPosition  = new kakao.maps.LatLng(latitude , longitude);
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			marker.setMap(map);
			
			// 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + $("#storeName").val() + '</div>'
	        });
	        infowindow.open(map, marker);
			
	        map.setCenter(coords);
		});	  
		
		$(window).load(function(){
			
		})

	});
});
$(function() {

	var detailCheck = $("#detailCheck").val();
	
	if(detailCheck == "true"){
		var latitude = $("#storeLongitude").val();
		var longitude= $("#storeLatitude").val();
		var storeName = $("#storeName").text();
		
		alert(latitude + ", " + longitude);
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(latitude , longitude), 
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var markerPosition  = new kakao.maps.LatLng(latitude , longitude);
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
		
		// 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + storeName + '</div>'
        });
        infowindow.open(map, marker);
		
        map.setCenter(coords);	  
	} 

// 가게 검색어 미입력시
	$("#storeSearchKeyword").click(function(){
	
		var type1 = $("#type1").val();
		
		var keyword = $("#keyword").val();
		
		if(type1 == "선택"){
			alert("지역을 선택해주세요");
			return false;
			
		} else if(keyword.length == 0){
			alert("검색어를 한 글자 이상 입력해주세요");
			return false;
		}
			
	});
	
	// 별점입력 시작-----------------------------------------
	$("#rate5").click(function(){
		$("#postStar").val("5");
	});
	$("#rate4").click(function(){
		$("#postStar").val("4");
	});
	$("#rate3").click(function(){
		$("#postStar").val("3");
	});
	$("#rate2").click(function(){
		$("#postStar").val("2");
	});
	$("#rate1").click(function(){
		$("#postStar").val("1");
	});

// 가게 정보 작성할 때 회원이 아닐 시
	$("#storeWriteForm").click(function() {

		var id = $("#memberId").val();

		if(id.length == null){
			alert("가게를 등록하려면 로그인이 필요합니다.");
			return false;
		}

	});
	
});

$(document).ready(function() {
	$("#storeDetailContentContent img").css("width","100%").css("height","auto");
	$("#storeDetailBestOneContent img").remove();
});