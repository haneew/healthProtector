<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../userHeader.jsp" %>
<html>
<head>
    <title>일일 사용량 초과</title>
    <style>
     :root {
        /*========== Colors ==========*/
        /*Color mode HSL(hue, saturation, lightness)*/
        --first-color: hsl(82, 60%, 28%);
        --title-color: hsl(0, 0%, 15%);
        --text-color: #8A7575;
        --body-color: hsl(0, 0%, 95%);
        --container-color: hsl(0, 0%, 100%);

        /*========== Font and typography ==========*/
        /*.5rem = 8px | 1rem = 16px ...*/
        --body-font: "Poppins", sans-serif;
        --h2-font-size: 1.25rem;
        --small-font-size: .813rem;
        }

        /*========== Responsive typography ==========*/
        @media screen and (min-width: 1120px) {
        :root {
            --h2-font-size: 1.5rem;
            --small-font-size: .875rem;
        }
        }

        
        body {
            font-family: var(--body-font);
            background-color: var(--body-color);
            color: var(--text-color);
        }

        img {
            display: block;
            max-width: 100%;
            height: auto;
        }

        .frame {
            display: block;
            width: 800px;
            margin: auto;
        }
        .overPage_Frame {
            width: 100%;
            margin: 100px auto;
            padding: 40px;
            text-align: center;
            border-radius: 20px;
            box-shadow: -7px -7px 10px white, 5px 5px 10px rgba(198, 196, 196, 0.585);
           
        }
        .overPage_Frame h2,
        .overPage_Frame p,
        .overPage_Frame a {
            margin: 20px auto;
            color: #8A7575;
        }
        .overPage_Frame h2 {
            font-size: 30px;
        }
        .overPage_Frame p {
            font-size: 25px;
        }
        .subTitle p {
        	font-size: 15px;
        }
        .exit {
            display: flex;
            justify-content: space-between;
            font-size: 30px;
        }
        i:hover {
        	color: red;
        	font-weight: bold;
        }
       
        /*===========================*/
		.container {
		    display: none; /* 추가 */
		    opacity: 0; /* 추가 */
		    transition: opacity 1s ease-out; /* 추가 */
		    place-items: center;
		    margin-inline: 1.5rem;
		}
        .card__container {
            display: grid;
            row-gap: 3.5rem;
        }

        .card__article {
            position: relative;
            overflow: hidden;
        }

        .card__img {
            width: 328px;
            border-radius: 1.5rem;
        }

        .card__data {
            width: 280px;
            background-color: var(--container-color);
            padding: 1.5rem 2rem;
            box-shadow: 0 8px 24px hsla(0, 0%, 0%, .15);
            border-radius: 1rem;
            position: absolute;
            bottom: -9rem;
            left: 0;
            right: 0;
            margin-inline: auto;
            opacity: 0;
            transition: opacity 1s 1s;
        }

        .card__description {
            display: block;
            font-size: var(--small-font-size);
            margin-bottom: .25rem;
        }

        .card__title {
            font-size: var(--h2-font-size);
            font-weight: 500;
            color: var(--title-color);
            margin-bottom: .75rem;
        }

        .card__button {
            text-decoration: none;
            font-size: var(--small-font-size);
            font-weight: 500;
            color: var(--first-color);
        }

        .card__button:hover {
            text-decoration: underline;
        }

        /* Naming animations in hover */
        .card__article:hover .card__data {
            animation: show-data 1s forwards;
            opacity: 1;
            transition: opacity .3s;
        }

        .card__article:hover {
            animation: remove-overflow 2s forwards;
        }

        .card__article:not(:hover) {
            animation: show-overflow 2s forwards;
        }

        .card__article:not(:hover) .card__data {
            animation: remove-data 1s forwards;
        }

        /* Card animation */
        @keyframes show-data {
            50% {
                transform: translateY(-10rem);
            }
            100% {
                transform: translateY(-7rem);
            }
            }

            @keyframes remove-overflow {
            to {
                overflow: initial;
            }
            }

            @keyframes remove-data {
            0% {
                transform: translateY(-7rem);
            }
            50% {
                transform: translateY(-10rem);
            }
            100% {
                transform: translateY(.5rem);
            }
        }

        @keyframes show-overflow {
            0% {
                overflow: initial;
                pointer-events: none;
            }
            50% {
                overflow: hidden;
            }
        }

        /*=============== BREAKPOINTS ===============*/

        @media screen and (max-width: 340px) {
        .container {
            margin-inline: 1rem;
        }

        .card__data {
            width: 250px;
            padding: 1rem;
        }
        }

        /* For medium devices */
        @media screen and (min-width: 768px) {
            .card__container {
                grid-template-columns: repeat(2, 1fr);
                column-gap: 1.5rem;
            }
        }

        /* For large devices */
        @media screen and (min-width: 1120px) {
            .container {
                height: 80vh;  
            }

            .card__container {
                grid-template-columns: repeat(3, 1fr);
             }
            .card__img {
                width: 348px;
            }
            .card__data {
                width: 316px;
                padding-inline: 2.5rem;
            }
        }
        /*=============== BREAKPOINTS ===============*/

        @media screen and (max-width: 340px) {
            .container {
                margin-inline: 1rem;
            }

            .card__data {
                width: 250px;
                padding: 1rem;
            }
        }

        /* For medium devices */
        @media screen and (min-width: 768px) {
            .card__container {
                grid-template-columns: repeat(2, 1fr);
                column-gap: 1.5rem;
            }
        }

        /* For large devices */
        @media screen and (min-width: 1120px) {
            .container {
                height: 80vh;
            }

            .card__container {
                grid-template-columns: repeat(3, 1fr);
            }
            .card__img {
                width: 348px;
            }
            .card__data {
                width: 316px;
                padding-inline: 2.5rem;
            }
        }
        
      

		/* ==============button===================*/
	       .showButton {
		        position: relative;
		        padding: 15px 32px;
		        border-radius: 6px;
		        border: none;
		        color: #fff;
		        cursor: pointer;
		        background-color: #EC3676;
		        transition: all 0.2s ease;
		        font-size: 20px;
		        box-shadow: -3px -3px 5px white, 3px 3px 5px rgba(0, 0, 0, 0.585);
	        }
	        .showButton:active {
	       		 transform: scale(0.96);
	        }
	        .showButton:before,
	        .showButton:after {
		        position: absolute;
		        content: "";
		        width: 150%;
		        left: 50%;
		        height: 100%;
		        transform: translateX(-50%);
		        z-index: -1000;
		        background-repeat: no-repeat;
	        }
	        .showButton.animate::before {
		        top: -70%;
		        background-image: radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, transparent 20%, #EC3676 20%, transparent 30%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, transparent 10%, #EC3676 15%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%);
		        background-size: 10% 10%, 20% 20%, 15% 15%, 20% 20%, 18% 18%, 10% 10%, 15% 15%,
		            10% 10%, 18% 18%;
		        animation: greentopBubbles ease-in-out 0.6s forwards infinite;
		        }
		        @keyframes greentopBubbles {
		        0% {
		            background-position: 5% 90%, 10% 90%, 10% 90%, 15% 90%, 25% 90%, 25% 90%,
		            40% 90%, 55% 90%, 70% 90%;
		        }
		        50% {
		            background-position: 0% 80%, 0% 20%, 10% 40%, 20% 0%, 30% 30%, 22% 50%,
		            50% 50%, 65% 20%, 90% 30%;
		        }
		        100% {
		            background-position: 0% 70%, 0% 10%, 10% 30%, 20% -10%, 30% 20%, 22% 40%,
		            50% 40%, 65% 10%, 90% 20%;
		            background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
		        }
	        }
	        .showButton.animate::after {
		        bottom: -70%;
		        background-image: radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, transparent 10%, #EC3676 15%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%),
		            radial-gradient(circle, #EC3676 20%, transparent 20%);
		        background-size: 15% 15%, 20% 20%, 18% 18%, 20% 20%, 15% 15%, 20% 20%, 18% 18%;
		        animation: greenbottomBubbles ease-in-out 0.6s forwards infinite;
	        }
	        @keyframes greenbottomBubbles {
		        0% {
		            background-position: 10% -10%, 30% 10%, 55% -10%, 70% -10%, 85% -10%,
		            70% -10%, 70% 0%;
		        }
		        50% {
		            background-position: 0% 80%, 20% 80%, 45% 60%, 60% 100%, 75% 70%, 95% 60%,
		            105% 0%;
		        }
		        100% {
		            background-position: 0% 90%, 20% 90%, 45% 70%, 60% 110%, 75% 80%, 95% 70%,
		            110% 10%;
		            background-size: 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%, 0% 0%;
		        }
	        }
      /*   #EC3676  #EC3676*/
    /* =========================================================*/
    </style>
</head>
<body>

   <div class="frame">
        <div class="overPage_Frame">
            <div class="exit">
                <div></div>
                <div>
                    <a href="${cpath }/ticket/tkHome"><i class="fa-regular fa-circle-xmark"></i></a>
                </div>
            </div>
            <h2>일일 사용 가능 티켓 수를 초과했습니다.</h2>
            <p>Please try again tomorrow</p>
            <div class="subTitle">
        	 <p>건강 정보를 원하신다면 아래를 클릭 해주세요</p>
        	 <button class="showButton">Click Me</button>
      		 </div>
        </div>
        
    </div> 

        <div class="container">
            <div class="card__container">
               <article class="card__article">
                  <img src="https://images.unsplash.com/photo-1511688878353-3a2f5be94cd7?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image" class="card__img">
    
                  <div class="card__data">
                     <span class="card__description">Naver 생활</span>
                     <h2 class="card__title">Naver 생활</h2>
                     <a href="https://news.naver.com/section/103" class="card__button">Read More</a>
                  </div>
               </article>
    
               <article class="card__article">
                  <img src="https://images.unsplash.com/photo-1557753478-d111aef068be?q=80&w=2848&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image" class="card__img">
    
                  <div class="card__data">
                     <span class="card__description">국가건강정보포털</span>
                     <h2 class="card__title">국가건강정보포털</h2>
                     <a href="https://health.kdca.go.kr/healthinfo/" class="card__button">Read More</a>
                  </div>
               </article>
               <article class="card__article">
                <img src="https://plus.unsplash.com/premium_photo-1709560427635-b6b9553aa557?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="image" class="card__img">
    
                <div class="card__data">
                   <span class="card__description">세브란스 건강 정보</span>
                   <h2 class="card__title">세브란스 건강 정보</h2>
                   <a href="https://health.severance.healthcare/health/index.do" class="card__button">Read More</a>
                </div>
             </article>
            </div>
         </div>

		
	 <script>
      const button = document.querySelector(".showButton");

      button.addEventListener("click", (e) => {
        e.preventDefault;
        button.classList.add("animate");
        setTimeout(() => {
          button.classList.remove("animate");
        }, 600);
      });
    </script>
    
    <script>
		document.addEventListener('DOMContentLoaded', function () {
		    document.querySelector('.showButton').addEventListener('click', function() {
		        var container = document.querySelector('.container');
		        container.style.display = 'grid'; // grid 또는 원래 설정했던 display 값으로
		        setTimeout(function() { // display 변경 후 opacity 변경을 위한 지연
		            container.style.opacity = '1';
		        }, 10); // display 속성 변경 후 즉시 opacity 변경을 위한 짧은 지연
		    });
		});
	</script>
     




    
    
    
<%@ include file="../footer.jsp" %>
</body>
</html>