<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <% String no=request.getParameter("no"); %>
	<!-- 번호를 불러주고 그걸 담아주고 --> --%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form method="post" action="/guestbook2/book">
	<input type='text' name="no" value="${param.no }">//vo.no없어
	<%-- <input type='text' name="no" value="<%=no%>"> --%>
		<!--hidden으로 숨겨줌 숫자보여주고 우리눈에 -->
	<input type="text" name="a" value="delete">
		<!-- 리스트에 리퉤스트에 담아진 a의 delete로 가 -->
	<table>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"></td>
			<td><input type="submit" value="등록"></td>
			<td><a href="/guestbook2/book">메인으로 돌아가기</a></td>
		</tr>
	</table>
	</form>
</body>
</html>