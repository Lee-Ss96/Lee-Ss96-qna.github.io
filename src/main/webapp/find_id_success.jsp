<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="user.User" %> 
<%@ page import="user.UserDAO" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>게시판 프로젝트</title>
</head>
<body>
	<%
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String) session.getAttribute("userId");
		}
		
		String name = (String) session.getAttribute("findId");
	%>
	<div id="header">
		<div class="inner">
		    <div class="topArea">
		        <h1 class="xans-element- xans-layout xans-layout-logotop "><a href="main.jsp"><img src="image/logo.png" alt=""></a></h1>
		        <form id="searchBarForm" name="" action="/product/search.html" method="get" target="_self" enctype="multipart/form-data">
					<input id="banner_action" name="banner_action" value="" type="hidden">
						<div class="xans-element- xans-layout xans-layout-searchheader ">
							<fieldset>
								<legend>검색</legend>
		                		<input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text"><input type="image" src="//img.echosting.cafe24.com/skin/base/layout/btn_search.gif" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">
							</fieldset>
						</div>
				</form>    
			</div>
		
		    <div class="xans-element- xans-layout xans-layout-statelogoff ">
		    	<%
		    	if(userId == null){
		    %>
		    	<a href="login.jsp">로그인</a>
				<a href="join.jsp">회원가입</a>
				<a href="/board/index.html">게시판</a>
			</div>
			<% 
		    	}
			%>
			<%
				if(userId != null){
			%>
				<a href="logoutAction.jsp">로그아웃</a>
				<a href="/order/basket.html">장바구니 <span class="count displaynone EC-Layout_Basket-count-display"><span class="EC-Layout-Basket-count">0</span></span></a>
				<a href="/myshop/order/list.html">주문조회</a>
				<a href="/myshop/index.html">마이쇼핑</a>
				<a href="/board/index.html">게시판</a>
			</div>
			<%
				}
			%>
		    <ul class="special">
		    	<li><a href="/product/list.html?cate_no=24">신상품</a></li>
		        <li><a href="/product/list.html?cate_no=25">프리미엄</a></li>
		        <li><a href="/product/list.html?cate_no=26">스페셜상품</a></li>
		    </ul>
		    <div class="link"></div>
		</div>
	</div>
	
	<div id="container">
        <div id="contents">
			<div class="path">
    			<span>현재 위치</span>
    			<ol>
    				<li><a href="/">홈</a></li>
        			<li title="현재 위치"><strong>아이디 찾기</strong></li>
    			</ol>
    		</div>

			<div class="titleArea">
    			<h2>회원 아이디 조회</h2>
			</div>

			<form name="frm" action="findAction.jsp" method="post" onsubmit="return validation()">
				<div class="xans-element- xans-member xans-member-findid ec-base-box typeThin ">
					<div class="findId">
        				<h3 class="boxTitle">회원 아이디 조회</h3>
        				<fieldset>
							<legend>회원 아이디 조회</legend>
				            <p id="name_view" class="name" style=""><strong id="name_lable" style="width: 100%; text-align: center;">입력된 정보로 조회하신 회원님의 아이디는</strong></p>
				            <p id="email_view" class="email" style="text-align: center;"><span style="font-size: 20px; font-weight: bold;"><%= name %></span> 입니다.</p>
				            <div class="ec-base-button gColumn">
				            	<button type="button" onclick="location.href='login.jsp'" style="width: 30%; height: 50px; border: 1px solid #345672; border-radius: 10px; background: lightsteelblue;">로그인</button>
				            	<button type="button" onclick="location.href='find_pw.jsp'" style="width: 30%; height: 50px; border: 1px solid #345672; border-radius: 10px; background: lightsteelblue;">비밀번호 찾기</button>
				            </div>
				        </fieldset>
					</div>
				</div>
			</form>
        </div>
	<hr class="layout">
        <div id="sidebar">
            <div id="category" class="xans-element- xans-layout xans-layout-category">
	            <div class="position">
	            	<ul>
						<li class="xans-record-">
							<a href="/category/주방가전/56/"><img src="//jeuro.co.kr/web/upload/category/eda99e712e19f4f3defafcc38df0eff1.jpg" id="cate_img_56" alt="주방가전" rollover="//jeuro.co.kr/web/upload/category/d0dfbab1b0454c7aac40ffe8d73383dc.jpg"></a>
						</li>
	                    <li class="xans-record-">
	                    	<a href="/category/주방용품/57/"><img src="//jeuro.co.kr/web/upload/category/c502537616388e1d7046af86d4aa1569.jpg" id="cate_img_57" alt="주방용품" rollover="//jeuro.co.kr/web/upload/category/3efe65543f66dcaeaa0388bed9f94cad.jpg"></a>
	                    </li>
	                    <li class="xans-record-">
	                    	<a href="/category/음향가전/62/"><img src="//jeuro.co.kr/web/upload/category/451c666a9e3b1e0fe2e579943d4fa54e.jpg" id="cate_img_62" alt="음향가전" rollover="//jeuro.co.kr/web/upload/category/6f484caf14f4196ba141d915d0050e90.jpg"></a>
	                    </li>
						<li class="xans-record-">
							<a href="/category/블루투스이어폰/63/"><img src="//jeuro.co.kr/web/upload/category/c295d2b52199323440cb818408862cf5.jpg" id="cate_img_63" alt="블루투스이어폰" rollover="//jeuro.co.kr/web/upload/category/a9742e664d2d81b6104b1c65e0ef2754.jpg"></a>
						</li>
	                </ul>
				</div>
			</div>
            <div class="xans-element- xans-layout xans-layout-boardinfo">
            	<h2>전체게시판</h2>
				<ul>
					<li class="xans-record-">
						<a href="/board/공지사항/1/">공지사항</a> 
					</li>
				    <li class="xans-record-">
						<a href="/board/뉴스이벤트/2/">뉴스/이벤트</a> 
					</li>
					<li class="xans-record-">
						<a href="/board/상품-사용후기/4/">상품 사용후기</a> 
					</li>
					<li class="xans-record-">
						<a href="/board/투데이-키친-스토리/5/">투데이 키친 스토리</a> 
					</li>
					<li class="xans-record-">
						<a href="/board/내돈내산-리뷰-게시판/8/">내돈내산 리뷰 게시판</a> 
					</li>
					<li class="xans-record-">
						<a href="/board/소원을-말해봐/3001/">소원을 말해봐</a> 
					</li>
					<li class="xans-record-">
						<a href="/board/상품-qa/6/">상품 Q&amp;A</a> 
					</li>
                </ul>
			</div>

            <form id="searchBarForm" name="" action="/product/search.html" method="get" target="_self" enctype="multipart/form-data">
				<input id="banner_action" name="banner_action" value="" type="hidden">
				<div class="xans-element- xans-layout xans-layout-searchside">
					<h2>상품검색</h2>
					<fieldset>
						<legend>검색</legend>
	                    <input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text"><input type="image" src="//img.echosting.cafe24.com/skin/base/layout/btn_search.gif" alt="검색" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;">
					</fieldset>
					<div class="bestKeyword displaynone">
		            	<a href="" class=""></a>
		            	<a href="" class=""></a>                
		           	</div>
					<p class="button"><a href="/product/search.html" class="btnLink">상품상세검색</a></p>
				</div>
			</form>
            <div class="xans-element- xans-layout xans-layout-project">
            	<h2>쇼핑기획전</h2>
				<div class="containterWrap" style="overflow: hidden; position: relative; width: 180px; height: 180px;">
					<ul style="position: absolute; left: 0px; top: 0px;">
						<li class="xans-record-">
							<a href="/project/가성비-끝판왕/69/"><img src="//jeuro.co.kr/web/upload/category/shop1_69_menu_455595.jpg" alt=""></a>
						</li>
						<li class="xans-record-">
							<a href="/project/화사한-주방-화이트는-진리/67/"><img src="//jeuro.co.kr/web/upload/category/shop1_67_menu_636816.jpg" alt=""></a>
						</li>
						<li class="xans-record-">
							<a href="/project/지멘스-인덕션-초특가/64/"><img src="//jeuro.co.kr/web/upload/category/shop1_64_menu_640495.jpg" alt=""></a>
						</li>
						<li class="xans-record-">
							<a href="/project/설치비-소환/70/"><img src="//jeuro.co.kr/web/upload/category/shop1_70_menu_216411.jpg" alt=""></a>
						</li>
                	</ul>
                </div>
				<div class="control">
	                <button type="button" class="prev" id="prevButton-project"><span>이전</span></button>
	                <button type="button" class="stop" id="stopButton-project" style="display: inline;"><span>멈춤</span></button>
	                <button type="button" class="play" id="playButton-project" style="display: none;"><span>재생</span></button>
	                <button type="button" class="next" id="nextButton-project"><span>다음</span></button>
	            </div>
			</div>
            <div class="xans-element- xans-layout xans-layout-info ">
            	<h2>고객센터</h2>
				<ul>
					<li class="tel">
						<strong>Telephone</strong><span>1833-4026</span>
					</li>
					<li>
						<strong>Fax</strong><span>1833-4026</span>
					</li>
					<li>
						<strong>Time</strong><span></span>
					</li>
                </ul>
			</div>
            
            <div class="banner">
            </div>
        </div>
    </div>
    
    <div id="footer">
    	<div class="inner">
	        <span class="xans-element- xans-layout xans-layout-logobottom ">
	        	<a href="/index.html"><img src="image/logo.png" alt=""></a>
			</span>

        	<div class="xans-element- xans-layout xans-layout-footer">
        		<ul class="utilMenu">
					<li class="home"><a href="main.jsp">홈</a></li>
	            </ul>
				<p class="address">
                	<span>제작자(성명) : 이승수</span> <span>전화 : 010-3386-3358</span> <span>주소 : 서울특별시 송파구</span>            
                </p>
			</div>

    	</div>
	</div>
	
	<%-- <nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">내돈내산 리뷰</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="notice.jsp">게시판</a></li>
			</ul>
			<%
				if(userId == null){
			%>
				<ul class="nav navbar-nav navbar-rigth">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspepup="true"
							aria-expanded="false">접속하기<span class="carot"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>
				</ul>
			<%
				} else{
			%>		
				<ul class="nav navbar-nav navbar-rigth">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspepup="true"
							aria-expanded="false">회원관리<span class="carot"></span></a>
						<ul class="dropdown-menu">
							<li><a href="logoutAction.jsp">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			<% 
				}
			%>
		</div>
	</nav>
	--%>
	<%-- <div id="wrap">
		<div class="container">
			<div class="jumbotron">
				<div class="container">
					<h1>웹 프로젝트 소개</h1>
					<p>부트스트랩을 사용하여 만든 jsp 웹사이트</p>
					<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히</a></p>
				</div>
			</div>
		</div>
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<img src="image/pizza.jpg">
					</div>
					<div class="item">
						<img src="image/egg.jpg">
					</div>
					<div class="item">
						<img src="image/bibim.jpg">
					</div>
				</div>
				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				<a class="right carousel-control" href="#myCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
	</div>
	--%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>
		var findType = "2";
		
		if (document.addEventListener) {
			window.addEventListener('pageshow', function (event) {
				if (event.persisted || window.performance && window.performance.navigation.type == 2) {
					location.reload();
				}
			}, false);
		}
		
		//아이디 찾기 이메일/전화번호 선택
		$("input[name='checkFind']").change(function(){
			findType = $("input[name='checkFind']:checked").val();
			
			$("#name").val("");
			$("#email").val("");
			$(".mobile").val("");
			
			if(findType == "2"){
				$("#email_view").css('display', "");
				$("#mobile_view").css('display', "none");
			}else if(findType == "3"){
				$("#email_view").css('display', "none");
				$("#mobile_view").css('display', "");
			}
				
		});
		
		
		//validation 체크
		function validation(){
			if( frm.userName.value == "" ) {
		        frm.userName.focus();
		        alert("이름을 입력해 주십시오.");

		        return false;
		    }
			
			if(findType == "2"){
				if( frm.userEmail.value == "" ) {
			        frm.userEmail.focus();
			        alert("이메일을 입력해 주십시오.");
	
			        return false;
			    }
			}else{
				if( frm.userTel1.value == "" ) {
			        frm.userTel1.focus();
			        alert("전화번호를 입력해 주십시오.");
			        return false;
			    }
				if( frm.userTel2.value == "" ) {
			        frm.userTel2.focus();
			        alert("전화번호를 입력해 주십시오.");
			        return false;
			    }
				if( frm.userTel3.value == "" ) {
			        frm.userTel3.focus();
			        alert("전화번호를 입력해 주십시오.");
			        return false;
			    }
			}
		}

	</script>
</body>
</html>