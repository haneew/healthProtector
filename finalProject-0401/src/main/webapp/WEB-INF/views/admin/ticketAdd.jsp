<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ticketAdd</h1>
<form action="${cpath }/setting/ticketAdd" method="POST">
	<p><input type="text" name="tk_content" placeholder="이용권 이름"></p>
	<p><input type="number" name="tk_value" placeholder="이용권 횟수"></p>
	<p><input type="text" name="price" placeholder="이용권 가격"></p>
	<p><input type="submit" value="추가하기"></p>
</form>


<script type="text/javascript">
	const row = '${row}'
	if(row != 0){
		window.opener.parent.location.reload();
		window.close();
	}
</script>

</body>
</html>