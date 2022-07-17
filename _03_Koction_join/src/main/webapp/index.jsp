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
		<br/>
		<div class="wrap" id="indexItem">
            <div class="home1">
                <div class="hot_prod">
                    <p id="hot_title">베스트 핫딜</p>
                    <div class="step_wrap">
                        <div class="hot_prod_list_1 hotlist">
                            <a href="ProductInfo.html">
                            <div class="img-box">
                                <img src="images/product01.jpg" style="width:auto; max-width:100%; height:auto; max-height:250px;">
                            </div>
                            </a>
                            <div class="con-box">
                                <dl>
                                    <dt>아이폰 14 - 256GB</dt>
                                        <dd style="min-height:40px;">
                                            <table>
                                                <tr>
                                                    <td id="pr_name"><b>경매가</b></td>
                                                    <td>850,000원</td>
                                                </tr>
                                                <tr>
                                                    <td id="pr_name"><b>입찰수</b></td>
                                                    <td>2</td>
                                                </tr>
                                                <tr>
                                                    <td id="pr_name"><b>관심수</b></td>
                                                    <td>143</td>
                                                </tr>
                                                <tr>
                                                    <td id="pr_name"><b>조회수</b></td>
                                                    <td>17,111</td>
                                                </tr>
                                                
                                            </table>
                                            
                                         </dd>
                                         <p class="timer" colspan="2" data-end-time="2022-06-24T20:00:00+09:00"></p>
                                     </dl>
                                 </div>
                            </div>
                            <div class="hot_prod_list_2 hotlist">
                                <div class="img-box">
                                    <img src="images/화장품.png" style="width:auto; max-width:100%; height:auto; max-height:250px;">
                                </div>
                                <div class="con-box">
                                    <dl>
                                        <dt>가히 링클 바운스 멀티밤</dt>
                                            <dd style="min-height:40px;">
                                                <table>
                                                    <tr>
                                                        <td id="pr_name"><b>경매가</b></td>
                                                        <td>46,500원</td>
                                                    </tr>
                                                    <tr>
                                                        <td id="pr_name"><b>입찰수</b></td>
                                                        <td>180</td>
                                                    </tr>
                                                    <tr>
                                                        <td id="pr_name"><b>관심수</b></td>
                                                        <td>55</td>
                                                    </tr>
                                                    <tr>
                                                        <td id="pr_name"><b>조회수</b></td> 
                                                        <td>21,867</td>
                                                    </tr>
                                                    
                                                </table>
                                                
                                             </dd>
                                             <p class="timer" colspan="2" data-end-time="2022-06-27T10:00:00+09:00"></p>
                                         </dl>
                                     </div>
                                </div>
                                <div class="hot_prod_list_3 hotlist">
                                    <div class="img-box">
                                        <img src="images/운동화.png" style="width:auto; max-width:100%; height:auto; max-height:250px;">
                                    </div>
                                    <div class="con-box">
                                        <dl>
                                            <dt>휠라 꼬모 FS1SIB127</dt>
                                                <dd style="min-height:40px;">
                                                    <table>
                                                        <tr>
                                                            <td id="pr_name"><b>경매가</b></td>
                                                            <td>25,000원</td>
                                                        </tr>
                                                        <tr>
                                                            <td id="pr_name"><b>입찰수</b></td>
                                                            <td>11</td>
                                                        </tr>
                                                        <tr>
                                                            <td id="pr_name"><b>관심수</b></td>
                                                            <td>75</td>
                                                        </tr>
                                                        <tr>
                                                            <td id="pr_name"><b>조회수</b></td>
                                                            <td>21,865</td>
                                                        </tr>
                                                        
                                                    </table>
                                                    
                                                 </dd>
                                                 <p class="timer" colspan="2" data-start-time="2022-06-25T10:00:00+09:00"></p>
                                             </dl>
                                         </div>
                                    </div>
                             </div>
                        </div> 

                        <div class="fin_prod">
                            <p id="fin_title">마감임박 상품</p>
                            <div class="step_wrap">
                                <div class="fin_prod_list_1 finlist">
                                    <div class="img-box">
                                        <img src="images/텐트.png" style="width:auto; max-width:100%; height:auto; max-height:250px;">
                                    </div>
                                    <div class="con-box">
                                        <dl>
                                            <dt>네이처 하이크 에어텐트</dt>
                                                <dd style="min-height:40px;">
                                                    <table>
                                                        <tr>
                                                            <td id="pr_name"><b>경매가</b></td>
                                                            <td>734,640원</td>
                                                        </tr>
                                                        <tr>
                                                            <td id="pr_name"><b>입찰수</b></td>
                                                            <td>5</td>
                                                        </tr>
                                                        <tr>
                                                            <td id="pr_name"><b>관심수</b></td>
                                                            <td>65</td>
                                                        </tr>
                                                        <tr>
                                                            <td id="pr_name"><b>조회수</b></td>
                                                            <td>4,764</td>
                                                        </tr>
                                                        
                                                    </table>
                                                    
                                                 </dd>
                                                 <p class="timer" colspan="2" data-end-time="2022-06-24T16:00:00+09:00"></p>
                                             </dl>
                                         </div>
                                    </div>
                                    <div class="fin_prod_list_2 finlist">
                                        <div class="img-box">
                                            <img src="images/후리스.png" style="width:auto; max-width:100%; height:auto; max-height:250px;">
                                        </div>
                                        <div class="con-box">
                                            <dl>
                                                <dt>블랙야크 남여공용 후리스</dt>
                                                    <dd style="min-height:40px;">
                                                        <table>
                                                            <tr>
                                                                <td id="pr_name"><b>경매가</b></td>
                                                                <td>39,050원</td>
                                                            </tr>
                                                            <tr>
                                                                <td id="pr_name"><b>입찰수</b></td>
                                                                <td>645</td>
                                                            </tr>
                                                            <tr>
                                                                <td id="pr_name"><b>관심수</b></td>
                                                                <td>2,153</td>
                                                            </tr>
                                                            <tr>
                                                                <td id="pr_name"><b>조회수</b></td>
                                                                <td>45,975</td>
                                                            </tr>
                                                            
                                                        </table>
                                                        
                                                     </dd>
                                                     <p class="timer" colspan="2" data-end-time="2022-06-24T17:27:00+09:00"></p>
                                                 </dl>
                                             </div>
                                        </div>
                                        <div class="fin_prod_list_3 finlist">
                                            <div class="img-box">
                                                <img src="images/자전거.png" style="width:auto; max-width:100%; height:auto; max-height:250px;">
                                            </div>
                                            <div class="con-box">
                                                <dl>
                                                    <dt>2022 벤조 24인지 전기자전거</dt>
                                                        <dd style="min-height:40px;">
                                                            <table>
                                                                <tr>
                                                                    <td id="pr_name"><b>경매가</b></td>
                                                                    <td>960,000원</td>
                                                                </tr>
                                                                <tr>
                                                                    <td id="pr_name"><b>입찰수</b></td>
                                                                    <td>7</td>
                                                                </tr>
                                                                <tr>
                                                                    <td id="pr_name"><b>관심수</b></td>
                                                                    <td>69</td>
                                                                </tr>
                                                                <tr>
                                                                    <td id="pr_name"><b>조회수</b></td>
                                                                    <td>11,467</td>
                                                                </tr>
                                                                
                                                            </table>
                                                            
                                                         </dd>
                                                         <p class="timer" colspan="2" data-end-time="2022-06-24T18:30:00+09:00"></p>
                                                     </dl>
                                                 </div>
                                            </div>
                                     </div>
                                </div>
                        </div>
                        </div>
	</main>
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>