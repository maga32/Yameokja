<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01190664c89b1c0d146ca3c6572faed2&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01190664c89b1c0d146ca3c6572faed2"></script>					
<script src="resources/js/store.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<article>

<form action="storeUpdateProcess" encType="multipart/form-data" method="POST">
	
	<input type="hidden" name="storeNo" value="${ store.storeNo }">
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
		            				<input class="col-12 form-control" type="text" name="storeName" id="storeName" value="${ store.storeName }"></div>
		            				<div class="col-3"><button class="btn btn-outline-warning col-12">중복 확인</button>
		            				</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start"><span class="text-danger fw-bolder"> * </span>전화번호</h3></div>
	            				<div class="row mb-4">
		            				<div class="col-3">
			            				<select class="col-12 form-control" name="phone1" id="phone1">
			            				<option>선택</option>
				            				<option value="02" ${ phone1 == '02' ? 'selected' : '' }>서울 (02)</option>
											<option value="031" ${ phone1 == '031' ? 'selected' : '' }>경기 (031)</option>
											<option value="032" ${ phone1 == '032' ? 'selected' : '' }>인천 (032)</option>
											<option value="042" ${ phone1 == '042' ? 'selected' : '' }>대전 (042)</option>
											<option value="053" ${ phone1 == '053' ? 'selected' : '' }>대구 (053)</option>
											<option value="051" ${ phone1 == '051' ? 'selected' : '' }>부산 (051)</option>
											<option value="052" ${ phone1 == '052' ? 'selected' : '' }>울산 (052)</option>
											<option value="062" ${ phone1 == '062' ? 'selected' : '' }>광주 (062)</option>
											<option value="033" ${ phone1 == '033' ? 'selected' : '' }>강원 (033)</option>
											<option value="044" ${ phone1 == '044' ? 'selected' : '' }>세종 (044)</option>
											<option value="043" ${ phone1 == '043' ? 'selected' : '' }>충북 (043)</option>
											<option value="041" ${ phone1 == '041' ? 'selected' : '' }>충남 (041)</option>
											<option value="054" ${ phone1 == '054' ? 'selected' : '' }>경북 (054)</option>
											<option value="055" ${ phone1 == '055' ? 'selected' : '' }>경남 (055)</option>
											<option value="063" ${ phone1 == '063' ? 'selected' : '' }>전북 (063)</option>
											<option value="061" ${ phone1 == '061' ? 'selected' : '' }>전남 (061)</option>
											<option value="064" ${ phone1 == '064' ? 'selected' : '' }>제주 (064)</option>
											<option value="0507" ${ phone1 == '0507' ? 'selected' : '' }>안심번호 (0507)</option>
			            				</select>
			            			</div>
			            			<div class="col-1 text-center fs-5">
			            			-
			            			</div>
			            			<div class="col-3">
			            				<input class="col-12 form-control" type="text" name="phone2" id="phone2" value="${ phone2 }">
			            			</div>
			            			<div class="col-1 text-center fs-5">
			            			-
			            			</div>
			            			<div class="col-3">
			            				<input class="col-12 form-control" type="text" name="phone3" id="phone3" value="${ phone3 }">
			            			</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start"><span class="text-danger fw-bolder"> * </span>주소</h3></div>
	            			<div class="row mb-4">
	            				<div class="col-9">
		            				<input class="col-12 form-control-sm mb-1" type="text" aria-label=".form-control-sm example" name="storeAddress" id="address"></div>
		            				<div class="col-3"><button type="button" class="col-12" id="translateAddress2">주소 확인</button>
		            				</div>
		            				<div class="col-9">
		            					<div class="col-2">* 위도</div>	
		            					<input type="text" class="col-4 inlineBlock" name="storeLatitude" id="storeLatitude" readonly value="${store.storeLongitude}">
		            					<div class="col-2">* 경도</div>	
		            					<input type="text" class="col-4 inlineBlock" name="storeLongitude" id="storeLongitude" readonly value="${store.storeLatitude}">
	            				</div>
	            				<div class="row justify-content-center p-4" style="display:none;" id="mapArea">
	            					<div class="mx-2 border" id="map" style="height:300px;"></div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start"><span class="text-danger fw-bolder"> * </span>맛집 종류</h3></div>
	            				
	            			<div class="row mb-4">
		            			<div class="row mb-2">
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="1" ${ store.categoryNo == '1' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">한식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="2" ${ store.categoryNo == '2' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">양식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="3" ${ store.categoryNo == '3' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">중식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="4" ${ store.categoryNo == '4' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">일식</label>
		            				</div>
		            			</div>
		            			
		            			<div class="row mb-2">
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo"  value="5" ${ store.categoryNo == '5' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">아시안</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo"  value="6" ${ store.categoryNo == '6' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">술집</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo"  value="7" ${ store.categoryNo == '7' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">카페, 디저트</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo"  value="8" ${ store.categoryNo == '8' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">분식</label>
		            				</div>
		            			</div>
		            			
		            			<div class="row mb-2">
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="9" ${ store.categoryNo == '9' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">고기</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="10" ${ store.categoryNo == '10' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">채식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="categoryNo" value="11" ${ store.categoryNo == '11' ? 'checked' : '' }>
			            					<label class="form-check-label" for="categoryNo">패스트푸드</label>
		            				</div>
		            			</div>
		            		</div>

	            				
	            				<div class="col-12"><h3 class="text-start">대표 사진</h3></div>
	            				<div class="row mb-4">
		            				<div class="col-12">
										  <input class="form-control" type="file" name="fileMain" id="fileMain" value="${ store.storeFileMain }">
									</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">메뉴판 사진</h3></div>
	            				<div class="row mb-4">
		            				<div class="col-12">
										  <input class="form-control" type="file" name="fileMenu" id="fileMenu" value="${ store.storeFileMenu }">
									</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start"><span class="text-danger fw-bolder"> * </span>영업 시간</h3></div>
	            				<div class="row mb-4">
	            					<div class="col-12 my-2">
	            						<textarea type="text" class="form-control" name="storeTime">${ store.storeTime }</textarea>
	            					</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">휴무일</h3></div>
	            					<div class="row mb-4">
		            					<input class="col-12 form-control" type="text" name="storeDayOff" value="${store.storeDayOff }">
	            					</div>
	            				
	            				<div class="col-12"><h3 class="text-start">주차가능 유무</h3></div>
	            					<div class="row mb-4">
		            					<input class="col-12 form-control" type="text" name="storeParking" value="${store.storeParking }">
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

