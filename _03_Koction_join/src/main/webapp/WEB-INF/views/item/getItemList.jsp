<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/ress.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style_header_footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/Ca_Se_In.css">
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
	<main>
	<div class="title">
            상품 검색
        </div>
        <!-- 검색 버튼 영역 -->
        <hr>
        <form id="searchForm" action="getItemList.do">
	        <div id="searchArea" style="text-align: center;">
	            <div id="searchBar">
	                <svg xmlns="http://www.w3.org/2000/svg" style=" color: rgba(17,100,100,1);" width="24" height="24"
	                    fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
	                    <path
	                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
	                </svg>
	                    <select class="form-select se_select">
	                        <option selected>조건
	                        </option>
	                        <option value="1">물품명</option>
	                        <option value="2">판매자명</option>
	                        <option value="3">가격</option>
	                    </select>
	                <input type="search" id="searchKeyword" name="searchKeyword">
	                <a href="#">
	                    <button id="sc_btn" type="submit">Search</button>
	                </a>
	            </div>
	        </div>
        </form>
        <hr>

        <!-- 카테고리 선택 영역 -->
        <c:choose>
			<c:when test="${not empty searchKeyword }">
		        <div id="ca_list">
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca1.svg" alt="디지털, 가전">디지털/가전</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca2.svg" alt="가구, 인테리어">가구/인테리어</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca3.svg" alt="유아용품">유아용품</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca4.svg" alt="스포츠, 레저">스포츠/레저</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca5.svg" alt="여성잡화">여성잡화</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca6.svg" alt="여성의류">여성의류</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca7.svg" alt="게임, 취미">게임/취미</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca8.svg" alt="뷰티, 미용">뷰티/미용</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca9.svg" alt="반려동물용품">반려동물용품</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca10.svg" alt="생활, 가공식품">생활/가공식품</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca11.svg" alt="남성패션, 잡화">남성패션/잡화</a>
		            </div>
		            <div id="ca_div">
		                <a id="ca_a" href="#"><img id="ca_img" src="/images/ca12.svg" alt="도서, 음반, 티켓">도서/음반/티켓</a>
		            </div>
		        </div>
	        </c:when>
			<c:otherwise>
				<div id="se_num">
					<svg xmlns="http://www.w3.org/2000/svg"	style="color: rgba(17, 100, 100, 1);" width="24" height="24" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
			                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
			        </svg>
					<pre>  검색결과  -  23건</pre>
					<br>
					<br>
				</div>
				<!-- 검색 결과 상품 리스트 -->
				<h3 style="display: inline">상품 리스트</h3>
				<div id="se_List">
 					<c:forEach var="item" items="${itemList }" >
						<div class="se_Info" id="se_Info">
							<a href="#">
								<table id="se_Table">
									<thead>
										<tr class="tr_img">
											<th colspan="2"><img src="/images/product01_1.jpg"
												id="se_im" alt="아이폰14_1"></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2">상품명 : ${item.itemTitle }</td>
										</tr>
										<tr>
											<td colspan="2">상품가격 : ${item.itemStPrice }원</td>
										</tr>
										<tr>
											<td style="border-right: 1px solid rgb(140, 140, 140);">입찰
												수 ${item.itemBidCnt }</td>
											<td>조회 수 ${item.itemCnt }</td>
										</tr>
										<tr>
											<td colspan="2">판매자ID : ${item.itemSeller }</td>
										</tr>
										<tr>
											<td colspan="2" class="ex_time"></td>
										</tr>
									</tbody>
								</table>
							</a>
						</div>
 					</c:forEach>

					<div class="se_Info" id="se_Info">
						<a href="#">
							<table id="se_Table">
								<thead>
									<tr>
										<th colspan="2"><img src="/images/화장품.png" id="se_im"
											alt="화장품"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="2">상품명 : 가히 링클 바운스 멀티밤</td>
									</tr>
									<tr>
										<td colspan="2">상품가격 : 46,500원</td>
									</tr>
									<tr>
										<td style="border-right: 1px solid rgb(140, 140, 140);">입찰
											수 180</td>
										<td>조회 수 21,867</td>
									</tr>
									<tr>
										<td colspan="2">판매자ID : bitcamp</td>
									</tr>
									<tr>
										<td colspan="2" class="ex_time"></td>
									</tr>
								</tbody>
							</table>
						</a>
					</div>

					<div class="se_Info" id="se_Info">
						<a href="#">
							<table id="se_Table">
								<thead>
									<tr>
										<th colspan="2"><img src="/images/운동화.png" id="se_im"
											alt="아이폰14_1"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="2">상품명 : 휠라 꼬모 FS1SIB127</td>
									</tr>
									<tr>
										<td colspan="2">상품가격 : 25,000원</td>
									</tr>
									<tr>
										<td style="border-right: 1px solid rgb(140, 140, 140);">입찰
											수 11</td>
										<td>조회 수 21,865</td>
									</tr>
									<tr>
										<td colspan="2">판매자ID : bitcamp</td>
									</tr>
									<tr>
										<td colspan="2">남은시간 : 24시간 55분</td>
									</tr>
								</tbody>
							</table>
						</a>
					</div>

					
				</div>
				<!-- 검색결과 창 하단 버튼 -->
				<div id="pageArea">
				<div id="page_btn">
					<div class="btn-toolbar" role="toolbar"
						aria-label="Toolbar with button groups" style="justify-content: center">
						<div class="btn-group me-2" role="group" aria-label="Second group">
							<div class="btn_page_side">
								<button type="button" class="btn btn-outline-secondary btn_page"
									style="border: 0;"><</button>
								<button type="button" class="btn btn-outline-secondary btn_page">1</button>
								<button type="button" class="btn btn-outline-secondary btn_page">2</button>
								<button type="button" class="btn btn-outline-secondary btn_page">3</button>
								<button type="button" class="btn btn-outline-secondary btn_page">4</button>
								<button type="button" class="btn btn-outline-secondary btn_page">5</button>
								<button type="button" class="btn btn-outline-secondary btn_page"
									style="border: 0;">></button>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
    </main>
	
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	<script>
	$(function(){
		/* Date이용 남은시간 */
        var $ex_time = $(".ex_time");
        /* var $end_time = new Date($(".end_time")); */
        var $end_time = new Date("June 30, 2022, 21:30:00");
        var now = new Date();

        setInterval(function () {
            var today = new Date().getTime();
            var gap = $end_time - today;
            var day = (Math.ceil(gap / (1000 * 60 * 60 * 24)))-1;
            var hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
            var sec = Math.ceil((gap % (1000 * 60)) / 1000);

            if (day >= 2) {
                $ex_time.text("남은시간 : " + day + "일 " + hour + "시간 ");
            } else {
                $ex_time.text("남은시간 : " + hour + "시간 " + min + "분 ");
            }
        }, 1000);
	});
	</script>
</body>
</html>