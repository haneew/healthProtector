<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.alert{
    background: #ffdb9b;
    padding: 20px 40px;
    min-width: 100%;
    position: fixed;
    right: 0px;
    top: 120px;
    overflow: hidden;
    border-radius: 4px;
    border-left: 8px solid #ffa502;
    z-index:6;
}
.alert.show{
    animation: show_slide 1s ease forwards; 
}
.alert.showAlert{
    opacity: 1;
    pointer-events: auto;
}

@keyframes show_slide{
    0%{
        transform: translateX(100%);
    }
    40%{
        transform: translateX(-10%);
    }
    80%{
        transform: translateX(0%);
    }
    100%{
        transform: translateX(-10px);
    } 
}
.hide{
    display: none;
}
@keyframes hide_slide{
    0%{
        transform: translateX(-10px);
    }
    40%{
        transform: translateX(0%);
    }
    80%{
        transform: translateX(-10%);
    }
    100%{
        transform: translateX(100%);
    }
}

.alert .fa-exclamation-circle{
    position: absolute;
    left: 20px;
    top: 50%;
    transform: translateY(-50%);
    color: #ce8500;
    font-size: 30px;
}
.alert .yj-buymsg{
    padding: 0 20px;
    font-size: 18px;
    color: #ce8500;
}
.close-btn{
    position: absolute;
    right: 0px;
    top: 50%;
    transform: translateY(-50%);
    background: #ffd080;
    padding: 20px 18px;
    cursor: pointer;
    z-index:7;

}
.close-btn:hover{
    background: #ffc766;
}
.close-btn .fa-times{
    color: #ce8500;
    font-size: 22px;
    line-height: 100%;
}
<!-- -->
   .center {
        text-align: center;
    }
   #buyTable {
      border: 0px solid #A5AAA3;
        border-collapse: collapse;
        width: 975px;
        height: 400px;
        margin: auto;
        padding: 0;
   }
   #buyTable thead{
   		height: 100px;
   }
    th {
        border-bottom: 1px solid #A5AAA3 ;
        text-align: center;
    }
    th:nth-child(3){
    	text-align:right;
    }
    th:nth-child(4){
    	padding-right: 95px;
    	text-align: right;
    }
    td {
        font-size: 20px;
        border-bottom: 1px solid #A5AAA3;
        text-align:center;
    }
	td:nth-child(3){
		padding-right:20px;
		text-align:right;
	}
	td:nth-child(4){
		padding-right: 40px;
   		text-align: right;
	}
    tr > th {
        font-size: 25px;
        padding: 10px 0px;
    }
    select {
    	margin-left:10px;
        padding: 5px;
        border: 2px solid #A5AAA3;
        border-radius: 5px;
        width: 100px;
    }
    select:focus {
        border: 2px solid red;
    }
    .payBox{
    display: flex;
    justify-content: flex-end;
    margin: 30px 0;    
    position:relative;
    }
     #payBtn { 
         margin: auto;
         padding: 7px; 
         font-weight: bold; 
     } 
     #payBtn:hover { 
         background-color: white; 
         color: #A5AAA3; 
         cursor:pointer;
     } 
    .yj-ment{
    margin: 200px auto;
    text-align: center;
    font-size: 42px;
    }
    .yj-img{
    display: flex;
    justify-content: center;
    margin-bottom: 100px;
    }
    .yj-img img{
    width: 980px;
    height: 550px;
    }
    .pay1{
    font-size: 50px;
    display: flex;
      justify-content: space-between;
    }
    .pay1 > p{
    	position:absolute;
    	right:320px;
    }
    select {
    width: 200px;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    color: #333;
    background-size: 20px auto, 100% 100%;
    background-repeat: no-repeat;
    padding-right: 30px;
    font-family: 'IBMPlexSansKR-Regular';
   }

   select:hover {
       border-color: #999;
   }
   
   select option:checked {
       background-color: #f0f0f0;
   }
   
   .dg-right{
      width: 975px;
      margin:auto;
   }
/* <!--환불규정--> */
.yj-refund {
    width: 1000px;
  
}

.refund-rules {
    font-family: Arial, sans-serif;
    font-size: 16px;
    line-height: 1.5;
    text-align: center;
    margin-top: 100px;
    width: 1200px;
}

.refund-rules h2 {
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

.refund-rules p {
    margin-bottom: 15px;
}

.refund-rules ul {
    list-style-type: disc;
    margin-left: 20px;
}

.refund-rules li {
    margin-bottom: 5px;
}
.widget1{
    border: 1px solid black;
    width: 1200px;
    margin: auto;
}
.widget2{
    border-top: 2px solid black;
    width: 1200px;
    margin: auto;
}
.yj-checkbox {
    margin-bottom: 100px;
    text-align: right;
}

.checkbox-label {
    margin-right: 10px;
}
.yj-refundtable{
width: 1200px;
margin: 100px auto;
}
.yj-result > p{
margin-right: 25px;
}  
</style>

</head>
<body>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<div class="frame">

<div class="dg-tkHome-banner">
        <img src="${cpath }/upload/mainImage/ticketMain.png">
    </div>

   <div class="yj-ment">
   <p><fmt:formatDate value="${today}" pattern="yyyy-MM-dd " />| health protector </p>
   <h1>welcome weekend</h1>
   <p>ticket shop</p>
   </div>

   <div class="yj-img"><img src="https://static.wixstatic.com/media/84770f_4f19a39d47b540fb942ba6b844462f7f~mv2_d_5208_3472_s_4_2.jpg/v1/fill/w_1469,h_828,fp_0.50_0.50,q_85,usm_0.66_1.00_0.01,enc_auto/84770f_4f19a39d47b540fb942ba6b844462f7f~mv2_d_5208_3472_s_4_2.jpg">
   </div>

   <div class="yj-refundtable">
       <div class="widget1"></div>
       <div>
           <h3 style="margin: 0px; text-align: center; letter-spacing:2px;"><strong><span style="color: rgb(0, 0, 0); font-size: 40px;">Refund Rules</span></strong></h3>
       </div>
       <div class="widget2"></div>
   


   <div class="yj-refund">
       <div class="refund-rules">
           <h2>환불규정 안내</h2>
           <p>"이용 개시일"이란 계약 내용이 이용 기간으로 정해진 경우에는 이용 기간이 시작되는 첫날을 말한다.</p>
           <p>"이용료"란 일반이용자가 체육시설업자에게 계약 시 납부한 총 금액을 말하며, 계약금, 입회금, 가입비,
           <p> 부대시설 이용료 등의 금액을 모두 포함한다. 다만, 보증금은 이용료에 포함되지 않는다.</p>
           <p>사업자는 총 이용금액에서 이용일 수에 해당하는 금액과 위약금 10%를 공제한 뒤 환불해야 한다.</p>
           <p>이용일 기준 75% 이상이 남았을 경우에만 환불이 가능하다.</p>
           <p><strong>&lt;이용에 관한 법률 시행령(약칭: 체육시설법 시행령) 21조 2 (이용료나 교습비의 반환) 기준&gt;</strong></p>
       </div>
   </div>

   <div class="yj-checkbox">
       <input type="checkbox" id="agreeCheckbox" class="checkbox">
       <label for="agreeCheckbox" class="checkbox-label">위 환불 규정에 동의합니다.</label>
   </div>
   
   <div class="widget1"></div>
       <div>
           <h3 style="margin: 0px; text-align: center; letter-spacing:2px;"><strong><span style="color: rgb(0, 0, 0); font-size: 40px;">Buy Ticket</span></strong></h3>
       </div>
    <div class="widget2"></div>

   </div>
   
   <div class="dg-right">
         <form method="POST">
         
       <table id="buyTable">
         <thead>
            <tr>
               <th>Number</th>
               <th>Ticket Type</th>
               <th>Price(￦)</th>
               <th>Quantity</th>
            </tr>
         </thead>
      <tbody>
            <c:forEach var="dto" items="${list }">
            <tr>
               <td>${dto.idx }</td>
               <td><a href="${cpath}/ticket/tkBuy/${dto.idx}">${dto.tk_content}</a></td>
               <td>
               <fmt:formatNumber value="${dto.price }" pattern="#,###" type="number"/>
               </td>
               <td>
                  <select class="yj-tkSelect" idx="${dto.idx }" price=${dto.price }>
                     <c:forEach var="i" begin="0" end="10" step="1" >
                        <option value="${i }" >${i}</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            </c:forEach>
      </tbody>
      </table>
      <div class="payBox">
         <div>
            <div class="pay1">
               <p>Total</p>
            <div class="yj-result"><p>0</p></div>
            </div>
                  
              <input type="hidden" name="idx" value="${dto.idx }">
               
                  
                  <input type="hidden" name="userid" value="${dto.userid }">
                  <input type="hidden" name="ticket_id" value="${dto.ticket_id }">
                  <input type="hidden" name="ticketCount" value="${dto.ticketCount }">
                  <input type="hidden" name="expirDay" value="${dto.expirDay }">
                  <input type="hidden" name="buyPrice" value="${dto.buyPrice }">
            </div>
       </div>
           <div style="text-align: right; margin: 50px auto;">
                  <input type="submit" id="payBtn" value="구매하기" style="border: 2px solid grey;
                   width: 333px; height: 50px;">
         </div>
         </form>
     </div> 
     
      <div class="dg-btn1"></div> 
      
      <div class="alert hide ticketAlert">
        <span class="fas fa-exclamation-circle"></span>
        <span class="yj-buymsg"></span>
        <div class="close-btn ticketClose">
            <span class="fas fa-times"></span>
           </div>    
       </div>
    
</div>

<script>
   // select 가 onchange가 될 때 각각의 이용권 idx, 수량, 총 가격(idx에 해당하는 이용권 * 수량) 을 script 변수에 저장
   const selectList = document.querySelectorAll('.yj-tkSelect')
   const show = document.querySelector('.yj-result')
   const buy = document.querySelector('input[type="submit"]')
   const ticketClose = document.querySelector('.ticketClose')
   const ticketModal = document.querySelector('.ticketAlert')
  
   
   let arr = new Array(3)
   
   function getTotal(){
      let total = 0
      
      for (let i = 0; i < arr.length; i++) {
          if(arr[i]) total += arr[i].price * arr[i].count;
       }
      totalAmount = total; 
      show.innerHTML = '<p>'+formatNumber(total)+'</p>'
   }
   
   // formatNumber
   function formatNumber(number) {
       const numberFormatter = new Intl.NumberFormat('ko-KR');
       return numberFormatter.format(number);
   }
   
   // changeHadler
   function changeHandler(e){
      let ob = {
         count: e.target.value || 0,
         idx: e.target.getAttribute('idx') || 0,
         price: e.target.getAttribute('price') || '0'
      }
      arr[ob.idx-1] = ob
      console.log()
      getTotal()      
   }
   
   selectList.forEach(e => e.onchange = changeHandler)
   // 총 가격을 출력
   
   
   var IMP = window.IMP;
   IMP.init("imp23767114"); 
   
   let totalAmount = 0; 
   
   // 결제 요청 함수
     function requestPay() {
    getTotal(); // 총 결제 금액 업데이트

    
    
    
    
    // IMP.request_pay 호출
    IMP.request_pay({
        pg: "html5_inicis.INIpayTest", 
        pay_method: "card", 
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: "Health Protector",
        amount: 100,
        buyer_tel : '010-1234-1234',
        buyer_email: " "
    }, function(rsp) {
        if (rsp.success) {
            var imp_uid = rsp.imp_uid; // 결제 고유 번호(imp_uid) 추출
            alert("결제가 완료되었습니다. imp_uid: " + imp_uid); // alert 내용 수정
            buyHandler(imp_uid);
        } else {
            alert('결제에 실패하였습니다. 에러 메시지: ' + rsp.error_msg);
        }
    });
}     
    
   
  // buyHandler
     function buyHandler(imp_uid) {
         let counts = new Array(selectList.length).fill('0');
         for (let i = 0; i < arr.length; i++) {
             if (arr[i]) { 
                 counts[arr[i].idx - 1] = arr[i].count;
             }
         }
         
         const url = '${cpath}/ticket/Buy';
         const data = { counts: counts, imp_uid: imp_uid };
         const options = {
             method: 'POST',
             body: JSON.stringify(data),
             headers: {
                 'Content-Type': 'application/json; charset=utf-8'
             }
         };

         fetch(url, options)
     }

   
    
    
//     document.getElementById('payBtn').addEventListener('click', function(event) {
//         event.preventDefault(); 
//         requestPay(); 
//     });
   

    
//    function buyHandler(event){
//       event.preventDefault()
//       let counts = new Array(3)
//       for(let i = 0; i < arr.length; i++){
//          if(arr[i]){ counts[i] = arr[i].count}
//          else   {counts[i] = 0}
//       }
//       console.log(counts)
//        location.href = '${cpath}/ticket/Buy/'+ counts +'/'+imp_uid
//    }
//    buy.onclick = buyHandler 
   

// 환불조항 안 누르면 버튼 비활성화
const agreeCheckbox = document.getElementById('agreeCheckbox')
const payBtn = document.getElementById('payBtn')


payBtn.addEventListener('click', function(event) {
   const msg = document.querySelector('.yj-buymsg')
   let totalCount = arr.reduce((acc, curr) => acc + parseInt(curr.count), 0);
   
    if (!agreeCheckbox.checked) {
       event.preventDefault()
       msg.innerText = 'Warning: 환불 규정에 동의하십시오'
       ticketModal.classList.remove('hide')
    }else if (totalCount === 0) {
       /* alert('수량을 선택해주십시오') */
       event.preventDefault()
       msg.innerText = 'Warning: 수량을 선택해주십시오'
       ticketModal.classList.remove('hide')
        return;
    }
    else{
       event.preventDefault();
       ticketModal.classList.add('hide')
        requestPay(); 
       
    }
   
   

   
})

ticketClose.addEventListener('click',function(event){
   ticketModal.classList.add('hide')
})

</script>



<%@ include file="../footer.jsp" %>

</body>
</html>