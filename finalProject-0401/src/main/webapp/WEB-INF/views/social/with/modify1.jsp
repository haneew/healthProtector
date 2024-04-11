<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"  %>


<div class="frame">
	<div class="dg-tkHome-banner">
      <img src="${cpath }/upload/mainImage/socialMain.png">
   </div>
	<form method="POST">
		<div class="enterbox wbox">
			<h1>수정하기</h1>
				<div class="box-left">
		<p><input type="text" name="title" placeholder="제목" value="${dto.title }" required autofocus></p>
		<p><input type="number" name="peopleNum" placeholder="인원수" value="${dto.peopleNum }" required></p>
		<p>
	    	<input type="hidden" name="writer" value="${writer}" >
	    </p>
	    <p>
	    	<input type="hidden" name="choice" value="with">
	    </p>
		<p>
			<select name="category">
				<option value="헬스" ${dto.category == '헬스' }>헬스</option>
				<option value="요가" ${dto.category == '요가' }>요가</option>
				<option value="크로스핏" ${dto.category == '크로스핏'}>크로스핏</option>
			</select>
		</p>
					
		<p><input type="text" name="start_date" placeholder="시작" value="${dto.start_date }" required></p>
		<p><input type="text" name="end_date" placeholder="끝" value="${dto.end_date }" required></p>
		<p><input type="submit" value="수정완료"></p>
		</div>
	</div>
	</form>
</div>		




</body>
</html>