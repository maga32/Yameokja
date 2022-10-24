<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<article>
<div class="container-fluid">
	
        <div class="row">
        
            <div class="col-lg-3 col-md-2 col-sm-1 d-none d-sm-block">좌 여백
            </div>
            
	            <div class="col-lg-6 col-md-8 col-sm-10 col-12">
	            
	            	<div class="row">
	            		
	            		<div class="col-12 bg-warning py-2">헤더</div>
	            		
	            		<div class="col-12 border-bottom border-4">
	            			<h1 class="text-start fw-bold text-secondary my-2">가게 등록</h1>
	            			<p class="text-end mb-n2 text-secondary">
	            				<span class="text-danger fw-bolder fs-5"> * </span>표시는 필수 입력사항</p>
	            		</div>
	            		
	            		<div class="col-12 mt-5">
	            		
	            			<div class=" row d-flex justify-content-center">
	            				<div class="col-12"><h3 class="text-start">가게 이름</h3></div>
	            			<div class="row mb-4">
	            				<div class="col-9">
		            				<input class="col-12 form-control-sm" type="text" aria-label=".form-control-sm example"></div>
		            				<div class="col-3"><button class="col-12">중복 확인</button>
		            				</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">전화번호</h3></div>
	            				<div class="row mb-4">
		            				<div class="col-3">
			            				<input class="col-12 form-control-sm" type="text" aria-label=".form-control-sm example">
			            			</div>
			            			<div class="col-1 text-center fs-5">
			            			-
			            			</div>
			            			<div class="col-3">
			            				<input class="col-12 form-control-sm" type="text" aria-label=".form-control-sm example">
			            			</div>
			            			<div class="col-1 text-center fs-5">
			            			-
			            			</div>
			            			<div class="col-3">
			            				<input class="col-12 form-control-sm" type="text" aria-label=".form-control-sm example">
			            			</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">주소</h3></div>
	            			<div class="row mb-4">
	            				<div class="col-9">
		            				<input class="col-12 form-control-sm mb-1" type="text" aria-label=".form-control-sm example"></div>
		            				<div class="col-3"><button class="col-12">주소 확인</button>
		            				</div>
		            				<div class="col-9">
		            				<input class="col-12 form-control-sm" type="text" aria-label=".form-control-sm example"></div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">맛집 종류</h3></div>
	            			<div class="row mb-4">
		            			<div class="row mb-2">
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">한식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">양식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">중식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">일식</label>
		            				</div>
		            			</div>
		            			
		            			<div class="row mb-2">
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">한식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">양식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">중식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">일식</label>
		            				</div>
		            			</div>
		            			
		            			<div class="row mb-2">
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">한식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">양식</label>
		            				</div>
		            				<div class="col-3">
			            				<input class="form-check-input" type="radio" name="foodCheck">
			            					<label class="form-check-label" for="foodCheck">중식</label>
		            				</div>

		            			</div>
		            			
	            			</div>
	            				
	            				<div class="col-12"><h3 class="text-start">대표 사진</h3></div>
	            				<div class="row mb-4">
		            				<div class="col-12">
										  <input class="form-control" type="file" id="formFile">
									</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">메뉴판 사진</h3></div>
	            				<div class="row mb-4">
		            				<div class="col-12">
										  <input class="form-control" type="file" id="formFile">
									</div>
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">영업 시간</h3></div>
	            				<div class="row mb-4">
	            					<div class="col-6 border border-2">
	            						<div class="col-12 border border-1 my-2">여는 시간</div>
	            					</div>
	            					<div class="col-6 border border-2">
	            						<div class="col-12 border border-1 my-2">닫는 시간</div>
	            					</div>
		            				
	            				</div>
	            				
	            				<div class="col-12"><h3 class="text-start">휴무일</h3></div>
	            					<div class="row mb-4">
		            					<input class="col-12 form-control-sm" type="text" aria-label=".form-control-sm example">
	            					</div>
	            				
	            				<div class="col-12"><h3 class="text-start">주차가능 유무</h3></div>
	            						<div class="row mb-4">
		            					<input class="col-12 form-control-sm" type="text" aria-label=".form-control-sm example">
	            					</div>
	            				
	            				
	            			
	            			</div>
	            			
	            			<div class="row border-top border-4 d-flex justify-content-end">
	            				<div class="row mt-4">
	            				<div class="col-3"></div>
	            				<div class="col-3"></div>
	            				<div class="col-3 text-center fs-6">
	            					<button type="" class="col-12 p-2 fw-bold rounded">취소</button>
	            				</div>
	            				<div class="col-3 text-center fs-6">
	            					<button type="submit" class="col-12 p-2 fw-bold rounded">작성완료</button>
	            				</div>
							</div>
	            			</div>
	            		</div>
	            		
	            		
	            		
	            		
	            	</div>
	            	
	            </div>
	            
          
            
            
            
            <div class="col-lg-3 col-md-2 col-sm-1 d-none d-sm-block">우 여백
            </div>
            
            
            
        </div>
        
    </div>
</article>
</html>
