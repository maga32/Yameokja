<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="/yameokja/resources/css/admin.css" />
<script src="/yameokja/resources/js/admin.js"></script>

<!--  우측윙 오픈버튼 -->
<div id="rWingButton">
    <ul id="rWingNav">
        <li>
            <a href="javascript:;" class="work-side-box-item-trigger-demos">
                <p class="navButton">
                    <i class="fa fa-cog" aria-hidden="true"></i>
                    <span class="button_title">관리자 메뉴</span>
                </p>
            </a>
        </li>
    </ul>
</div>

<!-- 우측윙 -->
<div id="rWing" class="bg-light" style="max-width: 330px; z-index: 500; transition: all 0.3s ease-in-out 0s;">
	<a href="adminMember"><div class="p-4 bg-warning"><h3>관리자모드</h3></div></a>
	<a href="adminMember"><div class="rWingLink p-3">회원관리</div></a>
   	<a href="adminCategory"><div class="rWingLink p-3">카테고리 관리</div></a>
   	<a href="/yameokja/report"><div class="rWingLink p-3">신고글 관리</div></a>
</div>
<div id="rWingMask" style="display: none;"></div>

