<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>

<style>
.js-topImg img {
	width: 100%;
	height: auto;
}

.js-viewTopFrame {
	width: 1640px;
	margin: 0 auto;
	display: flex;
	justify-content: flex-end;
}

.js-viewFrame {
	border: 10px solid white;
	border-radius: 5px;
	margin: -10px auto;
	width: 1640px;
	display: flex;
	justify-content: space-between;
}

.js-viewLeft {
	border: 3px solid white;
	flex: 3px;
}

.js-viewLeft img {
	width: 1265px;
	height: 667px;
	margin: 5px;
}

.js-viewRight {
	border: 5px solid white;
	flex: 2px;
}

.js-viewRightTop {
	padding-left: 20px;
	border-left: none;
	margin-top: 20px;
}

.js-viewRightMid {
	border: 10px solid white;
	width: 1643px;
	margin: 0 auto;
}

.js-viewRightBottom {
	border-left: none;
	height: 55px;
}

.js-viewRightBottomBetween {
	display: flex;
	justify-content: space-between;
}

.js-root {
	width: 1610px;
	height: 140px; /* 높이를 고정 */
	margin: 10px;
	overflow-y: scroll;
}

.js-item {
	width: 270px;
	display: block;
}

.js-root-1 {
	width: 295px;
	height: 545px; /* 높이를 고정 */
	margin: 15px 10px;
	overflow-y: scroll;
}

.js-item-1 {
	width: 270px;
	display: block;
}

.js-item>div {
	margin: 5px;
	width: 300px;
}

.js-reply-content {
	display: flex;
	justify-content: flex-start;
}

.js-load-more {
	width: 247px;
	height: 24px;
}

button, input[type="submit"], input[type="button"] {
	border: none;
	outline: none;
	background-color: #8fabba;
	border-radius: 5px;
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 15px;
	margin: 5px;
}

#modal>.content {
	width: 650px;
	height: 140px;
	background-color: white;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	box-shadow: 20px 20px 0px black;
	z-index: 3;
	transition-duration: 0.5s;
	border-radius: 25px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	overflow: hidden;
}

#modal>.overlay {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	position: fixed;
	top: 0;
	left: 0;
	z-index: 2;
}

#modal.hidden>.content {
	top: 150%;
	transition-duration: unset;
}

#modal.hidden>.overlay {
	display: none;
}

#modal textarea {
	width: 600px;
	height: 50px;
	margin-top: 10px;
}
</style>




<div class="frame">
	<div class="js-topImg" style="width: 100%; text-align: center;">
		<img src="${cpath }/upload/mainImage/socialmain.png"
			style="max-width: 100%;">
	</div>
	<div class="js-viewTopFrame">
		<a href="${cpath }/social/home"><button
				style="padding: 5px 42px; margin: 12px;">Feed</button></a>
	</div>

	<div class="js-viewFrame">

		<div class="js-viewLeft">
			<!-- 이미지 표시 부분 -->
			<c:forTokens var="fileName" items="${dto.storedFileName }" delims=":">
				<img src="${cpath }/upload/${fileName}">
			</c:forTokens>
		</div>

		<div class="js-viewRight">
			<!-- 게시물 세부 정보 표시 부분 -->
			<div class="js-viewRightTop">
				<div style="font-size: 25px;">${dto.title }</div>
				<div class="js-root-1">
					<div class="js-item-1">
						<div style="font-size: 18px;">${dto.maintext }</div>
					</div>
				</div>
				<div style="font-size: 16px;">@_${dto.writer }</div>
				<div style="font-size: 14px;">${dto.write_date }</div>
			</div>
		</div>

		<div id="modal" class="hidden">
			<div class="content">
				<form id="replyModify"
					action="${cpath }/social/feed/replyModify/${dto.idx}" method="POST">
					<h3>댓글 수정</h3>
					<p>
						<input type="hidden" name="writer" value="${login.userid }">
					</p>
					<p>
						<textarea id="replyM" name="content" required>
							${reply.content }
						</textarea>
					</p>
					<p>
						<input type="submit" value="수정" style="width: 50px; height: 21px;">
					</p>
				</form>
			</div>
			<div class="overlay"></div>
		</div>

	</div>

	<!-- 댓글 목록 표시 및 더 보기 버튼 -->
	<div class="js-viewRightMid" style="margin-bottom: 100px;">
		<div class="js-root">
			<div class="menu">
				<div class="js-item">
					<c:forEach var="reply" items="${replyList}" varStatus="loop">
						<div style="display: ${loop.index < 5 ? 'block' : 'none'}">
							<div style="font-size: 20px;" class="js-reply-content">
								${reply.content}
								<c:if test="${login.userid eq reply.writer}">
									<label class="buttons">
										<button style="width: 20px; height: 21px;">
											<i class="fa-solid fa-file-pen" id="open" idx="${reply.idx }"
												content="${reply.content }"></i>
										</button>
									</label>
									<a id="reply_${reply.idx}" class="js-item"
										href="${cpath }/social/feed/replyDelete/${reply.idx}/${dto.idx}">
										<label><button style="width: 20px;">
												<i class="fa-solid fa-trash"></i>
											</button></label>
									</a>
								</c:if>
							</div>
							<div style="font-size: 13px;">${reply.writedate}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<button class="js-load-more">더 보기</button>
		</div>

		<!-- 댓글 작성 폼 -->
		<div class="js-viewRightBottom">
			<form method="POST">
				<c:if test="${not empty login.userid }">
					<div class="js-viewRightBottomBetween">
						<div>
							<p>
								<input type="hidden" name="board_id" value="${dto.idx}">
							</p>
							<p>
								<input type="hidden" name="writer" value="${login.userid }">
							<p>
							<p>
								<textarea name="content" placeholder="댓글을 입력 하세요"
									style="width: 460%; height: 40px; margin: 5px; font-size: 30px;"></textarea>
							</p>
						</div>
						<div>
							<p>
								<input type="submit" value="작성"
									style="width: 90px; height: 40px; border: none;">
							</p>
						</div>
					</div>
				</c:if>

				<c:if test="${empty login.userid }">
					<div class="js-viewRightBottomBetween">
						<div>
							<p>
								<a href="${cpath }/member/login"><textarea name="content"
										placeholder="로그인이 필요합니다"
										style="width: 350%; height: 47px; margin: 5px; font-size: 40px;"></textarea></a>
							</p>
						</div>
						<div>
							<p>
								<input type="submit" value="작성"
									style="width: 90px; height: 47px; border: none;">
							</p>
						</div>
					</div>
				</c:if>
			</form>
		</div>

	</div>
</div>


<script>
	//초기에는 버튼 숨기기
	document.addEventListener('DOMContentLoaded', function() {
	    const replyContents = document.querySelectorAll('.js-reply-content');
	    replyContents.forEach(content => {
	        const buttons = content.parentNode.querySelectorAll('button');
	        buttons.forEach(button => {
	            button.classList.add('hidden');
	        });
	    });
	});
	
	//댓글 내용 클릭시 수정, 삭제 버튼 토글
	document.addEventListener('click', function(event) {
	    const target = event.target;
	    if (target.classList.contains('js-reply-content')) {
	        const buttons = target.parentNode.querySelectorAll('button');
	        buttons.forEach(button => {
	            button.classList.toggle('hidden');
	        });
	    }
	});

    // 무한 스크롤
    const root = document.querySelector('.js-root');
    const loadMoreButton = root.querySelector('.js-load-more');
    const itemsToShow = 5;
    let visibleCount = 5;

    loadMoreButton.addEventListener('click', function() {
        const items = root.querySelectorAll('.js-item');
        for (let i = visibleCount; i < visibleCount + itemsToShow; i++) {
            if (items[i]) {
                items[i].style.display = 'block';
            }
        }
        visibleCount += itemsToShow;

        // 더 이상 보여줄 댓글이 없을 경우 "더 보기" 버튼 숨김
        if (visibleCount >= items.length) {
            loadMoreButton.style.display = 'none';
        }
    });

    // 댓글이 추가되거나 삭제될 때 "더 보기" 버튼 업데이트
    function updateLoadMoreButton() {
        const items = root.querySelectorAll('.js-item');
        if (visibleCount >= items.length) {
            loadMoreButton.style.display = 'none';
        } else {
            loadMoreButton.style.display = 'block';
        }
    }

    // 댓글이 추가되거나 삭제될 때마다 "더 보기" 버튼 업데이트
    function handleCommentChange() {
        updateLoadMoreButton();
    }

    // 댓글이 추가되거나 삭제될 때마다 호출되는 함수
    document.addEventListener('DOMContentLoaded', function() {
        handleCommentChange();
    });

    // 댓글이 추가될 때마다 호출되는 함수
    function addComment() {
        // 새로운 댓글을 추가하는 로직

        // 댓글이 추가될 때마다 "더 보기" 버튼 업데이트
        handleCommentChange();
    }

    //댓글이 삭제될 때마다 호출되는 함수
    function deleteComment() {
        // 댓글을 삭제하는 로직

        // 댓글이 삭제될 때마다 "더 보기" 버튼 업데이트
        handleCommentChange();
    }
    
 
</script>


<script>

	// 문서가 모두 불러지면 특정 요소를 호출하여 이벤트를 연결하는 함수
	function loadHandler() {
		const itemList = document.querySelectorAll('.menu > .item')	// 이벤트 대상
		
		// 상단 메뉴를 클릭했을 때 스타일 옮겨가는 내용
		itemList.forEach(element => element.addEventListener('click', itemListClickHandler))
		
		// 상단 메뉴를 클릭했을 때 fetch로 데이터 불러와서 div#root > div.content에 내용 띄우기
		itemList.forEach(element => element.addEventListener('click', menuClickHandler))
		
		// 열기/닫기 버튼에 모달 작동 연결하기
		const btns = [
			document.getElementById('open'),
			document.getElementById('close'),
			document.querySelector('div.overlay'),
		]
		const Openbtns = document.querySelectorAll('#open')
		
		Openbtns.forEach(b => b.onclick = event => {
			const idx = event.target.getAttribute("idx")
			const content = event.target.getAttribute("content")
			
			const preReply = document.getElementById('replyM')
			
			
			preReply.innerHTML = content
			document.getElementById('replyModify').innerHTML += '<input type="hidden" name="idx" value="'+idx+'">'
			modal.classList.toggle('hidden')
		})
			 
		
		const overlay = modal.querySelector('.overlay');
	    
		overlay.addEventListener('click', function() {
	        modal.classList.add('hidden')
	    })
	
	}
	window.addEventListener('DOMContentLoaded', loadHandler)
</script>



<%@ include file="../../footer.jsp"%>
