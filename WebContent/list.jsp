
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%-- <%@ page import="com.javaex.vo.GuestbookVo" %>
<%@ page import="java.util.List" %>
<%
	List<GuestbookVo> list=(List<GuestbookVo>)request.getAttribute("list");
	//						형변환해줌			리스트에 리퉤스트내에 set한거 get할꺼야
%> --%>

<!-- 보내기 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>			<!-- 리스트에서 -->
	<form action="/guestbook2/book" method="post">
		<table border=1 width=500>
			<tr>
				<td>이름</td><td><input type="text" name="name"></td>
				<td>비밀번호</td><td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
			<input type="text" name="a" value="add">
						<!-- a를 널어줘야지		add역할 -->
		</table>
	</form>
	<br/>

<c:forEach items="${list }" var="vo">

<table width="510" border="1">
			<tr>
				<td>${vo.no}</td>
				<td>${vo.name }</td>
				<td>${vo.regDate }</td>
				<td><a href="deleteform.jsp?no=${vo.no}">삭제</a></td>
			</tr>               <!-- 삭제누르면 해당 번호가 삭제되야하고 그 번호 페이지로 연결되야지 -->
			<tr>
				<td colspan=4>안녕하세요~<br/>${vo.content }</td>
															
			</tr>
		</table>
        <br/>

</c:forEach>

<%-- <%
	for(GuestbookVo vo:list){
		//insert  리스트에서 하나씩 돌아 dao에 getlist씀
%>
		<table width="510" border="1">
			<tr>
				<td><%=vo.getNo() %></td>
				<td><%=vo.getName() %></td>
				<td><%=vo.getRegDate() %></td>
				<td><a href="deleteform.jsp?no=<%=vo.getNo() %>">삭제</a></td>
			</tr>               <!-- 삭제누르면 해당 번호가 삭제되야하고 그 번호 페이지로 연결되야지 -->
			<tr>
				<td colspan=4>안녕하세요~<br/><%=vo.getContent().replace("\n", "<br>") %></td>
															<!-- br/라고 넣으면 /를 특수문자로 인식 -->
			</tr>
		</table>
        <br/>
<%
	}
%> --%>



</body>
</html>