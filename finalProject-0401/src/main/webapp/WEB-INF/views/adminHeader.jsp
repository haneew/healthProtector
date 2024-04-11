<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
        font-family: 'GangwonEdu_OTFBoldA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    body {
        font-family: 'GangwonEdu_OTFBoldA';
        height:100%
        background-color:#f1f3f5;
        
 	}
 	*{ 
 		padding:0; 
 		margin:0; 
 		box-sizing: border-box;
 	} 
 	.logo{
 		margin-top: 100px;
 	}
 	.logo > img{
 		height:70px;
 	}
	.leftHeader{
		position:fixed;
		top:0;
		left:0;
		border: 1px solid yellow;
		width: 300px;
		height: 100%;
	}
	.frame{
	  	margin-top: 130px;
	  	margin-left:320px;
	  	height: 500px;
    }  
    .leftNav>div{
    	margin: 20px 0px;
    	padding:20px;
    	cursor:pointer;
    }
    a{
    	text-decoration: none;
    	color:black;
    }
    a:hover, .leftNav>div:hover{
    	cursor:pointer;
    	color:#dadada;
    }
    .sb{
    	display:flex;
    	justify-content: space-between;
    	align-items: center;
    }
    .hidden{
    	display:none;
    }
    .Mauto{
		margin: auto;
	}
	.center{
		display:flex;
		justify-content: center;
		align-items: center;
	}
</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>


<div class="leftHeader">
	<div class="logo"><h1>관리자페이지</h1></div>
	<div class="leftNav">
		<div>Member</div>
		<div>Ticket</div>
		<div>Diet</div>
		<div>Social</div>
		<div>Consulting</div>
	</div>
</div>

<script>

const cpath = '${cpath}'
const userid = '${login.userid}'

const sockJS = new SockJS(cpath + '/endpoint') 
const stomp = Stomp.over(sockJS)

stomp.connect({}, onConnect)

function onConnect() {
	stomp.send('/app/create', {}, JSON.stringify({	// 서버에게 입장 메시지와 시간을 보낸다
		from: userid
	}))
}


</script>



</body>
</html>