<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Camily</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<style type="text/css">
.section-reply-title {
	/* margin-bottom: 30px; */
    text-align: center;
}

.section-reply-title h5 {
	color: #000000;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
}

.section-reply-title h6 {
	color: #848484;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
}


</style>

</head>
<body class="animsition">

	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End TopBar-->
	
	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->

	<!-- Shoping Cart -->
	<form class="bg0 p-t-35 p-b-85" action="totalpurchase" method="post" id="goobsform">
			          <div class="section-reply-title">
								<h5>????????????????</h5><h6>?????????????????? ?????? ???????????? ??????????????? ???????????????!</h6>
						</div>
			          <c:forEach items="${detailinformation }" var="information">
		                <div class="col-9" style="padding-top: 30px; margin: auto; font-family: Poppins-Bold;">
                        <div class="bg-light rounded p-4">                       
                            <div class="table-responsive">
                                <table class="table">
                                <colgroup>
									<col style="width: 10%">
									<col style="width: 15%">
									<col style="width: 10%">
									<col style="width: 15%">
									<col style="width: 10%">
									<col style="width: 30%">
								</colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col" style="border-top : none;">????????????</th>
                                            <th scope="col" style="border-top : none;">???????????????</th>
                                            <th scope="col" style="border-top : none;">????????????</th>
                                            <th scope="col" style="border-top : none;">????????????</th>
                                            <th scope="col" style="border-top : none;">?????????</th>
                                            <th scope="col" style="border-top : none;">????????????
                                            <button type="button" class="cl0 size-60 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" onclick="addCheck('${information.dicode}')">????????????</button>
                                            </th>
                                            <th scope="col" style="border-top : none;"></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">
                                             <a href="campingDetailPage?gcode=${information.dicode}">  
                                              <img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${information.diimage }" alt="IMG" style="width: 60px;">
                                             </a>
                                            </th>
                                             <c:choose>
                                              <c:when test="${information.gstate == 0}">
                                                 <td>
                                                   <a href="campingDetailPage?gcode=${information.dicode}">                                                
                                                      ${information.diname }
                                                   </a>
                                                   <br>[???????????? ???????????????.]
                                                 </td>
                                              </c:when>
                                               <c:otherwise>
                                                <td>
                                                <a href="campingDetailPage?gcode=${information.dicode}">
                                                ${information.diname }
                                                </a>
                                                </td>                                              
                                               </c:otherwise>
                                             </c:choose>
                                            <td>${information.diprice }???</td>
                                            <td>${information.diamount }???</td>
                                            <td>${information.formatter }???</td>
                                            <td id="${information.dicode}1">${information.diaddr }</td>                                        	
                                           	<td>
                                           	<a class="close text-right font-weight-bold mt-2 mr-2"
											 href="deletepoket?dicode=${information.dicode }">
											<span aria-hidden="true">x&nbsp;</span>
											</a>                                  	
                                           	<%-- <a href="deletepoket?dicode=${information.dicode }" class="btn btn-dark">????????????</a> --%>                                          	
                                           	</td>
                                           	<th>
                                            <c:if test="${information.gstate == 1}">                                       
										 	   <input type="hidden" value="${sessionScope.loginId }"     name="dimid">
									 		   <input type="hidden" value="${information.diaddr }" id="${information.dicode}2" name="diaddr">
									 		   <input type="hidden" value="${information.dicode }"       name="dicode">
									 		   <input type="hidden" value="${information.diamount }"     name="diamount">
									 		   <input type="hidden" value="${information.ditotalprice }" name="ditotalprice" id="ditotal">
									 		   <input type="hidden" value="${information.diname }"       name="diname" id="diname">
									 		   <input type="hidden" value="${information.diimage }"      name="diimage">
									 		   <input type="hidden" value="${sumTotal }" id="sumTotal">
									 	     </c:if>
											</th>
									     </tr>  
									                                                                
                                    </tbody>
                                </table>
                            </div>
                        </div>                      
                      </div>

                    </c:forEach>			        
		<br>
		<br>
		<br>			
	 <c:if test="${fn:length(detailinformation) == 0}">
						<p style="text-align: center;">???????????? ????????? ????????????????????????!</p>
	  </c:if> 	                 
    <!-- Load more --> 
   <c:if test="${fn:length(detailinformation) > 0}">
	<div class="flex-c-m flex-w w-full p-t-45" >
		<button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn1 p-lr-15 trans-04" type="button" 
		onclick="requestPay()">????????????</button> 
	</div>	                   			       		    
   </c:if>                       
	<!-- Load more -->
	<br>
	<br>
	<br>
	
	
	</form>
	
    <!-- ???????????? ?????? ?????? -->
    <div class="modal fade" id="addCheck" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 1200">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width:50%">
						</a>
						
					</div>
					<div class="modal-body mx-3">

						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="postcode"
									class="form-control validate" placeholder="????????????" name="mpostcode">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="button" class="btn btn-dark btn-user btn-block"
									onclick="sample6_DaumPostcode()" value="???????????? ??????">
							</div>
						</div>
						<div class="md-form mb-3">
							<input type="text" id="address"
								class="form-control validate" placeholder="??????" name="maddress">
						</div>

						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="detailAddress"
									class="form-control validate" placeholder="????????????" name="mdetailAddr">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="extraAddress"
									class="form-control validate" placeholder="????????????" name="mextraAddr">
							</div>
						</div>
						<input type="hidden" id = checkdicode>
						<div class="md-form mb-1 text-center">
							<button class="btn btn-dark" onclick="addChange()">?????? ??????</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ???????????? ?????? ??? -->	

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>

	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
	<script>
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
				delegate : 'a', // the selector for gallery item
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
				function() {
					var nameProduct = $(this).parent().parent().find(
							'.js-name-b2').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-b2');
						$(this).off('click');
					});
				});

		$('.js-addwish-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							'.js-name-detail').html();

					$(this).on('click', function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass('js-addedwish-detail');
						$(this).off('click');
					});
				});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(
				function() {
					var nameProduct = $(this).parent().parent().parent()
							.parent().find('.js-name-detail').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to cart !", "success");
					});
				});
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>

</body>

	<script type="text/javascript">
		function addCheck(dicode){
			$("#checkdicode").val(dicode);
			$("#addCheck").modal('show');
		}
		
		</script>
		
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
		<!-- ?????? ??????api -->
	<script>
		function sample6_DaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

							// ??? ????????? ?????? ????????? ?????? ????????? ????????????.
							// ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
							var addr = ''; // ?????? ??????
							var extraAddr = ''; // ???????????? ??????

							//???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
							if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
								addr = data.roadAddress;
							} else { // ???????????? ?????? ????????? ???????????? ??????(J)
								addr = data.jibunAddress;
							}

							// ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
							if (data.userSelectedType === 'R') {
								// ??????????????? ?????? ?????? ????????????. (???????????? ??????)
								// ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
								if (data.bname !== ''
										&& /[???|???|???]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// ???????????? ??????, ??????????????? ?????? ????????????.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// ????????? ??????????????? ?????? ????????? ?????????.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// ??????????????? ?????? ????????? ?????? ????????? ?????????.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// ????????? ???????????? ????????? ????????????.
							document.getElementById("detailAddress")
									.focus();
						}
					}).open();
		}
	</script>		
		
	<script type="text/javascript">
	
	 function addChange(){
		 
		 var total = "";
		 
		 var postcode2 = $(postcode).val();
		 total = total +  "(" + postcode2 + ")"; 
		 var address2 = $(address).val();
		 total = total + " " +address2;
		 var detailAddress2 = $(detailAddress).val();
		 total = total + " " + detailAddress2;
         var extraAddress2 = $(extraAddress).val();
         total = total + " " + extraAddress2;
         
		 console.log("postcode2 :"+ postcode2);
		 console.log("address2 :"+ address2);
		 console.log("detailAddress2 :"+ detailAddress2);
		 console.log("extraAddress :"+ extraAddress);
		 console.log("total :"+ total);
		
		 var dicode = $("#checkdicode").val();
		 console.log(dicode);
		 console.log(dicode + "1");
		 console.log(dicode + "2");
		 
		 $("#"+dicode+"1").text(total);
		 $("#"+dicode+"2").val(total);
		 $("#addCheck").modal("hide");
		 
		
	 }	
</script>
	
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- ???????????? ????????? -->
<script type="text/javascript">
var IMP = window.IMP;
IMP.init("imp10142481"); 
function requestPay() {
	var ditotal = $("#ditotal").val();
	var diname = $("#diname").val();
	
	console.log("ditotal :"+ ditotal);
	console.log("diname :"+ diname);
	
    // IMP.request_pay(param, callback) ????????? ??????
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        name: diname,
        amount: ditotal
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("?????????????????????.");
            $("#goobsform").submit();
        } else {
        	alert("?????????????????????.");
        	//$("#goobsform").submit();
        }
    });	
}
</script>
	
</html>
