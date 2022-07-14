<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/ress.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style_header_footer.css">
<link rel="stylesheet" href="css/style_home.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="./header.jsp"></jsp:include>
	<main>
		<div class="top-slide">
			<div class="carousel slide" data-bs-ride="carousel" id="banner">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#banner" data-bs-slide-to="0"
						class="active"></button>
					<button type="button" data-bs-target="#banner" data-bs-slide-to="1"></button>
					<button type="button" data-bs-target="#banner" data-bs-slide-to="2"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="images/banner2.png" width="100%" height="200px"
							alt="배너1" style="cursor: pointer">
					</div>
					<div class="carousel-item">
						<img src="images/banner01.gif" loop=infinite width="100%"
							height="200px" alt="배너2" style="cursor: pointer">
					</div>
					<div class="carousel-item">
						<img src="images/banner3.png" width="100%" height="200px"
							alt="배너3" style="cursor: pointer">
					</div>
				</div>
				<a href="#banner" class="carousel-control-prev" data-bs-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a href="#banner" class="carousel-control-next"
					data-bs-slide="next"> <span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
	</main>
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>