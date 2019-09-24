<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp"/>
		<div id="content">
			<div id="board">
				<form id="search_form" action="${pageContext.servletContext.contextPath }/board" method="post">
					<input type="text" id="kwd" name="kwd" value="">
					<input type="submit" value="찾기">
				</form>
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>	
					<c:forEach items ='${list }' var='vo' >			
					<tr>				
						<td>${vo.no}</td>
						<%-- <td style='padding-left:${50*vo.depth}px'><img src = "${pageContext.servletContext.contextPath}/assets/images/reply.png"/><a href="${pageContext.servletContext.contextPath }/board?">${vo.no}</a></td> --%>
						<td><a href="${pageContext.servletContext.contextPath }/board?a=view&no=${vo.no}&userNo=${vo.userNo}">${vo.title}</a></td>
						<form  action="" method="post">
							<input type="hidden" id="title" name="title" value="${vo.title}">
							<input type="hidden" id="context" name="context" value="${vo.context}">
							<input type="hidden" id="no" name="no" value="${vo.no}">
							<input type="hidden" id="userNo" name="userNo" value="${vo.userNo}">
						</form>
						
						<td>${vo.name }</td>
						<td>${vo.hit}</td>
						<td>${vo.regDate}</td>
						<td><a href="${pageContext.servletContext.contextPath }/board?a=delete&no=${vo.no}" class="del">삭제</a></td>
					</tr>
					</c:forEach>
				</table>
				
				<!-- pager 추가 -->
				<div class="pager">
					<ul>
						<li><a href="">◀</a></li>
						<li><a href="">1</a></li>
						<li class="selected">2</li>
						<li><a href="">3</a></li>
						<li>4</li>
						<li>5</li>
						<li><a href="">▶</a></li>
					</ul>
				</div>					
				<!-- pager 추가 -->
				
				<div class="bottom">
				<c:choose>
					<c:when test="${empty authUser}">
					</c:when>
					<c:otherwise>
						<a href="${pageContext.servletContext.contextPath }/board?a=writeform" id="new-book">글쓰기</a>
					</c:otherwise>
				</c:choose>
					
				</div>				
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="board"/>
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp"/>
	</div>
</body>
