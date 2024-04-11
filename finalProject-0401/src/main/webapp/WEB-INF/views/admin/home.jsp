<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#root{
		display:flex;
	}
	#root > a{
		margin-right: 20px;
		padding:15px;
	}
	.dh-send {
		display:flex;
		width:900px;
	}
	.dh-send > input[type="text"]{
		width:80%;
		height:35px;
		border: 0;
		border-radius: 15px;
		outline: none;
		margin-left: 10px;
  		background-color: rgb(233, 233, 233);
	}
	.dh-chatFrame{
		width:900px;
/* 		border: 1px solid black; */
		margin-top:20px;
		background-color:#f1f3f5;
	}
	.dh-chatHead{
		height:60px;
		width:900px;
		background-color: #bbb;
		display:flex;
		justify-content: space-between;
		align-items: center;
	}
	.dh-chatHead > div{
		padding:10px;
	}
	.dh-message{
		display:flex;
		margin: 5px 10px;
		align-items: center;
	}
	.dh-message>div{
		display:flex;
		border-radius: 10px;
		border: 1px solid black;
		width:fit-content;
		padding: 15px;
	}
	.dh-message > h2 {
		font-size:20px;
		width:30px;
	}
	.goChat{
		border: 1px solid #dadada;
		border-radius: 20px;
		display:flex;
		justify-content: center;
		text-align:center;
		align-items: center;
		width:fit-content;
		height:30px;
		background-color: inherit;
	}
	.start{
		justify-content: flex-start;
	}
	.end{
		justify-content: flex-end;
	}
	.service{
		justify-content: center;
		padding: 0px 20px;
	}
	.out{
		cursor:pointer;
	}
	.dm{
		display:flex;
		justify-content: center;
		width:20%;
		align-items: center;
		cursor:pointer;
	}
	table{
		width:100%;
		border-collapse: collapse;
	}
	thead > tr {
		border-bottom: 1px solid #ccc;
	}
	thead > tr > th{
		padding: 15px 40px;
		text-align: center;
	}
	tbody > tr > td{
		padding: 10px 40px;
		padding-top: 15px;
		text-align: center;
	}
	.ticketAdd{
		cursor: pointer;
	}
	.ticketAdd:hover{
		color:#dadada;
	}
</style>
</head>
<body>
<div class="frame">
	<div class="menu-item">
		<div class="Member hidden">
			<h3>회원 목록</h3>
			<div>
				<table class="memberTable">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>휴대폰번호</th>
							<th>이메일</th>
							<th>성별</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${memberList}">
							<tr>
								<td>${dto.userid }</td>
								<td>${dto.username }</td>
								<td>${dto.birth }</td>
								<td>${dto.phone_num }</td>
								<td>${dto.email }</td>
								<td>${dto.gender }</td>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
			</div>
		</div>
		<div class="Ticket hidden">
			<h3>이용권 목록</h3>
			<div>
				<table class="ticketTable">
					<thead>
						<tr>
							<th>번호</th>
							<th>티켓 종류</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${ticketList}">
							<tr>
								<td>${dto.idx }</td>
								<td>${dto.tk_content }</td>
								<td><fmt:formatNumber value="${dto.price }" pattern="#,###" type="number"/> 원</td>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
				<div class="ticketAdd">티켓 추가하기</div>
			</div>
			
			<br><br><br><br>
			
			<h3>회원별 이용권 구매목록</h3>
			<div>
				<table class="dealTable">
					<thead>
						<tr>
							<th>회원 아이디</th>
							<th>일 이용권</th>
							<th>월 이용권</th>
							<th>년 이용권</th>
							<th>구매 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${dealList}">
							<tr>
								<td>${dto.userid }</td>
								<td>${dto.ticket_1 } (개)</td>
								<td>${dto.ticket_2 } (개)</td>
								<td>${dto.ticket_3 } (개)</td>
								<td>${dto.buyDay }</td>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
			</div>
			
		</div>
		<div class="Diet hidden">
			<h3>사용자 등록 음식 목록</h3>
			<div>
				<table class="ticketTable">
					<thead>
						<tr>
							<th>이름</th>
							<th>내용량</th>
							<th>탄수화물(g)</th>
							<th>단백질(g)</th>
							<th>지방(g)</th>
							<th>당(g)</th>
							<th>나트륨(g)</th>
							<th>열량(kcal)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${foodList}">
							<tr>
								<td>${dto.food_name }</td>
								<td>${dto.capacity }</td>
								<td>${dto.tan }</td>
								<td>${dto.dan }</td>
								<td>${dto.ji }</td>
								<td>${dto.dang }</td>
								<td>${dto.na }</td>
								<td>${dto.kcal }</td>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
			</div>
		</div>
		<div class="Social hidden"></div>
		<div class="Consulting hidden">
			<h3>상담</h3>
			<div>
				<div id="root"></div>
				<div class="dh-chatFrame hidden">
					<div id="chat"></div>
				</div>
			</div>
		</div>
	
	</div>
	
	
</div>

<script>
	const url = '${cpath}/setting/ticketAdd'
		let options = ''
		options += 'menubar=no,'
		options += 'toolbar=no,'
		options += 'width=600,'
		options += 'height=600,'
		options += 'status=no,'
		options += 'left=500,'
		options += 'top=180'
	
	const ticketAdd = document.querySelector('.ticketAdd')
	//이벤트 함수를 정의한다
	const ticketAddHandler = function(event){
			window.open(url, '', options)
	}
	ticketAdd.onclick = ticketAddHandler
</script>

<script>
	const menuList = document.querySelectorAll('.leftNav > div')
	
	menuList.forEach(e => {
	    e.onclick = function(event) {
	        // 클릭된 메뉴 항목과 동일한 텍스트를 가진 모든 요소 선택
	        var elementsToShow = document.querySelectorAll('.' + e.innerText);
	        
	        // 클릭된 항목의 'hidden' 클래스 제거
	        elementsToShow.forEach(element => {
	            element.classList.remove('hidden');
	        });

	        // 클릭된 항목을 제외한 다른 메뉴 항목들 선택
	        var otherElements = document.querySelectorAll('.menu-item>div:not(.' + e.innerText + ')');
	        
	        // 다른 항목들에 'hidden' 클래스 추가하여 숨김 처리
	        otherElements.forEach(element => {
	            element.classList.add('hidden');
	        });
	    };
	});
	
</script>

<script>

const messageArea = document.getElementById('root')
const back = document.getElementById('chat')
const chatFrame = document.querySelector('.dh-chatFrame')
var subscriptionId
let isIn = '0'
let naIn = '0'
stomp.connect({}, onConnect)

function onConnect() {
	stomp.subscribe('/broker/message/'+ 'admin', alarm)
	stomp.subscribe('/broker/cons/admin', receiveA)
}

function updateIsIn(value) {
    isIn = value;
}

function alarm(from){
	const body = JSON.parse(from.body)
	const who = body.from
	const chat = body.chat
	const isInFromServer = body.isIn;
	if(who != null){
		const chatHead = document.querySelector('.dh-chatHead')
		if(chatFrame.classList.contains('hidden') || (chatHead!=null && !chatHead.classList.contains(who))){
			document.querySelector('a#' + who).style.backgroundColor = '#F0CFC6'		
		}
	}
	if(isInFromServer != null){updateIsIn(isInFromServer);}
	if(isInFromServer == 1 && !chatFrame.classList.contains('hidden')){
		readChat(chat)
	}
	
}

loadChat()

function readCheck() {
    const goChat = document.querySelectorAll('.goChat');
    goChat.forEach(async e => {
        const readCheckUrl = '${cpath}/readCheck/'+e.id+'/'+e.id;
        const isread = await fetch(readCheckUrl).then(resp => resp.text());
        if (isread != 0) {
            e.style.backgroundColor = 'rgb(240, 207, 198)';
        }
    });
}

async function loadChat(){
		const url = '${cpath}/loadChat'
		const result = await fetch(url).then(resp=>resp.json())
		const arr = Array.from(result)
		let str = ''
		arr.forEach(e=> {	
			str += '<a class="goChat" id="'+e+'"><span id="user">'+ e +'</span>님의 상담</a>'
		})
		messageArea.innerHTML = str
		const goChat = document.querySelectorAll('.goChat')
		goChat.forEach(e => e.addEventListener('click', startChat));
		
		readCheck()
}

async function readChat(who){
	
	const show = document.querySelector('#chatbody'+who)
	const url = '${cpath}/getChat/'+ who
	show.innerHTML = ''
	const result = await fetch(url).then(resp=>resp.json())
	const arr = Array.from(result)
	
	let lastPo = ''
	let checkPo = ''
	let i = 0;
	if(arr.length != 0){
		arr.forEach(e => {
			let po = ''
			let who = ''
			let userRead = ''
			let adminRead = ''
			let dbRead = ''
			
			if(e.isRead  == 1){dbRead = e.isRead}
			if(e.who_send == 'admin'){po = 'end'; userRead = dbRead}
			else {
				po = 'start';
				who = e.who_send;
				adminRead = dbRead
			}
			checkPo = document.querySelectorAll('.dh-message')
			if(checkPo.length > 0){
				lastPo = checkPo[checkPo.length - 1]
				if(lastPo.classList.contains(po)){who = ''}
			}
			let	str = ''
			str += '<div class="dh-message '+ po +'"><h2>'+ who +'</h2>'+userRead+'<div style="margin: 0px 10px;">' + e.content+'</div>'+adminRead+'</div>'	
			show.innerHTML += str
		})
	}
	
	chatFrame.classList.remove('hidden')
	show.scrollTop = show.scrollHeight
}

const startChat = async function goChatHandler(e){
	const userSpan = e.currentTarget.querySelector('#user')		
    if (userSpan) {
    	
        who = userSpan.innerText
        
       	const allLinks = document.querySelectorAll('a'); // 모든 <a> 태그 선택

	     allLinks.forEach(link => {
	         if (link.id === who) {
	             link.style.backgroundColor = '#8ABDCF';
	         } else if(link.style.backgroundColor != 'rgb(240, 207, 198)'){
	             link.style.backgroundColor = 'inherit';
	         }
	     });
        
        let tag = ''
        tag += '<div class="dh-chatHead '+who+'">'
        tag += '<div><h3>'+who+'</h3></div>'
        tag += '<div class="out">상담종료</div>'
        tag += '</div>'
        tag += '<div id="chatbody'+who+'" style="width: 900px; height: 500px; overflow-y: scroll;">'
		tag += '</div>'
		tag += '<div class="dh-send">'
		tag += '<input type="text" name="msg" id="msg">'
		tag += '<div class="dm">전송</div>'
		tag += '</div>'
		back.innerHTML = tag
		const msgInput = document.querySelector('input[name="msg"]');
		
		readChat(who)
		
        if (subscriptionId) {
		    stomp.unsubscribe(subscriptionId)
		}
        subscriptionId = stomp.subscribe('/broker/goChat/' + who, chatT).id
        
        msgInput.addEventListener('focus', async () => {
			const readURL = '${cpath}/isRead/'+ who +'/' + who
        	await fetch(readURL)
        	readChat(who)
			naIn = '1'
			stomp.send('/app/alarm/' + who, {}, JSON.stringify({ chat: who, isIn: '1' }));
		});
			
		msgInput.addEventListener('blur', () => {
			naIn = '0'
		    stomp.send('/app/alarm/' + who, {}, JSON.stringify({ chat: who, isIn: '0'}));
		});
    }
	const outBtn = document.querySelector('.out')
	const sendBtn = document.querySelector('.dm')
	const msgInput = document.querySelector('input[name="msg"]')

	outBtn.onclick = outM
	sendBtn.onclick = sendM
	msgInput.onkeyup = function(e){
		if(e.key == 'Enter') sendM()
	}
// 	msgInput.focus()
	
}

function chatT(chat){
	const content = JSON.parse(chat.body)
	const to = content.to
	const from = content.from
	let text = content.text
	let po = ''
	let isReadUser = ''
	let isReadAdmin = ''
	let who = ''
	let toA = ''
	
	if(from == 'admin'){toA = to; po = 'end'; isReadUser='1'}
	if(to == 'admin'){who = from; toA = from; po = 'start'; isReadAdmin='1'}
	if(text === 'out'){ text = '상담이 종료되었습니다.'; po ='service'; who=''; isReadUser=''; isReadAdmin=''; loadChat()}	
	if(isIn == '1') { isReadUser = ''}
	if(naIn == '1') {isReadAdmin = ''}
	
	const checkPo = document.querySelectorAll('.dh-message')
	if(checkPo.length > 0){
		const lastPo = checkPo[checkPo.length - 1]
		if(lastPo.classList.contains(po)){who = ''}
	}
	
	let	str = ''
	str += '<div class="dh-message '+ po +'"><h2>'+ who +'</h2>'+isReadUser+'<div style="margin: 0px 10px;">' + text+'</div>'+isReadAdmin+'</div>'
		
	const show = document.querySelector('#chatbody'+toA)
	show.innerHTML += str	
	show.scrollTop = show.scrollHeight
}

async function sendM(){
	const to = who
	const text = document.querySelector('input[name="msg"]').value	// 내용을 불러와서
	if(text == ''){													// 내용이 없으면 중단
		return
	}
	document.querySelector('input[name="msg"]').value = ''			// 입력창 비우기
	
	const url = '${cpath}/saveChat'
	let isRead = '1'
	if(isIn == 1 ) {isRead = '0'}
		
	const opt = {
	  method: 'POST',
	  body: JSON.stringify({ 
	  	who_send: 'admin',			
		who_chat: to,
		content: text,
		isRead: isRead
	  }),
	  headers: {
           'Content-Type': 'application/json; charset=utf-8'
       }
	}
	
	const addResult = await fetch(url,opt).then(resp=>resp.text())
	
// 	stomp.send('/app/alarm/' + who)
	stomp.send('/app/alarm/' + who, {}, JSON.stringify({	
			from: ''
		}))
	stomp.send('/app/sendM/' + who, {}, JSON.stringify({		
		to: who,			
		from: 'admin',
		text: text
	}))
	
 	document.querySelector('input[name="msg"]').focus()	// 다시 입력할 수 있도록 포커스 잡아주기
}	

async function outM(){
	chatFrame.classList.add('hidden')
	
	const to = who
	
	const url = '${cpath}/outChat/'+ who
	
	const result = await fetch(url).then(resp=>resp.text())
	
	const text = 'out'	
	if(text == ''){													
		return
	}
	stomp.send('/app/sendM/' + who, {}, JSON.stringify({		
		to: who,			
		from: userid,
		text: text
	}))
// 	stomp.disconnect(function() {
// 	    console.log('Disconnected');
// 	});
	loadChat()
}	

	function receiveA(chat) {
		const content = JSON.parse(chat.body)		//메시지를 받으면
		const text = content.text					//누구에게서 온 메시지 인지 어떤 내용인지 
		const from = content.from
		const userid = '${login.userid}'
		let who = ''
		
		let str = ''
		str += '<a class="goChat" id="'+from+'"><span id="user">'+from +'</span>' + text + '</a>'
		
		const check = document.querySelectorAll('#user')
		if(check != null ){
			check.forEach(e => {
				if(e.innerText == from){str = ''}
			})
		}
		messageArea.innerHTML += str
		
		const goChat = document.querySelectorAll('.goChat')			
		goChat.forEach(e => e.addEventListener('click', startChat));
	}
</script>


</body>
</html>