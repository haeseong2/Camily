<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>캠핑장 예약</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/mages/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!--===============================================================================================-->	
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<body class="animsition">
	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End TopBar-->
	
	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->
	
	
	<!-- c:set >> 사용할 변수선언 -->
    <c:set var="today" value="<%=new Date() %>"></c:set>
	<!-- Shoping Cart -->
	<form action="campingReservation" method="post" class="bg0 p-t-75 p-b-85" id="campingReservationForm">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="bor10 p-lr-40 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="mtext-109 cl2 p-b-30 p-t-30" style="font-weight: bold;">${caname}</div>
							<div class="row">
								<div class="col-xl-5 m-lr-auto m-b-50">
									<c:choose>
										<c:when test="${fn:substring(RoomInfo.crimage,0,4) == 'http'}">
											<img src="${RoomInfo.crimage}" alt="캠핑장 이미지" width="100%">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/caimageUpload/${RoomInfo.crimage}" alt="캠핑장 이미지" width="100%">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-xl-7 m-lr-auto m-b-50">
									<div style="font-size: 25px; font-weight: bold;">${RoomInfo.crname} - ${RoomInfo.crnum}</div>
									<div style="font-size: 20px;">예약일자 : <span>${startday}</span> ~ <span>${endday}</span></div>
									<div style="font-size: 20px;">예약인원 :  ${people}명</div>
									
									<input type="hidden" name="recode" id="recode">
									<input type="hidden" name="recacode" value="${cacode}">
									<input type="hidden" name="remid" value="${sessionScope.loginId}">
									<input type="hidden" name="recrname" value="${RoomInfo.crname}">
									<input type="hidden" name="recrnum" value="${RoomInfo.crnum}">
									<input type="hidden" name="startday" value="${startday}">
									<input type="hidden" name="endday" value="${endday}">
									<input type="hidden" name="repeople" value="${people}">
								</div>
							</div>
							<hr>
							<div class="mtext-110 cl2 p-b-30">
								<span style="font-weight: bold;">예약자 정보</span> 
								<button class="btn btn-danger" type="button" onclick="myInfo()" style="float: right; font-size: 15px;">내 정보와 동일</button>
							</div>
							<div>
								<span>예약자 이름</span>
								<span style="color: red;">(*필수)</span>
							</div>
							<div class="bor8 m-b-20 how-pos4-parent">
								<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" name="remname" id="mname" placeholder="예약자 이름을 입력해주세요.">
							</div>
							<div>
								<span>예약자 전화번호</span>
								<span style="color: red;">(*필수)</span>
							</div>
							<div class="bor8 m-b-20 how-pos4-parent">
								<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" name="remtel" id="mtel" placeholder="010-0000-0000">
							</div>
							<div>예약자 이메일</div>
							<div class="bor8 m-b-20 how-pos4-parent">
								<input class="stext-111 cl2 plh3 size-116 p-l-30 p-r-30" type="text" name="rememail" id="memail" placeholder="예약자 이메일을 입력해주세요.">
							</div>
							<div>요청사항</div>
							<div class="bor8 m-b-30">
								<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" name="rerequest" placeholder="요청사항이 있으면 적어주시기 바랍니다. (500자 이내)"></textarea>
							</div>
						</div>

						<div class="bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="mtext-109 cl2 p-b-30 p-t-30"> 주의사항 </div>
							<div> - 입실시간 : 13:00 ~ 19:00</div>
							<div> - 퇴실시간 : 11:00</div>
							<div> - 매너타임 : 22:00 ~ 다음날 07:00</div>
							<div> - 예약인원 외 방문객은 입실할 수 없습니다.(인원에 맞게 사이트 예약)</div>
							<div> - 인원을 초과할 경우 당일 환불규정에 의해 환불처리 합니다.</div>
							<div> - 미성년자는 보호자 동반없이 단독 입실은 불가합니다. </div>
							<div> - 캠핑장의 출입은 반드시 출입구를 이용하셔야 하며, 관리자의 안내에 따라 주시기 바랍니다.</div>
							<div> - 자동차의 출입은 가능한 23:00부터 07:00까지 삼가 주시기 바랍니다.</div>
							<div> - 캠핑장내에서의 차량통행은 서행(20km 이하)이며, 불필요한 자동차 사용을 삼가주시기 바랍니다.</div>
							<div> - 잔디밭의 차량 및 자전거 진입을 금지해 주시기 바랍니다.</div>
							<div> - 각 사이트별 차량은 1대만 주차 가능하며, 추가 차량은 공용주차장을 이용해주시기 바랍니다.</div>
							<div> - 특별히 허가된 야간오락 장소에서도 23:00부터 07:00까지는 금지되어 있습니다.</div>
							<div> - 쓰레기는 지정된 장소에 종류별로 분류하여 내 놓으셔야 합니다.</div>
							<div> - 개별 전기는 총600w 이하로 사용할 수 있습니다.</div>
							<div> - 캠프장내에서 정치적 또는 종교적인 홍보 등은 금지되어 있습니다.</div>
							<div> - 관리자의 사전 허가 없이는 상업적인 홍보 또는 물품의 판매를 할 수 없습니다.</div>
							<div> - 관리자는 사용자의 소유물에 대한 유실 또는 피해에 대하여 책임을 지지 않습니다.</div>
							<div> - 시설에 대한 피해에 대해서는 피해를 입힌 사람들에게 비용이 청구됩니다.</div>
							<div> - 이용객의 부주의로 일어나는 사고에 대해서는 책임을 지지않습니다.</div>
							<div> - 위급을 요하는 경우와 호우·강풍 등으로 피난이 필요한 경우 관리자의 지시에 따라 주시기 바랍니다.</div>
							<div style="font-weight: bold;">위 이용약관을 위반할 경우 추 후 예약이 불가합니다. 감사합니다.</div>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30" style="font-weight: bold;">
							결제정보
						</h4>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									환불정책
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<p class="stext-111 cl6 p-t-2">비수기</p>
								<p class="stext-111 cl6 p-t-2">2일전 : 100%</p>
								<p class="stext-111 cl6 p-t-2">1일전 : 90%</p>
								<p class="stext-111 cl6 p-t-2">예약당일 : 80%</p>
								<p class="stext-111 cl6 p-t-2">성수기</p>
								<p class="stext-111 cl6 p-t-2">10일전 : 100%</p>
								<p class="stext-111 cl6 p-t-2">7일전 : 80%</p>
								<p class="stext-111 cl6 p-t-2">5일전 : 60%</p>
								<p class="stext-111 cl6 p-t-2">3일전 : 40%</p>
								<p class="stext-111 cl6 p-t-2">1일전 / 당일 : 10%</p>
							</div>
						</div>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									결제금액 :
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									<%-- ${totalPrice}원 --%>
									${divisionsum}원
									<input type="hidden" name="totalprice" id="totalprice" value="${totalPrice}">
								</span>
							</div>
						</div>

						<button type="button" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" onclick="requestPay()">
							예약하기
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
		
	
		

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>
</body>
<script type="text/javascript">
	function myInfo() {
		var loginId = '${sessionScope.loginId}'	// session loginId값
		$.ajax({
				type: "get",
				url: "getMyInfo",
				data: {
					"loginId": loginId
				},
				dataType: "json",
				async: false,
				success: function (result) {
					console.log(result);
					if(result != null){
						$("#mname").val(result.mname);
						$("#mtel").val(result.mtel);
						$("#memail").val(result.memail);
					}
				}
			});
	}
</script>
<script>IMP.init('imp25108731') </script>
<script>
function requestPay() {
	var mname = $("#mname").val();
	var mtel = $("#mtel").val();
	console.log(mname.length);
	console.log(mtel.length);
	if(mname.length > 0 && mtel.length > 0){
		var recode = "";
		$.ajax({
			type: "get",
			url: "getRecode",
			async: false,
			success: function(result){
				console.log(result);
				recode = result;
				$("#recode").val(recode);
			}
		});
		//$("#campingReservationForm").submit();
		
		
		if(recode.length > 0){
			// IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay({ // param
				pg: "html5_inicis",
				pay_method: "card",
				merchant_uid: recode,
				name: "camily - ${caname}",
				amount: $("#totalprice").val(),
				buyer_email: $("#memail").val(),
				buyer_name: $("#mname").val(),
				buyer_tel: $("#mtel").val()// ,
	//			buyer_addr: "서울특별시 강남구 신사동",
	//			buyer_postcode: "01181"
			}, function(rsp) {
				if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
					$("#campingReservationForm").submit();
					// jQuery로 HTTP 요청
	//				jQuery.ajax({
	//					url: "{서버의 결제 정보를 받는 endpoint}", // 예: https://www.myservice.com/payments/complete
	//					method: "POST",
	//					headers: { "Content-Type": "application/json" },
	//					data: {
	//						imp_uid: rsp.imp_uid,
	//						merchant_uid: rsp.merchant_uid
	//					}
	//				}).done(function (data) {
	//				  // 가맹점 서버 결제 API 성공시 로직
	//				})
				  } else {
					alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
					$("#campingReservationForm").submit();
				  }
			});
		}
	}else{
		alert("예약자 이름과 전화번호를 작성 바랍니다.");
	}

	}
</script>
</html>