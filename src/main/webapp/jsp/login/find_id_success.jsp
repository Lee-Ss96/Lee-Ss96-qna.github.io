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
		
		String name = (String) session.getAttribute("findId");
	%>
	<%@ include file="../common/header.jsp" %> 
	
	<div id="container">
        <div id="contents">
			<div class="path">
    			<span>현재 위치</span>
    			<ol>
    				<li><a href="<%= request.getContextPath()%>/jsp/main.jsp">홈</a></li>
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
	<%@ include file="../common/nav.jsp" %> 
    </div>
    
    <%@ include file="../common/footer.jsp" %>
	
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
	<script src="<%= request.getContextPath()%>/js/bootstrap.js"></script>
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