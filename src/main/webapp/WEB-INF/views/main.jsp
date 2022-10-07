<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<article>
<form name="loginForm" id="loginForm" 
	method="get" action="myPostList">
<table>
	<tr>
		<td>
			<h2>Main Page</h2>
			<input type="text" name="mbId" id="mbId"/>
			<input type="submit" value="로그인" id="btnJoin" />
		</td>
	</tr>
</table>
</form>
</article>



