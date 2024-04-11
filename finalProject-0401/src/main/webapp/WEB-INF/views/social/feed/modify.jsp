<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp" %>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	p.relative {
		position: relative;
		height: 200px;
		margin-left: 10px;
		margin-bottom: 10px;
	}
	input[type="file"] {
		opacity: 0;
		position: absolute;
		top: 0;
		left: 0;
		width: 200px;
		height: 200px;
	}
	label[for="upload"] {
		position: absolute;
		top: 0;
		left: 0;
		display: flex;
		justify-content: center;
		align-items: center;
		width: 200px;
		height: 200px;
		border: 5px solid white;
		border-radius: 50%;
		overflow: hidden;
		font-size: 14px;
		text-align: center;
		background-position: center;
		background-size: auto 100%;
		background-repeat: no-repeat;
	}
	.js-writeFrame {
		border: 10px solid white;
		border-radius: 30px;
		width: 570px;
		padding: 10px;
		padding-left: 30px;
		margin: 0px auto;
		box-shadow:-7px -7px 10px white, 5px 5px 10px rgba(0, 0, 0, 0.585);
		background: linear-gradient(to bottom, #D5DEE7 0%, #E8EBF2 50%, #E2E7ED 100%), linear-gradient(to bottom, rgba(0,0,0,0.02) 50%, rgba(255,255,255,0.02) 61%, rgba(0,0,0,0.02) 73%), linear-gradient(33deg, rgba(255,255,255,0.20) 0%, rgba(0,0,0,0.20) 100%);
 		background-blend-mode: normal,color-burn;
	}
	input[type="submit"] {
		border: none;
		outline: none;
		background-color: #8fabba;
		border-radius: 5px;
		font-family: 'GangwonEdu_OTFBoldA';
		font-size: 15px;
		margin: 5px;
		padding: 5px 215px;	
	}
</style>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



<div class="frame" style="margin: 100px;">
	<div class="js-writeFrame">
		<form method="POST" enctype="multipart/form-data">
			<p><input type="hidden" name="idx" value="${dto.idx }"></p>
			<div>
				<p class="relative">
					<label for="upload">파일을 끌어서 놓거나<br>클릭하세요</label>
					<input id="upload" type="file" name="upload" multiple>
				</p>
			</div>
			<div>
				<p><input type="text" name="writer" value="@_${login.userid }" readonly style="border: none;"></p>
				<p><input type="text" name="title" placeholder="제목을 입력하세요" value="${dto.title }" required></p>
				<p>
					<textarea id="summernote" name="maintext" placeholder="본문을 여기에 작성하세요" required style="width: 500px; height: 300px;">
						${dto.maintext }
					</textarea>
				</p>
				<input type="submit" value="수정완료">
			</div>
		</form>
	</div>
</div>





<script>
// 미리보기
const inputFile = document.querySelector('input[id="upload"]')
const preview = document.querySelector('label[for="upload"]')
inputFile.onchange = function(event) {
    if(event.target.files && event.target.files[0]) {
        const reader = new FileReader()
        reader.onload = function(e) {
            preview.style.backgroundImage = 'url(' + e.target.result + ')'
            preview.style.fontSize = 0
        }
        reader.readAsDataURL(event.target.files[0])
    }
    else {
    	preview.style.fontSize = '14px'		
    }
}
</script>

<script>
$(document).ready(function() {
	$('#summernote').summernote();
});
</script>


<%@ include file="../../footer.jsp" %>
</body>
</html>