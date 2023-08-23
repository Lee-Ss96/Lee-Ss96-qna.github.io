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
	<%@ include file="../common/header.jsp" %> 
	
	<div id="container">
        <div id="contents">
			<div class="path">
   	 			<span>현재 위치</span>
    			<ol>
    				<li><a href="<%= request.getContextPath()%>/jsp/main.jsp">홈</a></li>
        			<li title="현재 위치"><strong>로그인</strong></li>
    			</ol>
    		</div>

			<div class="titleArea">
			    <h2>로그인</h2>
			</div>
	
			<form name="frm" action="loginAction.jsp" method="post" onsubmit="return validation()">
				<div class="xans-element- xans-member xans-member-login ec-base-box typeThin ">
					<div class="login">
		        		<h3 class="boxTitle">회원로그인</h3>
		        		<fieldset>
							<legend>회원로그인</legend>
		            		<label class="id ePlaceholder" title="아이디"><input id="userId" name="userId" fw-filter="isFill" fw-label="아이디" fw-msg="" class="inputTypeText" placeholder="아이디" value="" type="text"></label>
		            		<label class="password ePlaceholder" title="비밀번호"><input id="userPw" name="userPw" fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="패스워드" fw-msg="" autocomplete="off" value="" type="password" placeholder="비밀번호"></label>
		            		<input type="submit" class="btn btn-primary form-control" value="로그인">
		            		<ul class="snsArea">
								<li class="displaynone">
									<a href="#none" onclick=""><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_naver_login.gif" alt="네이버 로그인"></a>
								</li>
				                <li class="">
				                    <a href="#none" onclick="MemberAction.snsLogin('googleplus', 'http%3A%2F%2Fjeuro.co.kr%2Findex.html')"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_google_login.gif" alt="구글 로그인"></a>
				                </li>
				                <li class="">
				                    <a href="javascript:kakaoLogin()" ><img src="//img.echosting.cafe24.com/skin/base_ko_KR/member/btn_kakao_login.gif" alt="카카오계정 로그인"></a>
				                </li>
				            </ul>
							<ul>
								<li><a href="find_id.jsp">아이디찾기</a></li>
				                <li><a href="find_pw.jsp">비밀번호찾기</a></li>
				                <li><a href="../join/join.jsp">회원가입</a></li>
				            </ul>
		        		</fieldset>
					</div>
				</div>
			</form>
        </div>
        <%@ include file="../common/nav.jsp" %> 
    </div>
    
    <%@ include file="../common/footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/bootstrap.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		Kakao.init('d25f2eb3a06f6d4241cd9748f0d57d9b');
	    function kakaoLogin() {
	        Kakao.Auth.login({
	            success: function (response) {
	                Kakao.API.request({
	                    url: '/v2/user/me',
	                    success: function (response) {
	                        alert(JSON.stringify(response))
	                    },
	                    fail: function (error) {
	                        alert(JSON.stringify(error))
	                    },
	                })
	            },
	            fail: function (error) {
	                alert(JSON.stringify(error))
	            },
	        })
	    }
		
		function validation(){
			if( frm.userId.value == "" ) {
		        frm.userId.focus();
		        alert("아이디를 입력해 주십시오.");

		        return false;
		    }
			if( frm.userPw.value == "" ) {
		        frm.userPw.focus();
		        alert("비밀번호를 입력해 주십시오.");

		        return false;
		    }
		}
	
	</script>
</body>
</html>