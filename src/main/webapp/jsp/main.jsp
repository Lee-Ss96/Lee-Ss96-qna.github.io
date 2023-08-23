<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/custom.css">
<title>게시판 프로젝트</title>
</head>
<body>
	<%
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String) session.getAttribute("userId");
		}
	%>
	<%@ include file="common/header.jsp" %> 
	
	<div id="container">
        <div id="contents">
			<div class="visual">
			    <a href="/product/project.html?cate_no=67"><img src="https://jtcom.myqnapcloud.com:8088/template_3/Project/20201110_143627362.jpg" alt=""></a>
			</div>
			<br><div class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 board "><h3 class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">내돈내산 리뷰</h3>
			<div class="xans-element- xans-board xans-board-list-4 xans-board-list xans-board-4 galleryList">
				<ul>
					<li class="xans-record-">
                		<a href="/board/product/read.html?no=12845&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202110/83523f2c35d25090b17404cf20f9ccea.jpg" border="0" alt="">&nbsp;만족합니다 </a>
                		<span>2022-04-02</span>
            		</li>
		            <li class="xans-record-">
		                <a href="/board/product/read.html?no=12844&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202110/83523f2c35d25090b17404cf20f9ccea.jpg" border="0" alt="">&nbsp;아주 좋고 이 가격에 이렇게 좋은 제품을 살수가 있다는... </a>
		                <span>2022-04-02</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12843&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202110/83523f2c35d25090b17404cf20f9ccea.jpg" border="0" alt="">&nbsp;잘받았습니다 감사합니다. </a>
		                <span>2022-04-02</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12842&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202110/83523f2c35d25090b17404cf20f9ccea.jpg" border="0" alt="">&nbsp;가성비 좋고 화력도 좋습니다 </a>
		                <span>2022-04-02</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12800&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;배송도 빠르고 물건도 좋아요 </a>
		                <span>2022-03-28</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12799&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;라떼고 커피머신 </a>
		                <span>2022-03-28</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12798&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;좋은제품으로 잘 받았습니다 </a>
		                <span>2022-03-28</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12797&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;선택 굿~~ </a>
		                <span>2022-03-28</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12796&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;모양도 예쁘고, 커피맛도 좋아요 </a>
		                <span>2022-03-28</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12532&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;드디어 찾았다 정착템 </a>
		                <span>2022-03-06</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12531&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;적극추천이용 </a>
		                <span>2022-03-06</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12530&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;좋은상품 감사합니다 </a>
		                <span>2022-03-06</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12529&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;선택 굿~~ </a>
		                <span>2022-03-06</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=12528&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/202007/11c78563ec6577f9abbd64684baffddc.jpg" border="0" alt="">&nbsp;라떼고 이름값하네요 </a>
		                <span>2022-03-06</span>
		            </li>
					<li class="xans-record-">
		                <a href="/board/product/read.html?no=11776&amp;board_no=4" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/20200503/3ab29be6dc2cadf03476d133369dd403.jpg" border="0" alt="">&nbsp;국내 제품보다 성능이 우수한 해외 제품을  접할 수 있어서 좋았습니다. </a>
		                <span>2022-01-07</span>
		            </li>
		        </ul>
			</div>
			<a href="/board/product/list.html?board_no=4" class="more"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_board_more.gif" alt="더보기"></a>
		</div>


		<div class="xans-element- xans-product xans-product-listmain-1 xans-product-listmain xans-product-1 ec-base-product">
			<div class="title">
		        <h2>
		            <span style="display: none;"></span>
		            <span style="display: ;"><img src="//jeuro.co.kr/web/upload/category/shop1_1_show_654752.jpg" alt=""></span>
		        </h2>
		    </div>
			<ul class="prdList grid2">
				<li id="anchorBoxId_49" class="xans-record-">
            		<div class="thumbnail">
                		<div class="prdImg">
                    			<a href="/product/재고확보-디트리쉬-다크그레이-인덕션-3구-dpi7572g-기사방문설치-차단기포함-as지원-재고보유-즉시발송/49/category/1/display/2/" name="anchorBoxName_49"><img src="//jeuro.co.kr/web/product/medium/20200503/eec1ba802c1c504c71f18dcbc80cd4ee.jpg" id="eListPrdImage49_2" alt="재고확보 디트리쉬 다크그레이 인덕션 3구 DPI7572G 기사방문설치 차단기포함 AS지원 재고보유 즉시발송"></a>
                    			<span class="wish"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png" class="icon_img ec-product-listwishicon" alt="관심상품 등록 전" productno="49" categoryno="1" icon_status="off" login_status="F" individual-set="F"></span>
                		</div>
		                <div class="icon">
		                    <div class="promotion">  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_recommended.gif" class="icon_img" alt="추천">     </div>
		                    <div class="button">
		                        <div class="likeButton likePrd likePrd_49"><button type="button"><img src="//img.echosting.cafe24.com/skin/admin_ko_KR/product/ico_likeit.png" class="likePrdIcon" product_no="49" category_no="1" icon_status="off" alt="좋아요 등록 전"><strong></strong></button></div>
		                        <div class="option"></div> <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif" onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(49,  1, 'basket', '')" alt="장바구니 담기" class="ec-admin-icon cart"> <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif" onclick="zoom('49', '1', '2','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기">                    </div>
		                </div>
            		</div>
            		<div class="description">
                		<strong class="name"><a href="/product/재고확보-디트리쉬-다크그레이-인덕션-3구-dpi7572g-기사방문설치-차단기포함-as지원-재고보유-즉시발송/49/category/1/display/2/" class=""><span class="title displaynone"><span style="font-size:12px;color:#555555;">상품명</span> :</span> <span style="font-size:12px;color:#555555;">재고확보 디트리쉬 다크그레이 인덕션 3구 DPI7572G 기사방문설치 차단기포함 AS지원 재고보유 즉시발송</span></a></strong>
                		<ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec">
                			<li class=" xans-record-">
								<strong class="title displaynone"><span style="font-size:12px;color:#008BCC;font-weight:bold;">판매가</span> :</strong> <span style="font-size:12px;color:#008BCC;font-weight:bold;">578,000원</span><span id="span_product_tax_type_text" style=""> </span>
							</li>
						</ul>
					</div>
        		</li>
        		<li id="anchorBoxId_50" class="xans-record-">
            		<div class="thumbnail">
                		<div class="prdImg">
		                    <a href="/product/재고확보-디트리쉬-펄그레이-반프리존-인덕션-dpi7686gp-기사방문설치-차단기포함-as지원-재고보유-즉시발송/50/category/1/display/2/" name="anchorBoxName_50"><img src="//jeuro.co.kr/web/product/medium/20200503/01a445ab7137b974bcc85b4144a1f878.jpg" id="eListPrdImage50_2" alt="재고확보 디트리쉬 펄그레이 반프리존 인덕션 DPI7686GP 기사방문설치 차단기포함 AS지원 재고보유 즉시발송"></a>
		                    <span class="wish"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png" class="icon_img ec-product-listwishicon" alt="관심상품 등록 전" productno="50" categoryno="1" icon_status="off" login_status="F" individual-set="F"></span>
                		</div>
		                <div class="icon">
		                    <div class="promotion">  <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_recommended.gif" class="icon_img" alt="추천">     </div>
		                    <div class="button">
		                        <div class="likeButton likePrd likePrd_50"><button type="button"><img src="//img.echosting.cafe24.com/skin/admin_ko_KR/product/ico_likeit.png" class="likePrdIcon" product_no="50" category_no="1" icon_status="off" alt="좋아요 등록 전"><strong></strong></button></div>
		                        <div class="option"></div> <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif" onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(50,  1, 'basket', '')" alt="장바구니 담기" class="ec-admin-icon cart"> <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_prd_zoom.gif" onclick="zoom('50', '1', '2','', '');" style="cursor:pointer" alt="상품 큰 이미지 보기">                    </div>
		                </div>
            		</div>
            		<div class="description">
                		<strong class="name"><a href="/product/재고확보-디트리쉬-펄그레이-반프리존-인덕션-dpi7686gp-기사방문설치-차단기포함-as지원-재고보유-즉시발송/50/category/1/display/2/" class=""><span class="title displaynone"><span style="font-size:12px;color:#555555;">상품명</span> :</span> <span style="font-size:12px;color:#555555;">재고확보 디트리쉬 펄그레이 반프리존 인덕션 DPI7686GP 기사방문설치 차단기포함 AS지원 재고보유 즉시발송</span></a></strong>
                		<ul class="xans-element- xans-product xans-product-listitem-1 xans-product-listitem xans-product-1 spec">
	                		<li class=" xans-record-">
								<strong class="title displaynone"><span style="font-size:12px;color:#008BCC;font-weight:bold;">판매가</span> :</strong> <span style="font-size:12px;color:#008BCC;font-weight:bold;">658,000원</span><span id="span_product_tax_type_text" style=""> </span>
							</li>
						</ul>
					</div>
        		</li>
    		</ul>
		</div>

		<div id="boardArea">
    		<div class="xans-element- xans-board xans-board-listpackage-5 xans-board-listpackage xans-board-5 ">
    			<h2><span>공지사항</span></h2>
				<div class="ec-base-table typeList gLine">
            		<table border="1" summary="">
						<caption><img src="%7B%24board_title%20%7D" alt=""></caption>
                		<colgroup>
							<col style="width:auto">
							<col style="width:100px">
						</colgroup>
						<thead class="blind">
							<tr>
								<th scope="col">제목</th>
		                        <th scope="col">날짜</th>
                    		</tr>
                    	</thead>
                    	<tbody class="xans-element- xans-board xans-board-list-1 xans-board-list xans-board-1">
                    		<tr class="xans-record-">
								<td class="title"><a href="/article/공지사항/1/7983/">카드사 할부 혜택 - 2022년 4월</a></td>
                        		<td>2021/03/09</td>
                    		</tr>
							<tr class="xans-record-">
								<td class="title"><a href="/article/공지사항/1/7084/">제이유로 설치팀에서 인덕션 설치 기사님을 모집합니다.</a></td>
                        		<td>2021/02/18</td>
                    		</tr>
							<tr class="xans-record-">
								<td class="title"><a href="/article/공지사항/1/6396/">설 연휴 택배사별 배송일정 안내</a></td>
                        		<td>2021/02/03</td>
                    		</tr>
							<tr class="xans-record-">
								<td class="title"><a href="/article/공지사항/1/6096/">[인덕션 배송 공지] 택배노조 파업 및 명절 배송 관련 안내</a></td>
		                        <td>2021/01/28</td>
		                    </tr>
							<tr class="xans-record-">
								<td class="title"><a href="/article/공지사항/1/488/">코로나-19 이슈 관련 고객센터 운영 안내</a></td>
		                        <td>2020/07/30</td>
		                    </tr>
						</tbody>
					</table>
				</div>
				<p class="more"><a href="/board/free/list.html?board_no=1" class="btnNormal">더보기</a></p>
			</div>

		    <%--<div class="xans-element- xans-board xans-board-listpackage-6 xans-board-listpackage xans-board-6 "><h2><span>상품 Q&amp;A</span></h2>
		<div class="ec-base-table typeList gLine">
		            <table border="1" summary="">
		<caption><img src="%7B%24board_title%20%7D" alt=""></caption>
		                <colgroup>
		<col style="width:auto">
		<col style="width:100px">
		</colgroup>
		<thead class="blind"><tr>
		<th scope="col">제목</th>
		                        <th scope="col">날짜</th>
		                    </tr></thead><tbody class="xans-element- xans-board xans-board-list-6 xans-board-list xans-board-6"><!--
		                        $count = 5
		                        $main_list = yes
		                        $subject_cut = 25
		                        $main_list_reply_view = no
		                    --><tr class="xans-record-">
		<td class="title"><a href="/article/상품-qa/6/13302/">김**** - 상품 Q&amp;A</a></td>
		                        <td>2023/08/07</td>
		                    </tr>
		<tr class="xans-record-">
		<td class="title"><a href="/article/상품-qa/6/13300/">김**** - 상품 Q&amp;A</a></td>
		                        <td>2023/07/27</td>
		                    </tr>
		<tr class="xans-record-">
		<td class="title"><a href="/article/상품-qa/6/13298/">심**** - 상품 Q&amp;A</a></td>
		                        <td>2023/06/13</td>
		                    </tr>
		<tr class="xans-record-">
		<td class="title"><a href="/article/상품-qa/6/13295/">연**** - 상품 Q&amp;A</a></td>
		                        <td>2023/06/07</td>
		                    </tr>
		<tr class="xans-record-">
		<td class="title"><a href="/article/상품-qa/6/13291/">서**** - 상품 Q&amp;A</a></td>
		                        <td>2023/05/23</td>
		                    </tr>
		</tbody>
		</table>
		</div>
		<p class="more"><a href="/board/product/list.html?board_no=6" class="btnNormal">더보기</a>
		    </p>
		</div>    --%>
</div>
        </div>
        <%@ include file="common/nav.jsp" %> 
    </div>
    
    <%@ include file="common/footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/bootstrap.js"></script>
</body>
</html>