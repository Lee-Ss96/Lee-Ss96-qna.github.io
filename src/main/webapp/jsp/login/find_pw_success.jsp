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
		
		String idVal = (String)session.getAttribute("idVal");
	%>
	<%@ include file="../common/header.jsp" %> 
	
	<div id="container">
        <div id="contents">
			<div class="path">
    			<span>현재 위치</span>
    			<ol>
    				<li><a href="<%= request.getContextPath()%>/jsp/main.jsp">홈</a></li>
        			<li title="현재 위치"><strong>비밀번호 찾기</strong></li>
    			</ol>
    		</div>

			<div class="titleArea">
    			<h2>회원 비밀번호 조회</h2>
			</div>

			<form name="frm" action="updatePwAction.jsp" method="post" onsubmit="return validation()">
				<div class="xans-element- xans-member xans-member-findid ec-base-box typeThin ">
					<div class="findId">
        				<h3 class="boxTitle">회원 비밀번호 조회</h3>
        				<fieldset>
							<legend>회원 비밀번호 조회</legend>
				            <p id="name_view" class="name" style=""><strong id="name_lable" style="width: 100%; text-align: center;">새 비밀번호로 변경해주십시오. </strong></p>
				            <p style=""><strong id="idInup_lable">아이디</strong> <input id="idInput" name="userId" fw-filter="" fw-label="새 비밀번호" fw-msg="" style="width: 226px;" class="lostInput" placeholder="(문자 2가지 이상조합, 10~20자)" value="<%= idVal %>" type="text">
				            </p>
				            <p id="new_pw" class="name" style=""><strong id="newPw_lable">새 비밀번호</strong> <input id="newPw" onblur="onBlur()" name="userPw" fw-filter="" fw-label="새 비밀번호" fw-msg="" style="width: 226px;" class="lostInput" placeholder="(문자 2가지 이상조합, 10~20자)" value="" type="password">
				            	<span id="pwIn" style="display:none; padding-left: 34%;"></span>
				            </p>
				            <p id="new_pw_chk" class="name" style=""><strong id="newPwChk_lable">새 비밀번호 확인</strong> <input id="newPwChk" name="userPwChk" oninput="pwCheck()" fw-filter="" fw-label="새 비밀번호 확인" fw-msg=""  style="width: 226px;" class="lostInput" placeholder="" value="" type="password">
				            	<span id="pwConfirm" style="display:none; padding-left: 34%;"></span>
				            </p>
				            <div class="ec-base-button gColumn">
				            	<input type="submit" class="btn btn-primary form-control" class="btn btn-primary form-control" value="변경하기">
				            </div>
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
	<script>
		var findType = "2";
		
		var pwVal = 0; 		
		var pwChk = 0;
		
		//라디오버튼 초기화
		if (document.addEventListener) {
			window.addEventListener('pageshow', function (event) {
				if (event.persisted || window.performance && window.performance.navigation.type == 2) {
					location.reload();
				}
			}, false);
		}
		
		
		//비밀번호 조건
		function onBlur(){
			 var pw = $("#newPw").val();
			 var num = pw.search(/[0-9]/g);
			 var eng = pw.search(/[a-z]/ig);
			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			 
			 $('#newPwChk').val("");
			 $('#pwIn').text('').css({'color':'red', 'display':'none'} )

			 if(pw.length < 10 || pw.length > 20){
				 $('#pwIn').text('10자리 ~ 20자리 이내로 입력해주세요.').css({'color':'red', 'display':'block'} )
			 }else if(pw.search(/\s/) != -1){
				 $('#pwIn').text('비밀번호는 공백 없이 입력해주세요.').css({'color':'red', 'display':'block'} )
			 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
				 $('#pwIn').text('영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요..').css({'color':'red', 'display':'block'} )
			 }else {
				 $('#pwIn').text('조건에 일치하는 비밀번호입니다.').css({'color':'green', 'display':'block'} )
				 pwVal = 1;
			 }
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
			if( frm.userPw.value == "" ) {
		        frm.userPw.focus();
		        alert("새로운 비밀번호를 입력해 주십시오.");

		        return false;
		    }
			
			if( pwVal == 0 ) {
		        frm.userPw.focus();
		        alert("조건에 일치하는 비밀번호를 입력해주십시오.");

		        return false;
		    }
			
			if( frm.userPwChk.value == "" ) {
		        frm.userPwChk.focus();
		        alert("비밀번호를 확인란을 입력해 주십시오.");
		        return false;
		    }
			
			if( pwChk == 0 ) {
		        frm.userPwChk.focus();
		        alert("비밀번호가 일치하지 않습니다.");

		        return false;
		    }
		}
		
		function pwCheck(){
		    if($('#newPw').val() == $('#newPwChk').val()){
		    	pwChk = 1;
		        $('#pwConfirm').text('비밀번호 일치').css({'color':'green', 'display':'block'} );
		    }else{
		    	pwChk = 0;
		        $('#pwConfirm').text('비밀번호 불일치').css({'color':'red', 'display':'block'});
		    }
		}

	</script>
</body>
</html>