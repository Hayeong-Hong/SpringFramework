<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/ress.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style_header_footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style_support.css">
    <script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
<!--main-->
    <main>
         <!--내용 부분-->   
        <section>
            <a href="${pageContext.request.contextPath }/index.jsp"><img class="login-logo" src="${pageContext.request.contextPath }/images/main_logo.png" alt="로고"></a>
            <form action="/user/join.do" method="post" class="register-form" name="join-form" id="join-form">
<!--             <form id="joinForm" action= > -->
                <fieldset>
                    <legend>회원가입</legend>
                    <ul class="register-info">
                        <li>
                            <label for="userId">아이디</label>
                            <input type="text" id="userId" name="userId" style="width: 180px;" required >
                            <input type="button" value="중복확인"  id="checkIdbtn" name="checkIdbtn" style="width: 60px;">
                        </li>
                        <li>
                            <label for="userPw">비밀번호</label>
                            <input type="password" id="userPw" name="userPw" required >
                        </li>
                        <p id="pwValidation" name="pwValidation" style="color: red; font-size: 0.8rem; height: 0.9rem">비밀번호는 영문자, 숫자, 특수문자 조합의 9자리 이상으로 설정해주세요.</p>
                        <li>
                            <label for="reg-input-pwchk">비밀번호 확인</label>
                            <input type="password" id="userPwCheck" name="userPwCheck" style="width: 155px;" required >
                            <span id="pwCheckResult" name="pwCheckResult" style="font-size: 12px; margin-left: 5px;">한번 더 입력</span>
                        </li>
                        <li>
                            <label for="userNm">이름</label>
                            <input type="text" id="userNm" name="userNm" required >
                        </li>
                        <li>
                            <label for="userTel">전화번호</label>
                            <input type="tel" id="userTel" name="userTel"  pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000" required >
                        </li>
                        <li>
                            <label for="reg-input-telchk">전화번호 인증</label>
                            <input type="number" id="reg-input-telchk" placeholder="미구현">
                            <input type="button" value="인증번호 전송"  id="reg-input-telchk-btn">
                        </li>
                        <li>
                            <label for="reg-input-bank">계좌번호</label>
                            <input type="number" id="reg-input-bank" placeholder="미구현">
                        </li>
                        <li>
                            <label for="reg-input-add">주소</label>
                            <input type="text" id="userAd" name="userAd" placeholder="미구현" style="width: 180px;">
                            <input type="button" value="주소검색"  id="reg-input-add-btn" style="width: 60px;">
                        </li>
                        <li>
                            <label for="reg-input-addDetail">상세주소</label>
                            <input type="text" id="userAdd" name="userAdd" placeholder="미구현">
                        </li>
                        <li>
                            <label for="userMail">이메일</label>
                            <input type="email" id="userMail" name="userMail" required>
                        </li>
                        <li style="justify-content: center;">
                            <input type="button" value="뒤로가기"  id="go-back-btn">
                            <input type="submit" value="회원가입"  id="regist-sybmit-btn" name="regist-sybmit-btn">
                        </li>
                    </ul>
                </fieldset>
            </form>
        </section>  
    </main>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	<script>
		$(function() {
			//id가 중복됐는지 체크하는 변수
			let checkId = false;
			let pwValidation = false;
			let pwCheck = false;
			
			$("#pwValidation").hide();
			//$("#pwCheckResult").hide();

			//아이디 중복체크
			$("#checkIdbtn").on(
					"click",
					function() {
						if ($("#userId").val() == null
								|| $("#userId").val() == '') {
							alert("아이디를 입력하세요.");
							return;
						}

						$
								.ajax({
									url : '/user/idCheck.do',
									type : 'post',
									data : $("#join-form").serialize(),
									success : function(obj) {
										console.log(obj);

										const data = JSON.parse(obj);
										console.log(data);
										console.log(data.resultIdCheck);

										if (data.resultIdCheck < 1) {
											if (confirm("사용가능한 아이디 입니다."
													+ $("#userId").val()
													+ "를(을) 사용하시겠습니까?")) {
												checkId = true;
												$("#checkIdbtn").attr(
														"disabled", true);
												$("#checkIdbtn").css("background", "rgb(200,200,200)")
																.css("border", "none");
											}
										} else {
											checkId = false;
											alert("이미 존재하는 아이디 입니다.")
											$("#userId").focus();
											return;
										}
									},
									error : function(e) {
										conssole.log(e);
									}
								});
					});

			$("#userId").on("change", function() {
				checkId = false;
				$("#checkIdbtn").attr("disabled", false);
				$("#checkIdbtn").css("background", "rgb(18,100,100)")
								.css("border-color", "rgb(18,88,88)");
			});
			
/*  			if(($("#checkIdbtn").disabled)=true){
				$("#checkIdbtn").css("background", "rgb(200,200,200)")
								.css("border-color", "none");
			}else{
				$("#checkIdbtn").css("background", "rgb(18,100,100)")
								.css("border-color", "rgb(18,88,88)");
			};  */
			
			//비밀번호 유효성 검사(정규식 사용)
			function validatePassword(charactor){
				return /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-_])(?=.*[0-9]).{9,}$/.test(charactor);
			};
			
			$("#userPw").on("change", function(){
				if(!validatePassword($("#userPw").val())){
					pwValidation = false;
					$("#pwValidation").show();
					$("#userPw").focus();
				}else{
					pwValidation = true;
					$("#pwValidation").hide();
				};
				
				if($("#userPw").val() == $("#userPwCheck").val()){
					pwCheck = true;
					$("#pwCheckResult").css("color", "green");
					$("#pwCheckResult").text("비밀번호 일치")
				}else{
					pwCheck = false;
					$("#pwCheckResult").css("color", "red");
					$("#pwCheckResult").text("비밀번호 불일치")
				};
			});
			
			//비밀번호 확인
			$("#userPwCheck").on("change", function(){
				$("#pwCheckResult").show();
				
				if($("#userPw").val() == $("#userPwCheck").val()){
					pwCheck = true;
					$("#pwCheckResult").css("color", "green");
					$("#pwCheckResult").text("비밀번호 일치")
				}else{
					pwCheck = false;
					$("#pwCheckResult").css("color", "red");
					$("#pwCheckResult").text("비밀번호 불일치")
				};
			});
			
			//회원가입 할 떄 (form submit될 때) 마지막 유효성 검사
			$("#join-form").on("submit", function(e){
				if(!checkId){
					alert("아이디 중복체크를 해 주세요.")
					$("#userId").focus();
					e.preventDefault();
					return;
				}
				if(!pwValidation){
					alert("비밀번호는 영문자, 숫자, 특수문자 조합의 9자리 이상으로 설정해주세요.");
					$("#userPw").focus();
					e.preventDefault();
					return;
				}
				if(!pwCheck){
					alert("비밀번호가 일치하지 않습니다.");
					$("#userPwCheck").focus();
					e.preventDefault();
					return;
				}
			});
		});
	</script>
</body>
</html>