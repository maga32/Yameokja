<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<article>
<form name="mainForm" id="mainForm" 
	method="get" action="myPagePost">
<table>
	<tr>
		<td>
			<h2>Main Page</h2>
			<input type="text" name="memberId" id="memberId"/>
			<input type="hidden" name="pageNum" id="pageNum"/>
			<input type="submit" value="로그인" id="btnJoin" />
		</td>
		<td>
			<a href="myPageCommunity">커뮤니티 바로가기</a>
		</td>
	</tr>
</table>
</form>
</article>



