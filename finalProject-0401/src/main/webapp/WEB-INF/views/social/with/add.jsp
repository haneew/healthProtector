
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../../userHeader.jsp"%>
<style>
		* {
   box-sizing: unset;
	}
	 .weekdays {
            display: flex;
    }
      .weekday {
           flex: 1;
           text-align: center;
           padding: 5px;
           border: 0px solid #ccc;
           margin-bottom: 12px;
     }

div.enterbox {
   width: max-content;
   margin:0 auto;
   margin-top: 10px;
   border-radius: 15px;
   padding: 13px;
   padding-bottom: 30px;
   box-shadow: -7px -7px 10px white, 5px 5px 10px
      rgba(198, 196, 196, 0.585);
   gap:20px;
}
div.box-left{
	width: max-content;
	margin:0 auto;
	margin-top: 10px;
	margin-right: 10px;
	border-radius: 15px;
    padding: 15px;
    box-shadow: -7px -7px 10px white, 5px 5px 10px
       rgba(198, 196, 196, 0.585);
}
div.box-right{
	width: max-content;
	margin:0 auto;
	margin-top: 10px;
	margin-right: 10px;
	border-radius: 15px;
    padding: 15px;
    box-shadow: -7px -7px 10px white, 5px 5px 10px
       rgba(198, 196, 196, 0.585);
}
div.box-calender{
	font-size: 20px; 
	width: 80px;
	text-align: center;
	height:29px;
	margin:0 auto;
	margin-top: 10px;
	margin-right: 10px;
	border-radius: 17px;
    padding: 15px;
    box-shadow: -7px -7px 10px white, 5px 5px 10px
       rgba(198, 196, 196, 0.585);
}
div.box-title{
	font-size: 20px; 
	width: 394px;
	height:47px;
	margin:0 auto;
	margin-top: 9px;
	border-radius: 17px;
    padding: 8px;
    box-shadow: -7px -7px 10px white, 5px 5px 10px
       rgba(198, 196, 196, 0.585);
}
div.box-calender-d{
	height: 28px;
	font-size :20px;
	width: 280px;
	margin-top: 12px;
	border-radius: 15px;
    padding: 15px;
    padding-top :16px; 
    box-shadow: -7px -7px 10px white, 5px 5px 10px
       rgba(198, 196, 196, 0.585);
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


div.bet {
   display: flex;
   justify-content: space-between;
   align-items: : center;
}



 select {
   width: 300px;
   height:61px;
   font-size:26px;
   margin-top: 10px;
   padding-left:12px;
   border: 0 solid black; 
   border-radius: 21px;
   box-shadow: -7px -7px 10px white, 5px 5px 10px
      rgba(198, 196, 196, 0.585);
   background-color: inherit;
}
input {
   width: 290px;
   height:62px;
   font-size: 26px;
   margin-top: 10px;
   border: 0 solid black; 
   border-radius: 17px;
   box-shadow: -7px -7px 10px white, 5px 5px 10px
      rgba(198, 196, 196, 0.585);
   background-color: unset;
   padding-left: 22px;
}
input::placeholder{
	color:black;
}
 h1	{
 	margin:0 auto;
 	padding-left : 95px;
	letter-spacing: 5px; 	
	font-size: 36px; 
 }
.fsize {
   text-align: center;
   width: 120px;
   height: 63px;
   font-size: 22px;
   margin-top: 57px;
   padding-right: 10px;
   border-radius: 15px;
   background: linear-gradient(to right,#dae2f8, #d7dde8);
}

.Ssize {
   width: 170px;
   height: 45px;
   font-size: 18px;
   margin: 15px 10px  20px; 
   border-radius: 5px;
   padding-left: 14px;
}
	div.wbox{
   	margin: 100px auto;
	}
	.flex{
		display: flex;
		margin-top: 27px;
	}	

.calendar {
   border: 0px solid #ccc;
   width: 490px;
   height: 455px;
   padding: 10px;
   margin: 0 8px;
   margin-top: 10px;
   background-color: #f9f9f9;
   border-radius: 5px;
   box-shadow: -7px -7px 10px white, 5px 5px 10px
      rgba(198, 196, 196, 0.585);
   }

.calendar .month {
   text-align: center;
   font-size: 23px;
   margin-bottom: 14px;
   margin-top: 10px;
}


.calendar .days {
   display: flex;
   flex-wrap: wrap;
   padding-top: 10px;
  
}

.calendar .day {
   width: 64px;
   height: 55px;
   line-height: 30px;
   text-align: center;
   margin: 3px;
   cursor: pointer;
}

.calendar .day:hover {
   background-color: #ddd;
}

.calendar .day.active {
   background-color: #007bff;
   color: #fff;
}

.calendar .start {
   background-color: #28a745;
   color: #fff;
}

.calendar .end {
   background-color: #dc3545;
   color: #fff;
}

.calendar select {
   margin-bottom: 5px;
}
.calendar .day.sunday {
    color: red; /* 일요일의 글자 색상 변경 */
}

.calendar .day.saturday {
    color: blue; /* 토요일의 글자 색상 변경 */
}

/* 9 */
.btn-9 {
  border: none;
  transition: all 0.3s ease;
  overflow: hidden;
}
.btn-9:after {
  position: absolute;
  content: " ";
  z-index: -1;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
   background-color: #1fd1f9;
background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
  transition: all 0.3s ease;
}
.btn-9:hover {
  background: transparent;
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
  color: #fff;
}
.btn-9:hover:after {
  -webkit-transform: scale(2) rotate(180deg);
  transform: scale(2) rotate(180deg);
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
}
.noncolor{
background-color: inherit;
}
</style>


<div class="frame">
   <div class="dg-tkHome-banner">
      <img src="${cpath }/upload/mainImage/socialMain.png">
   </div>
   
	<form method="POST">
		<div class="enterbox wbox"> 
		
			<div class="bet">   
            	<div class="box-left">
            
            		<div class="box-title"><h1>동행구하기</h1></div>           	
				
               		<!-- 동행게시글 제목, 정원수, 카테고리  -->
	            <div class="flex">
	            	<div class="box-calender">제목</div>   
	                <p><input type="text" name="title" placeholder="제목" value="${dto.title }" required autofocus></p>
	           </div>     
	                <p>
	                   <input type="hidden" name="writer" value="${writer}" >
	                </p>
	                <p>
	                   <input type="hidden" name="choice" value="with">
	                </p>
	            <div class="flex"> 
	            	<div class="box-calender">정원수</div> 	   
	                <p><input type="number" name="peopleNum" placeholder="정원수" value="${dto.peopleNum }" required></p>
	            </div> 
	            
	            <div class="flex">  
	            	<div class="box-calender">운동</div>  
	                <p>
	                	<select name="category">
							<option value="헬스" ${dto.category == '헬스' }>헬스</option>
							<option value="요가" ${dto.category == '요가' }>요가</option>
							<option value="크로스핏" ${dto.category == '크로스핏'}>크로스핏</option>
						</select>
	                </p>
	             </div>   
	                <div class="bet">
		                <p>
		                  <input type="submit" class="fsize custom-btn btn-9" value="동행준비" >
		                </p>
	                    <p>
		                  <a href="${cpath}/social/with/wlist">
		                     <input type="button" class="fsize custom-btn btn-9" value="나가기">
		                  </a>
	        	        </p>
	                </div>
				</div>

	            <div class="box-right">
					   	<div class="bet">
               		<!-- 달력 구현 하기 -->
	               		<select id="year" class="Ssize" onchange="updateCalendar()">
			                <%int currentYear = java.time.LocalDate.now().getYear();%>
			                <%for (int year = currentYear; year <= currentYear + 20; year++) {%>
			                <option value="<%=year%>"><%=year%>년
			                </option>
			                <%}%>
		               </select>
	               
		               <select id="month" class="Ssize" onchange="updateCalendar()">
		                  <option value="1">1월</option>
		                  <option value="2">2월</option>
		                  <option value="3">3월</option>
		                  <option value="4">4월</option>
		                  <option value="5">5월</option>
		                  <option value="6">6월</option>
		                  <option value="7">7월</option>
		                  <option value="8">8월</option>
		                  <option value="9">9월</option>
		                  <option value="10">10월</option>
		                  <option value="11">11월</option>
		                  <option value="12">12월</option>
		               </select>
					</div>
					<div class="calendar" >
	                	<div class="month"></div>
	                	<div class="weekdays" id="weekdays"></div>	
	                	<div class="days" id="calendarDays"></div>
	               	</div>
	
            	</div>
	                <input type="hidden" name="start_date" id="startDate" >
	                <input type="hidden" name="end_date" id="endDate" >
	                
   			</div>
		</div>
	</form>
</div>


<%@ include file="../../footer.jsp" %>

<script>
// 초기화 함수
function initCalendar() {
    updateCalendar();
}

window.addEventListener('DOMContentLoaded', function () {
    renderWeekdays();
    initCalendar();
});

// 요일을 렌더링합니다.
function renderWeekdays() {
    var weekdaysArray = ['일', '월', '화', '수', '목', '금', '토'];
    var weekdaysContainer = document.getElementById('weekdays');
    for (var i = 0; i < weekdaysArray.length; i++) {
        var weekdayElement = document.createElement('div');
        weekdayElement.classList.add('weekday');
        weekdayElement.textContent = weekdaysArray[i];
        

        // 일요일과 토요일에만 다른 색상 적용
        if (weekdaysArray[i] === '일') {
            weekdayElement.style.color = 'red'; // 일요일의 글자 색상을 빨간색으로 설정
        } else if (weekdaysArray[i] === '토') {
            weekdayElement.style.color = 'blue'; // 토요일의 글자 색상을 파란색으로 설정
        }
        
        weekdaysContainer.appendChild(weekdayElement);
    }
}

//달력 업데이트 함수 수정
function updateCalendar() {
    var year = document.getElementById('year').value;
    var month = document.getElementById('month').value;
    var daysInMonth = new Date(year, month, 0).getDate();
    var firstDayOfWeek = new Date(year, month - 1, 1).getDay(); // 첫째 날의 요일 (0: 일요일, 1: 월요일, ..., 6: 토요일)
    var calendarDays = document.getElementById('calendarDays');
    calendarDays.innerHTML = '';
	
    // 공백으로 시작하는 날짜 삽입
    for (var i = 0; i < firstDayOfWeek; i++) {
        var emptyDayElement = document.createElement('div');
        emptyDayElement.classList.add('day', 'empty');
        calendarDays.appendChild(emptyDayElement);
    }
    
    // 날짜 삽입
    for (var i = 1; i <= daysInMonth; i++) {
        var dayElement = document.createElement('div');
        dayElement.classList.add('day');
      
        // 일요일인 경우 'sunday' 클래스 추가
        if ((firstDayOfWeek + i - 1) % 7 === 0) {
            dayElement.classList.add('sunday');
            dayElement.style.color = 'red'; // 일요일의 글자 색상 변경
        }

        // 토요일인 경우 'saturday' 클래스 추가
        if ((firstDayOfWeek + i) % 7 === 0) {
            dayElement.classList.add('saturday');
            dayElement.style.color = 'blue'; // 토요일의 글자 색상 변경
        }
        
        dayElement.textContent = i;
        dayElement.dataset.day = i; // 날짜를 데이터 속성에 저장
        dayElement.onclick = function() {
            var clickedDay = parseInt(this.dataset.day); // 클릭한 날짜를 정수로 파싱하여 저장
            selectDate(clickedDay); // 클릭한 날짜를 선택 함수에 전달
        };
        calendarDays.appendChild(dayElement);
    }

    document.querySelector('.month').textContent = year + '년 ' + month + '월'; // 달력의 현재 년도와 월을 표시
}

//클릭한 날짜를 처리하는 함수
function selectDate(day) {
    var startDateInput = document.getElementById('startDate');
    var endDateInput = document.getElementById('endDate');
    var targetDayElement = document.querySelector('.day[data-day="' + day + '"]');
  	
 // 클릭한 날짜가 이미 선택된 날짜인지 확인
    var isSelected = targetDayElement.classList.contains('selected');
    

       // 클릭한 날짜가 시작일 이전이고 종료일이 설정되어 있지 않은 경우 처리하지 않음
    if (startDateInput.value && !endDateInput.value) {
        var selectedDate = new Date(startDateInput.value); // 시작일의 날짜를 가져옴
        var clickedDate = new Date(year, month - 1, day); // 클릭한 날짜의 Date 객체 생성
        if (clickedDate < selectedDate) {
           
            return;
        }
    }
    
 // 시작일과 종료일이 모두 설정된 경우 어떤 날짜를 클릭하더라도 선택이 해제되도록 처리
    if (startDateInput.value && endDateInput.value) {
        startDateInput.value = '';
        endDateInput.value = '';
        document.querySelectorAll('.day').forEach(function(el) {
            el.classList.remove('selected', 'start', 'end');
        });
        return;
    }
       
       
    // 클릭한 날짜가 이미 선택된 날짜라면 해당 날짜들을 초기화하고 종료
    if (isSelected) {
        startDateInput.value = '';
        endDateInput.value = '';
        document.querySelectorAll('.day').forEach(function(el) {
            el.classList.remove('selected', 'start', 'end');
        });
        return;;
    } 
    
    
    var today = new Date(new Date().toLocaleString("en-US", {timeZone: "Asia/Seoul"})); // 한국 시간 기준으로 오늘 날짜 가져오기
    console.log(today)
    var year = document.getElementById('year').value;
    var month = document.getElementById('month').value;
    var selectedDate = new Date(year, month - 1, day); // 선택한 날짜의 Date 객체 생성
   console.log(typeof(selectedDate))
   
     var clickedDate = new Date(year, month - 1, day);
    let mValue = month;
    if (mValue < 10) {
        mValue = '0' + mValue; // 한 자리 수 월을 두 자리 수로 변경
    }
    let dValue = day;
    if (dValue < 10) {
        dValue = '0' + day; // 한 자리 수 일을 두 자리 수로 변경
    }
    
    // 선택한 날짜가 오늘 날짜 이전인 경우 처리하지 않음
    today.setHours(0)		// 오늘의 시, 분, 초를 받아온다  오늘의 정시정각을 받아온다
    today.setMinutes(0)
    today.setSeconds(0)
    if (selectedDate < today) {
    	//console.log(selectedDate.getTime(), today.getTime())
        return;
    }
    
    // 시작일이 설정된 후에는 끝일이 시작일 이전의 날짜를 선택하지 못하도록 처리
    if (startDateInput.value && selectedDate < new Date(startDateInput.value)) {
        return;
    }  
    
    // 클릭한 날짜가 시작일이나 종료일이 이미 설정되어 있는 경우 초기화
    if (startDateInput.value && endDateInput.value) {
        startDateInput.value = '';
        endDateInput.value = '';
        document.querySelectorAll('.day').forEach(function(el) {
        	el.classList.remove('selected', 'start', 'end');
        });
    } else {
        // 시작일이나 종료일이 설정되어 있지 않은 경우 설정
        if (!startDateInput.value) {
           let selectStart = year + '-' + mValue + '-' + dValue;
            startDateInput.value = selectStart;
            targetDayElement.classList.add('start');
        } else  {
           let endStart = year + '-' + mValue + '-' + dValue;
            endDateInput.value = endStart;
            targetDayElement.classList.add('end');
        }
    }
 // 선택된 날짜를 표시
    targetDayElement.classList.add('selected');

	
}

// 초기화 함수 호출
initCalendar();

// select 요소 변경 시 달력 업데이트
document.getElementById('month').addEventListener('change', updateCalendar);
document.getElementById('year').addEventListener('change', updateCalendar);
</script>







</body>
</html>