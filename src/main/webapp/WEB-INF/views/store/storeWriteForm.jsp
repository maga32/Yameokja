<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="resources/js/store.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<article>

<form name="storeWriteForm" action="storeWriteProcess" 
	id="storeWriteForm" method="POST" encType="multipart/form-data">

<div class="container-fluid">
	
        <div class="row">
            
	            <div class="col-lg-12 col-md-8 col-sm-10 col-12">
	            
	            	<div class="row">
	            		
	            		<div class="col-12 border-bottom border-4">
	            			<h1 class="text-start fw-bold text-secondary my-2">가게 등록</h1>
	            			<p class="text-end mb-n2 text-secondary">
	            				<span class="text-danger fw-bolder fs-5"> * </span>표시는 필수 입력사항</p>
	            		</div>
	            		
	            		<div class="col-12 mt-5">
	            		
	            			<div class=" row d-flex justify-content-center">
	            				<div class="col-12"><h3 class="text-start"><span class="text-danger fw-bolder"> * </span>가게 이름</h3></div>
	            			<div class="row mb-4">
	            				<div class="col-9">
		            				<input class="col-12 form-control" type="text" name="storeName" id="storeName"></div>
		            				<div class="col-3"><button class="btn btn-outline-warning col-12">중복 확인</button>
		            				</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start"><span class="text-danger fw-bolder"> * </span>전화번호</h3></div>
	            				<div class="row mb-4">
		            				<div class="col-3">
			            				<select class="col-12 form-control" name="phone1" id="phone1">
			            				<option>선택</option>
				            				<option value="02">서울 (02)</option>
											<option value="031">경기 (031)</option>
											<option value="032">인천 (032)</option>
											<option value="042">대전 (042)</option>
											<option value="053">대구 (053)</option>
											<option value="051">부산 (051)</option>
											<option value="052">울산 (052)</option>
											<option value="062">광주 (062)</option>
											<option value="033">강원 (033)</option>
											<option value="044">세종 (044)</option>
											<option value="043">충북 (043)</option>
											<option value="041">충남 (041)</option>
											<option value="054">경북 (054)</option>
											<option value="055">경남 (055)</option>
											<option value="063">전북 (063)</option>
											<option value="061">전남 (061)</option>
											<option value="064">제주 (064)</option>
											<option value="0507">안심번호 (0507)</option>
			            				</select>
			            			</div>
			            			<div class="col-1 text-center fs-5">
			            			-
			            			</div>
			            			<div class="col-3">
			            				<input class="col-12 form-control" type="text" name="phone2" id="phone2">
			            			</div>
			            			<div class="col-1 text-center fs-5">
			            			-
			            			</div>
			            			<div class="col-3">
			            				<input class="col-12 form-control" type="text" name="phone3" id="phone3">
			            			</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start"><span class="text-danger fw-bolder"> * </span>주소</h3></div>
	            			<div class="row mb-4">
	            			<div id="address"></div>
									<script>
									    function sample6_execDaumPostcode() {
									        new daum.Postcode({
									            oncomplete: function(data) {
									                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
									
									                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
									                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									                var addr = ''; // 주소 변수
									                var extraAddr = ''; // 참고항목 변수
									
									                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									                    addr = data.roadAddress;
									                } else { // 사용자가 지번 주소를 선택했을 경우(J)
									                    addr = data.jibunAddress;
									                }
									
									                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
									                if(data.userSelectedType === 'R'){
									                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
									                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
									                        extraAddr += data.bname;
									                    }
									                    // 건물명이 있고, 공동주택일 경우 추가한다.
									                    if(data.buildingName !== '' && data.apartment === 'Y'){
									                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
									                    }
									                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									                    if(extraAddr !== ''){
									                        extraAddr = ' (' + extraAddr + ')';
									                    }
									                    // 조합된 참고항목을 해당 필드에 넣는다.
									                    document.getElementById("sample6_extraAddress").value = extraAddr;
									                
									                } else {
									                    document.getElementById("sample6_extraAddress").value = '';
									                }
									
									                // 우편번호와 주소 정보를 해당 필드에 넣는다.
									                document.getElementById('sample6_postcode').value = data.zonecode;
									                document.getElementById("sample6_address").value = addr;
									                // 커서를 상세주소 필드로 이동한다.
									                document.getElementById("sample6_detailAddress").focus();
									            }
									        }).open();
									    }
									</script>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start"><span class="text-danger fw-bolder"> * </span>맛집 종류</h3></div>
	            				
	            			<div class="row mb-4">
		            			<div class="row mb-2">
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="1">
			            					<label class="form-check-label" for="categoryNo">한식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="2">
			            					<label class="form-check-label" for="categoryNo">양식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="3">
			            					<label class="form-check-label" for="categoryNo">중식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" id="4">
			            					<label class="form-check-label" for="categoryNo">일식</label>
		            				</div>
		            			</div>
		            			
		            			<div class="row mb-2">
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo"  id="5">
			            					<label class="form-check-label" for="categoryNo">아시안</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo"  id="6">
			            					<label class="form-check-label" for="categoryNo">술집</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo"  id="7">
			            					<label class="form-check-label" for="categoryNo">카페, 디저트</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo"  id="8">
			            					<label class="form-check-label" for="categoryNo">분식</label>
		            				</div>
		            			</div>
		            			
		            			<div class="row mb-2">
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" id="9">
			            					<label class="form-check-label" for="categoryNo">고기</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" id="10">
			            					<label class="form-check-label" for="categoryNo">채식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" id="11">
			            					<label class="form-check-label" for="categoryNo">패스트푸드</label>
		            				</div>
		            			</div>    			
	            			</div>
	            				
	            				<div class="col-12"><h3 class="text-start">대표 사진</h3></div>
	            				<div class="row mb-4">
		            				<div class="col-12">
										  <input class="form-control" type="file" name="fileMain" id="fileMain">
									</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">메뉴판 사진</h3></div>
	            				<div class="row mb-4">
		            				<div class="col-12">
										  <input class="form-control" type="file" name="fileMenu" id="fileMenu">
									</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start"><span class="text-danger fw-bolder"> * </span>영업 시간</h3></div>
	            				<div class="row mb-4">
	            					<div class="col-12 my-2">
	            						<textarea type="text" class="form-control" name="storeTime"></textarea>
	            					</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">휴무일</h3></div>
	            					<div class="row mb-4">
		            					<input class="col-12 form-control" type="text">
	            					</div>
	            				
	            				<div class="col-12"><h3 class="text-start">주차가능 유무</h3></div>
	            						<div class="row mb-4">
		            					<input class="col-12 form-control" type="text">
	            					</div>	
	            			
	            			</div>
	            			
	            			<div class="row border-top border-4 d-flex justify-content-end my-5">
	            				<div class="row mt-4">
	            				<div class="col-3"></div>
	            				<div class="col-3"></div>
	            				<div class="col-3 text-center fs-6">
	            					<button type="reset" class="col-12 p-2 fw-bold btn btn-outline-secondary rounded">초기화</button>
	            				</div>
	            				<div class="col-3 text-center fs-6">
	            					<button class="col-12 p-2 fw-bold btn btn-outline-warning rounded" onclick="">등록
	            					</button>
	            				</div>
							</div>
	            			</div>
	            			
	            			
	            		</div>
	            		
	            		
	            		
	            		
	            	</div>
	            	
	            </div>
	          
        </div>
        
    </div>
  </form>
</article>

