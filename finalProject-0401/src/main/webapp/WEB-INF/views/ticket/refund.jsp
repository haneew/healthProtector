<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.scroll::-webkit-scrollbar {
  display: none;
}

.scroll {
  -ms-overflow-style: none; /* 인터넷 익스플로러 */
  scrollbar-width: none; /* 파이어폭스 */
}
.yj-container{
   margin: 30px auto;
    display: flex;
    justify-content: space-between;
    width: 1200px;
}
.yj-left{
font-size: 40px;
margin: 20px 20px;
/* position: fixed; */

}
.yj-right{
   overflow-y : scroll;
   height: 600px;
}
.container {
  padding: 40px;
  justify-content: center;
  align-items: center;
  display: flex;
}

.card {
   width: 522px;
   height: 193px;
  border-radius: 5px;
  box-shadow: 0 4px 6px 0 rgba(0, 0, 0, 0.2);
  background-color: #fff;
  position: relative;
  display:flex;
  align-items: center;
  }

.main{
   display: flex;
    justify-content: space-between;
    align-items: center;
    text-align:center;
    width:inherit;
}
.main > div:nth-child(1){
	flex: 1;
}
.main > div:nth-child(2){
	flex: 2;
}

.co-img{
	width: fit-content;
}
.co-img img {
  width: 100px;
  height: 100px;
}
.content{
	border-left: 5px dotted black;
	padding-left: 45px;
	text-align: left;
}
.content h1 {
  font-size: 23px;
  color: #565656;
}

.content h1 span {
  font-size: 18px;
}
.content h2 {
  font-size: 18px;
  margin-left: -10px;
  color: #565656;
  text-transform: uppercase;
}

.content p {
  font-size: 16px;
  color: #696969;
}

.copy-button {
  margin: 12px 0 -5px 0;
  height: 45px;
  border-radius: 4px;
  padding: 0 5px;
  border: 1px solid #e1e1e1;
}

.copy-button input {
  width: 100%;
  height: 100%;
  border: none;
  outline: none;
  font-size: 15px;
}

.copy-button button {
  padding: 5px 20px;
  color: #fff;
  border: 1px solid transparent;
}

.buy{
 position: absolute;
  content: "";
  bottom: 20px;
  left:20px;
  background-color: #dc143c;
 }
 
 <!-- -->
body {
     overflow-x: hidden;
 }
 .main1 {
     width: 400px;
     height: 300px;
     position: relative;
     margin: 50px auto;
 }

 .mainImg {
     position: relative;
     overflow: hidden;
     width: 400px;
     height: 400px;
 }
 .mainImg > .item {
     box-sizing: border-box;
     position: absolute;
     width: 400px;
     height: 400px;
     line-height: 300px;
     text-align: center;
     font-size: 40px;
     transition-duration: 1s;
     border-radius: 10px;
 }
 .mainImg > .item:nth-child(5n + 1) {  background-image: url("https://static.wixstatic.com/media/84770f_ae3202cf27b64d0c8219d1b318b66190~mv2_d_5157_3526_s_4_2.jpg/v1/fill/w_614,h_614,fp_0.50_0.50,q_85,usm_0.66_1.00_0.01,enc_auto/84770f_ae3202cf27b64d0c8219d1b318b66190~mv2_d_5157_3526_s_4_2.jpg") }
 .mainImg > .item:nth-child(5n + 2) { background-image: url("https://static.wixstatic.com/media/82fcd3_f9996d378dd1441e8308f71819f498f3~mv2_d_5508_2954_s_4_2.jpg/v1/fill/w_1505,h_1241,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/82fcd3_f9996d378dd1441e8308f71819f498f3~mv2_d_5508_2954_s_4_2.jpg")}
 .mainImg > .item:nth-child(5n + 3) { background-image: url("https://health.chosun.com/site/data/img_dir/2023/08/31/2023083102409_0.jpg")}
 .mainImg > .item:nth-child(5n + 4) { background-image: url("https://jhealthfile.joins.com/photo//2020/02/20/1343b1c172e80.jpg")}
 .mainImg > .item:nth-child(5n + 0) { background-image: url("https://d2m9duoqjhyhsq.cloudfront.net/marketingContents/article/article765-01.jpg")}
 .mainImg > .item{
    background-size: 100% 100%;
 background-repeat : no-repeat;
 }

 .arrow {
     width: 1200px;
     position: absolute;
     top: 50%;
     transform: translateY(-50%);
     font-size: 60px;
     color: rgba(165, 164, 164, 0.4);
 }
 .arrow > div:hover {
     color: grey;
     cursor: pointer;
     transition-duration: 0.3s;
 }
 p.leftTitle {
    font-weight: lighter;
 }
.dh-eachCnt{
	display: flex;
	align-items: center;
}
.dh-eachCnt> p{
	flex:1;
}
.content > *{
	margin: 10px; 
}
</style>

</head>
<body>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<div class="frame">

<div class="dg-tkHome-banner">
        <img src="${cpath }/upload/mainImage/ticketMain.png">
	        <div class="yj-hello">
	        <h3>Health Protector에 오신 것을 환영합니다</h3>
	        <br>
	        </div>
    </div>

<div class="yj-container">

  <div class="yj-left">
    <p class="leftTitle">환불 가능한 이용권</p>
    <p style="border: 2px solid black; margin-top: 20px; width: 400px;"></p>
    
    <div class="main1">
            <div class="mainImg">
                <div class="item"></div>
                <div class="item"></div>
                <div class="item"></div>
                <div class="item"></div>
                <div class="item"></div>
            </div>
            <div class="arrow flex sb">
                <div direction="-1"></div>
                <div direction="1"></div>
            </div>
     </div>
     </div>
     <div></div>
  
      <form id="refundForm" method="POST">
         <div class="yj-right scroll">
         <c:forEach var="dto" items="${list }">
       <div class="container">
         <div class="card">
           <div class="main">
            <div class="co-img">
               <img src="${cpath }/upload/logo.png"/>
             </div>
             <div class="content">
<!--                <h2>환불 가능 이용권</h2> -->
               
               <h1><fmt:formatNumber value="${dto.tkCount * 100}" pattern="#,###" type="number"/> 원</h1>
               <div class="dh-eachCnt">
	               <p>일 이용권(${dto.ticket_1 })</p>
				   <p>월 이용권(${dto.ticket_2 })</p>
				   <p>년 이용권(${dto.ticket_3 })</p>
               </div>
<%--                <p>총 ${dto.tkCount}회</p> --%>
               <p>구매날짜 :${dto.buyDay }</p>
               <input type="button" value="환불하기" style="cursor:pointer; width: 170px; height: 35px;" uid=${dto.imp_uid }>
             </div>
            </div>
         </div>
       </div>
       </c:forEach>
       </div>
    </form>
</div>
</div>   



<script>
    // main1

    const MainImgArr = Array.from(document.querySelectorAll('.mainImg > .item'))
    let isAnimating = false
    
    function mainSlider(event) {
        if(isAnimating) return
        
        isAnimating = true
        const unit = 1200
        const mid = Math.trunc(MainImgArr.length / 2)
        const direction = +event.target.getAttribute('direction')

        if (direction == 1) MainImgArr.push(MainImgArr.shift())
        else MainImgArr.splice(0, 0, MainImgArr.pop())

        MainImgArr.forEach((e, index) => {
            e.style.opacity = 0.2
            e.style.left = -(unit * (mid-index)) + 'px'
        })

        MainImgArr[mid].style.opacity = 1
        MainImgArr[0].style.opacity = 0
        MainImgArr[MainImgArr.length-1].style.opacity = 0

        setTimeout(() => {
            isAnimating = false
        }, 500)
        
    }


    document.querySelectorAll('.arrow > div').forEach(e => e.onclick = mainSlider)
   for(let i = 0; i < 5; i++) {
       document.querySelector('.arrow > div:last-child').dispatchEvent(new Event('click'))
   }
    setInterval(() =>
        document.querySelector('.arrow > div:last-child').dispatchEvent(new Event('click'))
    , 4000)


    </script>


<script>
const counts = []
const refundCheck = document.getElementById('refundCheck')
const submit = document.querySelectorAll('input[type="button"]')
const click = document.querySelectorAll('input[type="checkbox"]')

	submit.forEach(e => {
	    e.onclick = function() {
	        cancelPayment(e.getAttribute('uid'));
	    };
	});

  function cancelPayment(imp_uid) {
	  const url = '${cpath}/cancelPayment'
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            imp_uid: imp_uid
        })
    })
    .then(response => {
	    if (response.ok) {
	        alert('환불 했습니다.')
	        location.href='${cpath}/ticket/tkList'
	    } else {
	    	alert('환불에 실패했습니다.')
	    }
	})
}
  

</script>
  
  

<%@ include file="../footer.jsp" %>

</body>
</html>