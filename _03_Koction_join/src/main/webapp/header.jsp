<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>콕션-회원가입</title>
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
        header{
            height: 100px;
        }
</style>
</head>
<body>
	<!--header-->
	<header>
		<div class="top-bg">
			<div class="top-navbar">
				<div class="nav justify-content-end">
					<c:choose >
						<c:when test="${loginUser eq null }">
							<a class="nav-link" href="/user/loginPage.do">로그인</a> 
							<a class="nav-link" href="/user/join.do">회원가입</a>
						</c:when>
						<c:otherwise>
							<a class="nav-link" href="/user/mypage.do">${loginUser.userNm }</a> 
							<a class="nav-link" href="/user/logout.do">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
				<div class="wrap" id="topMenu">
		            <div class="logo">
		                <a href="${pageContext.request.contextPath }/index.jsp"><img src="${pageContext.request.contextPath }/images/main_logo.png" alt="로고"></a>
		            </div>
		            <nav class="navbar navbar-expand-lg">
		                <div class="container-fluid">
		                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		                    <span class="navbar-toggler-icon"></span>
		                  </button>
		                  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		                    <div class="navbar-nav justify-content-end">
		                        <a class="nav-link" href="#">이용안내</a>
		                        <img src="${pageContext.request.contextPath }/images/bar.png" alt="막대">
		                        <a class="nav-link" href="${pageContext.request.contextPath }/item/getItemList.do">상품검색</a>
		                        <img src="${pageContext.request.contextPath }/images/bar.png" alt="막대">
		                        <a class="nav-link" href="#">상품등록</a>
		                        <img src="${pageContext.request.contextPath }/images/bar.png" alt="막대">
		                        <a class="nav-link" href="#">고객센터</a>
		                        <img src="${pageContext.request.contextPath }/images/bar.png" alt="막대">
		                        <a class="nav-link last-nav" href="#">나의경매</a>
		                    </div>
		                  </div>
		                </div>
		              </nav>
	       		 	</div>
				</div>
	</header>
</body>
</html>