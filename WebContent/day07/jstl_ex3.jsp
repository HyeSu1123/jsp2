<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl로 화면 출력</title>
</head>
<body>
	<h3>회원 리스트</h3>
	<!-- ${list}는 getAttribute 메소드 실행과 동일합니다. list 자료구조의 항목을 하나씩 가져와서 member 이름으로 저장 -->
	<c:forEach var="member" items="${list }" varStatus="status">
		<ul>
			<li>${member.custNo}(${status.index}) : ${member.custName }:${member.phone }:${member.address}</li>
		</ul>
	</c:forEach>
</body>
</html>