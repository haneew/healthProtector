<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>
	<style>
		
		table {
			border-collapse: collapse;
			height: 100px;
			padding: 10px;
			margin-top: 10px;
			
		}
		progress{
			width: 107px;
			height: 23px;
			margin-top: 14px;
		}
		p{
			margin-left: 6px;
			margin-right: 6px;
		}
		div.bet {
			display: flex;
			justify-content: space-between;
		}
		td,th {
		 	border: 1px solid black;
		 	padding: 5px;
		 	font-size: 15px;
		}
	
		th:nth-child(4),
	    td:nth-child(4),
	    th:nth-child(4) + td,
	    th:nth-child(4) + td + td, 
		th:nth-child(5),
	    td:nth-child(5),
	    th:nth-child(5) + td,
	    th:nth-child(5) + td + td{
	        border: none; /* 해당 셀의 테두리 제거 */
	        padding: 0 10px;
	    }
		
		button {
			margin-bottom: 2px;
			border: 1 solid black;
			background-color: inherit; 
		}
	
		button.tbutton{
			width: 90px;
			height: 30px;
			margin: 5px;
		}
		button.out{
		 margin-top: 12px;
		 border: 0 solid black;
		}
		
	
		
		
		div.title{
			margin-top: 15px;
		}
		div.flex {
			display: flex;
		}
		div.tcenter-l{
			margin-left: 20px;
		}
		div.tcenter-r{
			margin-right: 7px;
		}
		div.fline{
			border-right: 1px solid black;
			margin: 0 auto;
		}
		div.write{
			margin-right: 10px;
		}
		div.out{
			margin-left: 21px;
		}
		.js-feedFrame  {
			width: 1300px;
			height: 100%;
			margin: 0 auto;
	 		border-top:0;
		}
	 	.js-choice { 
	 		display: flex;
			justify-content: center;
	 		width: 1300px;
	 	} 
	 	.js-feed { 
	 		border: 2px solid black; 
	 		border-radius: 10px 15px 0 0 ; 
	 		width: 650px;
	 		height: 80px;  
	 		font-size: 60px; 	
	 		background-color: #F6F6F6;	
	 	} 
	 	.js-with {
	 		border: 2px solid black; 
	 		border-radius: 15px 10px 0 0 ; 
	 		width: 650px;
	 		height: 80px;  
	 		font-size: 60px;
	 		border-bottom : 0px;
	 	} 
	 	.js-feedInfo {
	 		
	 		border: 2px solid black;
	 		border-radius: 0 0 20px 20px;
	 		padding-bottom: 15px; 
	 		border-top: 0;
	 	}
	 	.js-feedHomeBtn {
	 		display: flex;
	 		justify-content: space-between;
	 	}
	 	.js-feedList {
	 		display: flex;
	 		justify-content: space-between;
	 		border: 2px solid black;
	 		width: 1277px;
	 		margin: 5px;
	 		padding: 5px;
	 	}
	 	.js-listImgFrame {
	 		border: 1px solid black; 
	 	}
	 	.js-listInfoFrame {
	 		border: 1px solid black; 	
	 	}
	 	.dg-tkHome-banner {
	   	width:100%;
	    text-align: center;
	    margin: 0  auto;
		}
		.dg-tkHome-banner img{
	    width: 100%;
	    height: auto;
	    margin-bottom: 30px;
	    margin-top: 0;
		}
	
		.dg-tkHome-banner h3 {
		    font-size: 30px;
		    font-weight: 500;
		}
	 .scroll-arrows {
        position: fixed;
        top: 50%;
        transform: translateY(-50%);
        left: 10px;
        z-index: 9999;
    }

    .scroll-arrow {
        width: 30px;
        height: 30px;
        background-color: #ccc;
        text-align: center;
        line-height: 30px;
        cursor: pointer;
        margin-bottom: 10px;
    }

    .scroll-arrow:hover {
        background-color: #999;
    }

    .scroll-arrow.up {
        border-radius: 50% 50% 0 0;
    }

    .scroll-arrow.down {
        border-radius: 0 0 50% 50%;
    }
    img.fimg{
    	width:1297px;
    	height: 300px;
    }
	</style>


	<div class="frame">
		<div class="dg-tkHome-banner">
        <img src="${cpath }/upload/mainImage/socialMain.png">
    	</div>
    	
		<div class="js-feedFrame">
			<div class="js-choice ">
				<div class="js-feed center"><a href="${cpath }/social/feed/myboard">FEED</a></div>
				<div class="js-with center"><a href="${cpath }/social/with/mypage">WITH</a></div>
			</div>
			
			<div class="scroll-arrows">
			    <div class="scroll-arrow up">&uarr;</div>
			    <div class="scroll-arrow down">&darr;</div>
			</div>
			
			<div class="js-feedInfo">	
				<div >
					<div class="out"><a href="${cpath }/social/with/wlist"><button class="out">나가기</button></a></div>
				</div>
				<div class="bet">
				<div class="tcenter-l">	
					<div class="title">
					<div class= "write">
						<h3>내가작성한 with</h3>
					</div>	
						<div>
							<table >
								<tbody>
									<c:forEach var="dto" items="${list}">
										<tr>
											<td class="rigth bottom">작성자 : ${dto.writer}</td>
											<td class="left bottom">운동 : ${dto.category }</td>
											<td rowspan="2">
												<p >참여인원(${dto.withNum + 1}/ ${dto.peopleNum } )</p>
												<p><progress value="${dto.withNum+1 }" max="${dto.peopleNum}"></progress></p>
											</td>
											<td rowspan="2" class="wrapper">
												<a href="${cpath }/social/with/modify/${dto.idx}">
													<button class="tbutton button" ${dto.withNum == 1 ? 'disabled' : ''}>수정</button>

												</a>
												<br>
												<a href="${cpath }/social/with/delete/${dto.idx}"><button class="tbutton">삭제</button></a>
											</td>
										</tr>
										<tr>
											<td class="rigth top ">제목 : ${dto.title}</td>
											<td class="left top ">운동날 :${dto.start_date } ~ ${dto.end_date }</td>
										</tr>
									</c:forEach>
								</tbody> 
							</table>
						</div>
					</div>
				</div>
				<div class="tcenter-r">
					<!-------------------------------구분선------------------------- -->
			 		<div class="title">
						<h3> 내가 함께하는 with</h3>
						<div>
							<table>
								<tbody>
									<c:forEach var="dto" items="${wJoinList}">
										<tr>
											<td class="rigth bottom">작성자 : ${dto.writer}</td>
											<td class="left bottom">운동 : ${dto.category }</td>
											<td rowspan="2" >
												참여인원(${dto.withNum + 1}/ ${dto.peopleNum })<br>
												<progress value="${dto.withNum+1 }" max="${dto.peopleNum}"></progress>
											</td>
											<td rowspan="2" >
												<a href="${cpath}/social/with/wcancel/${dto.idx}"><button class="tbutton">취소</button></a>
											</td>	
										</tr>
										<tr>
											<td class="rigth top">제목 : ${dto.title}</td>
											<td class="left top">운동날 :${dto.start_date } ~ ${dto.end_date }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div> 
						</div>
					</div>
				</div>
			</div>				
		</div>
	</div>
	
	<%@ include file="../../footer.jsp" %>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const upArrow = document.querySelector('.scroll-arrow.up');
        const downArrow = document.querySelector('.scroll-arrow.down');
        const scrollStep = 100; // Adjust scroll step as needed

        upArrow.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });

        downArrow.addEventListener('click', function() {
            window.scrollTo({
                top: document.body.scrollHeight,
                behavior: 'smooth'
            });
        });

        window.addEventListener('scroll', function() {
            const scrollTop = window.scrollY || document.documentElement.scrollTop;

            if (scrollTop === 0) {
                upArrow.style.visibility = 'hidden';
            } else {
                upArrow.style.visibility = 'visible';
            }

            if (scrollTop + window.innerHeight >= document.body.scrollHeight) {
                downArrow.style.visibility = 'hidden';
            } else {
                downArrow.style.visibility = 'visible';
            }
        });
        
        // JavaScript 코드 추가
        const modifyButtons = document.querySelectorAll('.js-feedInfo .js-feedList .tbutton.button');

        modifyButtons.forEach(button => {
            // 각 수정 버튼에 대한 처리
            const withNum = parseInt(button.parentElement.querySelector('progress').getAttribute('value'));
            
            if (withNum !== 1) {
                // withNum이 1이 아닌 경우 버튼을 비활성화하고 스타일을 변경합니다.
                button.disabled = true;
                button.style.backgroundColor = '#ccc'; // 비활성화 색상
                button.style.color = '#666'; // 글자색 변경
            }
        });
    });
</script>	
</body>
</html>