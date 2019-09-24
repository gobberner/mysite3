<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp"/>
		<div id="content">
			<div id="guestbook">
				<form action="${pageContext.servletContext.contextPath }/guestbook" method="post">
					<input type="hidden" name="a" value="Add">
					<table>
						<tr>
							<td>이름</td><td><input type="text" name="writer"></td>
							<td>비밀번호</td><td><input type="password" name="passwd"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="contents" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<ul>
					<li>
						<table>
							<c:forEach items="${requestScope.list }" var="vo">
								<tr>
									<td>[${vo.no }]</td>
									<td>${vo.writer }</td>
									<td>${vo.contents }</td>
									<td><fmt:formatDate value="${vo.regDate }"/></td>
									<td><a href="${pageContext.servletContext.contextPath }/guestbook?a=DeleteForm&no=${vo.no }">삭제</a></td>
								</tr>
								<tr>
									<td colspan=4>${fn:replace(vo.contents, newLine, '<br/>')}</td>
								</tr>
							</c:forEach>
						</table>
						<br>
					</li>
				</ul>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp"/>
		<c:import url="/WEB-INF/views/includes/footer.jsp"/>
	</div>
</body>
</html>