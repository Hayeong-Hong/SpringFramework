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
	<script>
	$(function(){
		$("#login-btn").on("click", function(){
			$.ajax({
				url :'/user/login.do',
				type : 'post',
				data : $("#login-form").serialize(),
				success : function(obj){
					const data = JSON.parse(obj);
					if(data.message=='idFail'){
						alert("존재하지 않는 아이디 입니다.");
						return;
					}else if(data.message=='pwFail'){
						alert("비밀번호가 틀렸습니다.");
						return;
					}
					location.href = "/index.jsp";
				},
				error : function(e){
					console.log(e);
				}
			});
		});
	});
	
	$(function(){
		$("#topMenu").hide();
	});
	</script>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	 <main>
         <!--내용 부분-->   
        <section>
            <a href="${pageContext.request.contextPath }/index.jsp"><img class="login-logo" src="${pageContext.request.contextPath }/images/main_logo.png" alt="로고"></a>
            <form class="login-form" name="login-form" id="login-form">
                <fieldset>
                    <div class="login-info">
                        <ul>
                            <li>
                                <input type="text" id="input-id" name="userId" required>
                            </li>
                            <li>
                                <input type="password" id="input-pw" name="userPw" required>
                            </li>
                        </ul>
                    </div>
                    <div class="login-btn">
                    	<input type="button" value="로그인"  id="login-btn" name="btnLogin">
                    </div>
                    <div class="auto-login">
                        <label class="form-check-label" for="flexSwitchCheckDefault">자동로그인</label>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                          
                          </div>
                    </div>
                    <a href="join.do" id="link-register">회원가입</a>
                    <a href="#" id="link-findinfo">계정정보를 잊으셨나요?</a>
                    <button type="button" class="btn btn-success" id="login-byNaver">네이버로 시작하기</button>
                    <button type="button" class="btn btn-warning" id="login-byKakao">카카오로 시작하기</button>
                    <button type="button" class="btn btn-outline-secondary" id="login-byGoogle">구글로 시작하기</button>
                </fieldset>
            </form>
        </section>  
    </main>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
</body>
</html>