$(function(){

	// 회원가입 필수 입력값 검사
	$("#memberJoinForm").on("submit", function(){
		
		var isIdCheck = $("#isIdCheck").val();
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
	
		if(isIdCheck == "false"){
			alert("아이디 중복확인을 해주세요");
			return false;
		}
		if(pass1.length == 0 || pass2.length == 0){
			alert("비밀번호를 입력해주세요");
			return false;
		}

		return joinFormCheck();
	});
	
	// 회원수정 필수 입력값 검사
	$("#memberUpdateForm").on("submit", function(){
	
		return joinFormCheck();
	});
	
	// 아이디 조건 확인
	$("#memberId").on("keyup", function() {		
		// 아래와 같이 정규표현식을 이용해 영문 대소문자, 숫자만 입력되었는지 체크할 수 있다. 
		var regExp = /[^A-Za-z0-9]/gi;	
		if(regExp.test($(this).val())) {
			alert("영문 대소문자, 숫자만 입력할 수 있습니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
	});
	
	// 아이디 중복확인
	$("#memberIdCheck").on("click", function() {
		
		var id = $("#memberId").val()
		url = "overlapIdCheck.mvc?memberId=" + id;
		
		if(id.length == 0) {
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if(id.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			return false;
		}
		
		window.open(url, "idCheck", "toolbar=no, location=no, " 
			+  "status=no, memubar=no, width=800, height=500");
	});
	
	// 아이디 중복확인 종료
	$("#btnIdCheckClose").on("click", function(){
		
		var id = $(this).attr("data-id-value");
		opener.document.memberJoinForm.memberId.value = id;
		opener.document.memberJoinForm.isIdCheck.value = true;
		window.close();
	});
	
		// 닉네임 중복확인
	$("#memberNicknameCheck").on("click", function() {
		
		var nickname = $("#memberNickname").val()
		var updateCheck = $("#updateCheck").val()
		url = "overlapNicknameCheck.mvc?memberNickname=" + nickname + "&updateCheck=" + updateCheck;
		
		if(nickname.length == 0) {
			alert("닉네임을 입력해주세요");
			return false;
		}
		if(nickname.length < 2) {
			alert("닉네임은 2자 이상 입력해주세요.");
			return false;
		}
		
		window.open(url, "nicknameCheck", "toolbar=no, location=no, " 
			+  "status=no, memubar=no, width=800, height=500");
	});
	
	// 닉네임 중복확인 종료
	$("#btnNicknameCheckClose").on("click", function(){
		
		var nickname = $(this).attr("data-id-value");
		var updateCheck = $("#updateCheck").val();
		
		if(updateCheck=="true"){
			opener.document.memberUpdateForm.memberNickname.value = nickname;
			opener.document.memberUpdateForm.isNicknameCheck.value = true;
		}else{
			opener.document.memberJoinForm.memberNickname.value = nickname;
			opener.document.memberJoinForm.isNicknameCheck.value = true;
		}
		window.close();
	});


	// 비밀번호 일치 확인1
	$("#pass1").on("change", function(){
		
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		
		if(pass1 != "" || pass2 != ""){
			if(pass1 == pass2){
				$("#memberPasswordWarning").text('비밀번호가 일치합니다');
			
			}else if(pass1 != pass2){
				$("#memberPasswordWarning").text('비밀번호가 일치하지 않습니다');
			}
		}else{$("#memberPasswordWarning").text('비밀번호를 입력해주세요');}
	});
	
	// 비밀번호 일치 확인2
	$("#pass2").on("change", function(){
		
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		
		if(pass1 != "" || pass2 != ""){
			if(pass1 == pass2){
				$("#memberPasswordWarning").text('비밀번호가 일치합니다');
			
			}else if(pass1 != pass2){
				$("#memberPasswordWarning").text('비밀번호가 일치하지 않습니다');
			}
		}
	});
	
	//도메인 규칙
	$("#domain").on("change", inputEmailDomainReplace)
	
	// 도메인 셀렉트박스
	$("#domainList").on("change", function(){
		
		var domainSelect = $(this).val();
		
		if(domainSelect == "직접 입력"){
			$("#domain").val("");
			$("#domain").prop("readonly", false);
		}
		else if(domainSelect == "naver.com"){
			$("#domain").val("naver.com");
			$("#domain").prop("readonly", true);
		}
		else if(domainSelect == "nate.com"){
			$("#domain").val("nate.com");
			$("#domain").prop("readonly", true);
		}
		else if(domainSelect == "google.co.kr"){
			$("#domain").val("google.co.kr");
			$("#domain").prop("readonly", true);
		}
		else if(domainSelect == "daum.net"){
			$("#domain").val("daum.net");
			$("#domain").prop("readonly", true);
		}
	});
	
	//선호음식 선택 규칙
	$("#memberJoinUpdateFormSubmit").on("click", function(){
		
		var foodCategories = "";
		var count = 0;
		$("input[name=foodCategory]:checked").each(function() {
			
			count += 1;
		
			if(foodCategories == ""){
				foodCategories = $(this).val();
			} else {
				foodCategories = foodCategories + "," + $(this).val();
			}
		});
		
		$('#memberFavoriteCategory').val(foodCategories);
		$('#memberFavoriteCategoryCount').val(count);
		
	});
});

	//셀렉트문 중첩 처리
function addressChange(e) {
	var seoul = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
	var kyeonggi = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
	var incheon = ["강화군", "계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "옹진군", "중구"];
	var daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
	var daegu = ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"];
	var busan = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"];
	var ulsan = ["남구", "동구", "북구", "울주군", "중구"];
	var gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	var gangwon = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];
	var sejong = ["세종"];
	var chungbuk = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청주시", "충주시"];
	var chungnam = ["계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "연기군", "에산군", "천안시", "청양군", "태안군", "홍성군"];
	var gyeongbuk = ["경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
	var gyeongnam = ["거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];
	var jeonbuk = ["고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];
	var jeonnam = ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
	var jeju = ["서귀포시", "제주시"];
	
	var target =  document.getElementById("address2");

	if(e.value == "seoul") var d = seoul;
	else if(e.value == "") var d = kyeonggi;
	else if(e.value == "대전") var d = daejeon;
	else if(e.value == "인천") var d = incheon;
	else if(e.value == "대구") var d = daegu;
	else if(e.value == "부산") var d = busan;
	else if(e.value == "울산") var d = ulsan;
	else if(e.value == "광주") var d = gwangju;
	else if(e.value == "강원") var d = gangwon;
	else if(e.value == "세종") var d = sejong;
	else if(e.value == "충북") var d = chungbuk;
	else if(e.value == "충남") var d = chungnam;
	else if(e.value == "경북") var d = gyeongbuk;
	else if(e.value == "경남") var d = gyeongnam;
	else if(e.value == "전북") var d = jeonbuk;
	else if(e.value == "전남") var d = jeonnam;
	else if(e.value == "제주") var d = jeju;
	
	target.options.length = 0;
	
	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
		}	
}

// 이메일 도메인 
function inputEmailDomainReplace() {
	var regExp = /[^a-z0-9\.]/gi;	
	if(regExp.test($(this).val())) {
		alert("이메일 도메인은 영문 소문자, 숫자, 점(.)만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}


// 회원가입, 수정 폼 체크
function joinFormCheck(){
	var name = $("#memberName").val();
	var id = $("#memberId").val();
	var nickname = $("#memberNickname").val();
	var isNicknameCheck = $("#isNicknameCheck").val();	
	var email = $("#email").val();
	var domain = $("#domain").val();
	var phone1 = $("#phone1").val();
	var phone2 = $("#phone2").val();
	var phone3 = $("#phone3").val();
	var address1 = $("#address1").val();
	var address2 = $("#address2").val();
	var memberFavoriteCategoryCount = $("#memberFavoriteCategoryCount").val();
	
	var oldPass = $("#oldPass").val();
	
	if(name.length == 0){
		alert("이름을 입력해주세요");
		return false;
	}
	if(id.length == 0){
		alert("아이디를 입력해주세요");
		return false;
	}
	if(nickname.length == 0){
		alert("닉네임을 입력해주세요");
		return false;
	}
	if(isNicknameCheck == "false"){
		alert("닉네임 중복확인을 해주세요");
		return false;
	}
	if(email.length == 0 || domain.length == 0){
		alert("이메일을 입력해주세요");
		return false;
	}
	if(phone2.length == 0 || phone3.length == 0){
		alert("전화번호를 입력해주세요");
		return false;
	}
	if(phone2.length == 0 || phone3.length == 0){
		alert("전화번호를 입력해주세요");
		return false;
	}
	if(address1 == "선택"){
		alert("세부 주소를 선택해주세요");
		return false;
	}
	if(memberFavoriteCategoryCount < 3){
		alert("선호 음식 종류를 3가지 이상 입력해주세요.");
		return false;
	}
	
}







