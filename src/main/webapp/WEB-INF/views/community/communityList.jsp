<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" 	href="resources/css/communityList.css" />
<script src="resources/js/community.js"></script>
<article>
	<div class="row">
		<div class="row col-12 py-2 pt-4">
			<div class="col-4">
				<div class="inlineBlock ${ categoryNo == 'all' ? 'categoryNoButtonOnClick':'categoryNoButton'}">
					<a href="communityList?categoryNo=all" class="py-1 px-3">전체</a>
				</div>
				<div class="inlineBlock ${ categoryNo == '101' ? 'categoryNoButtonOnClick':'categoryNoButton'}">
					<a href="communityList?categoryNo=101" class="py-1 px-3">수다</a>
				</div>
				<div class="inlineBlock ${ categoryNo == '102' ? 'categoryNoButtonOnClick':'categoryNoButton'}">
					<a href="communityList?categoryNo=102" class="py-1 px-3">모집</a>
				</div>
			</div>
			<div class="col-8">
				<form id="communitySearchForm" name="communitySearchForm"
					action="communityList?categoryNo=${ categoryNo }" method="post">
					<div class="row">
						<div class="col-2">
							<select class="form-select-sm rounded-pill"
								aria-label="form-select-sm" name="communitySearchType"
								id="communitySearchType">
								<option ${type == "전체" ? 'selected="selected"' : '' }>전체</option>
								<option ${type == "제목" ? 'selected="selected"' : ''}>제목</option>
								<option ${type == "닉네임" ? 'selected="selected"' : ''}>닉네임</option>
								<option ${type == "내용" ? 'selected="selected"' : ''}>내용</option>
							</select>
						</div>
						<div class="col-8">
							<c:if test='${ keyword == "null" }'>
								<input class="col-12 rounded-pill" type="text"
									aria-label=".form-control-sm example" placeholder="검색어를 입력해주세요"
									name="communitySearchKeyword" id="communitySearchKeyword">
							</c:if>
							<c:if test='${ keyword != "null"}'>
								<input class="col-12 rounded-pill inlineBlock" type="text"
									value="${ keyword }" aria-label=".form-control-sm example"
									placeholder="검색어를 입력해주세요" name="communitySearchKeyword"
									id="communitySearchKeyword">
							</c:if>
						</div>
						<div class="col-2">
							<input type="submit" class="col-12 btn btn-primary rounded-pill"
								name="communitySearch" id="communitySearch">
						</div>
					</div>
				</form>
			</div>
		</div>



		<!-- 동네글 시작지점 / 분류 전체 -->
		<div class="row">
			<c:if test="${ categoryNo == 'all' }">
				<c:forEach var="p" items="${coList}">
					<div class=" border border-2 rounded col-12 p-2 m-1">
						<div class="row">
							<c:if test="${ empty p.communityFile }">
								<div class="col-3">
									<img src="resources/IMG/LOGOtemporaryIMG.PNG"
										class="img-thumbnail rounded float-start" alt="...">
								</div>
							</c:if>
							<c:if test="${ not empty p.communityFile }">
								<div class="col-3">
									<img src="upload/community/${ p.communityFile }"
										class="img-thumbnail rounded float-start" alt="...">
								</div>
							</c:if>
							<div class="col-6">
								<div class="col-12 communityTitle">
									<h4 class="text-muted font-weight-bold" tabindex="0">
									<a href="communityDetail?communityNo=${ p.communityNo }">
										<c:if test="${ p.categoryNo == 101 }">[수다]</c:if>
										<c:if test="${ p.categoryNo == 202 }">[모집]</c:if> ${ p.communityTitle }(${ p.communityReplyCount })
									</a>
									</h4>
								</div>
								<div class="text-secondary" id="communityMemberNickname">${ p.memberId }</div>
								<div class="text-secondary" id="communityRegDate">${ p.communityRegDate }</div>
							</div>
							<div class="col-3">
								<div class="row  alignIitems height">
									<div class="col-6 d-flex-column">
										<div class="col-12">
											<i class="fa fa-eye" aria-hidden="true"></i>
										</div>
									</div>
									<div class="col-6 d-flex-column">
										<div class="col-12 communityReadCount">${ p.communityReadCount }</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<!-- 동네글 종료지점 / 분류 전체 -->


			<!-- 동네글 시작지점 / 분류 수다글 -->
			<c:if test="${ categoryNo == '101' }">
				<c:forEach var="p" items="${coList}">
					<div class=" border border-2 rounded col-12 p-2 m-1">
						<div class="row">
							<c:if test="${ empty p.communityFile }">
								<div class="col-3">
									<img src="resources/IMG/LOGOtemporaryIMG.PNG"
										class="img-thumbnail rounded float-start" alt="...">
								</div>
							</c:if>
							<c:if test="${ not empty p.communityFile }">
								<div class="col-3">
									<img src="upload/community/${ p.communityFile }"
										class="img-thumbnail rounded float-start" alt="...">
								</div>
							</c:if>
							<div class="col-6">
								<div class="col-12 communityTitle">
									<h4 class="text-muted font-weight-bold" tabindex="0">
									<a href="communityDetail?communityNo=${ p.communityNo }">
										<c:if test="${ p.categoryNo == 101 }">[수다]</c:if>
										<c:if test="${ p.categoryNo == 202 }">[모집]</c:if> ${ p.communityTitle }(${ p.communityReplyCount })
									</a>
									</h4>
								</div>
								<div class="text-secondary" id="communityMemberNickname">${ p.memberId }</div>
								<div class="text-secondary" id="communityRegDate">${ p.communityRegDate }</div>
							</div>
							<div class="col-3">
								<div class="row  alignIitems height">
									<div class="col-6 d-flex-column">
										<div class="col-12">
											<i class="fa fa-eye" aria-hidden="true"></i>
										</div>
									</div>
									<div class="col-6 d-flex-column">
										<div class="col-12 communityReadCount">${ p.communityReadCount }</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<!-- 동네글 종료지점 / 분류 수다글 -->


			<!-- 동네글 시작지점 / 분류 모집글 -->
			<c:if test="${ categoryNo == '102' }">
				<c:forEach var="p" items="${coList}">
					<div class=" border border-2 rounded col-12 p-2 m-1">
						<div class="row">
							<c:if test="${ empty p.communityFile }">
								<div class="col-3">
									<img src="resources/IMG/LOGOtemporaryIMG.PNG"
										class="img-thumbnail rounded float-start" alt="...">
								</div>
							</c:if>
							<c:if test="${ not empty p.communityFile }">
								<div class="col-3">
									<img src="upload/community/${ p.communityFile }"
										class="img-thumbnail rounded float-start" alt="...">
								</div>
							</c:if>
							<div class="col-6 ">
								<div class="col-12 communityTitle">
									<h4 class="text-muted font-weight-bold" tabindex="0">
									<a href="communityDetail?communityNo=${ p.communityNo }">
										<c:if test="${ p.categoryNo == 101 }">[수다]</c:if>
										<c:if test="${ p.categoryNo == 202 }">[모집]</c:if> ${ p.communityTitle }(${ p.communityReplyCount })
									</a>
									</h4>
								</div>
								<div class="text-secondary" id="communityMemberNickname">${ p.memberId }</div>
								<div class="text-secondary" id="communityRegDate">${ p.communityRegDate }</div>
							</div>
							<div class="col-3 col-2 col-3">
								<div class="row  alignIitems height">
									<div class="col-6 d-flex-column">
										<div class="col-12">
											<i class="fa fa-eye" aria-hidden="true"></i>
										</div>
									</div>
									<div class="col-6 d-flex-column">
										<div class="col-12 communityReadCount">${ p.communityReadCount }</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<!-- 동네글 종료지점 / 분류 모집글 -->

			<!-- 동네글 검색결과 empty -->
			<c:if test="${ empty coList}">
				<div class=" border border-2 rounded col-12 p-2 col-md-12">등록된 게시글이 없습니다.</div>
			</c:if>
			<!-- 동네글 검색결과 empty -->

			<div class="row">
			<div class="col-12 py-3">
				<div class="inlineBlock whiteFormButton"><a href="community101WriteForm" class="py-1 px-3">수다글 쓰기</a></div>
				<div class="inlineBlock whiteFormButton"><a href="community102WriteForm" class="py-1 px-3">모집글 쓰기</a></div>
			</div>
			</div>

			<!-- 페이징 시작지점 -->
			<div class="row text-end">
			<div class="col-12 pe-4">
				<c:if test="${listCount > 0 }">
						<c:if test="${ startPage > '10' }">
							<div class="previousPage inlineBlock">
								<a href="communityList?categoryNo=${ categoryNo }&pageNum=${startPage - pageGroup}&type=${type}&keyword=${keyword}"><</a>
							</div>
						</c:if>
						<div class="pageNumber inlineBlock">
						<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
							<c:if test="${ i == currentPage }">
								<div class=" inlineBlock" style="color: #F58500; font-weight: 600">&nbsp;${ i }&nbsp;</div>
							</c:if>
							<c:if test="${ i != currentPage }">
								<div class="inlineBlock">
									<a href="communityList?categoryNo=${ categoryNo }&pageNum=${i}&type=${type}&keyword=${keyword}">&nbsp;${ i }&nbsp;</a>
								</div>
							</c:if>
						</c:forEach>
						</div>
						<c:if test="${ endPage < pageCount }">
							<div class="nextPage inlineBlock">
								<a href="communityList?categoryNo=${ categoryNo }&pageNum=${startPage + pageGroup}&type=${type}&keyword=${keyword}">></a>
							</div>
						</c:if>
				</c:if>
			</div>
			<!-- 페이징 종료지점 -->



			<div class="col-12 bg-primary">가게 리스트 들어갈 곳</div>
		</div>
		</div>
	</div>
</article>