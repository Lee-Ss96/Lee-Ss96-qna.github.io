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
        			<li title="현재 위치"><strong>회원 가입</strong></li>
    			</ol>
    		</div>
			<div class="titleArea">
			    <h2>회원 가입</h2>
			</div>

			<form name="frm" method="post" action="joinAction.jsp" onsubmit="return validation()">
				<div class="xans-element- xans-member xans-member-join">
				<div class="ec-base-table typeWrite">
	        		<table border="1" summary="">
						<caption>회원가입</caption>
	        			<colgroup>
							<col style="width:150px;">
							<col style="width:auto;">
						</colgroup>
					</table>
				</div>
				<h3 class="displaynone ">기본정보</h3>
				<p class="required displaynone"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"> 필수입력사항</p>
				<div class="ec-base-table typeWrite">
	        		<table border="1" summary="">
						<caption>회원 기본정보</caption>
	        			<colgroup>
							<col style="width:150px;">
							<col style="width:auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">아이디 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
	                			<td><input id="userId" name="userId" onblur="onBlurId()" fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[20]&amp;isIdentity" fw-label="아이디" fw-msg="" maxlength="16" class="inputTypeText" placeholder="" value="" type="text"> <span id="idMsg"></span> (영문소문자/숫자, 4~16자)
	                			<br> <span id="idChk" style="display:none;"></span></td>
	            			</tr>
							<tr>
								<th scope="row">비밀번호 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
	                			<td>
	                    			<div class="eTooltip">
	                        			<input id="userPw" name="userPw" onblur="onBlur()" fw-filter="isFill&amp;isMin[4]&amp;isMax[20]" fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="20" 0="disabled" value="" type="password">
	                    			</div>
	                    			<span>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~20자)</span><br>
	                    			<span id="pwIn" style="display:none;"></span>                     
	                    		</td>
	           				 </tr>
							<tr>
								<th scope="row">비밀번호 확인 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
	                			<td><input id="passwd_confirm" name="user_passwd_confirm" oninput="pwCheck()" fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="20" 0="disabled" value="" type="password"> <span id="pwConfirmMsg"></span><br>
									<span id="pwConfirm" style="display:none;"></span> </td>
	            			</tr>
							<tr>
								<th scope="row" id="nameTitle">이름 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
	                			<td><span id="nameContents"><input type="text" name="userName" id="userName" maxlength="20"></span>
	                    			<span id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인 동의가 필요합니다.</span>
	                			</td>
	            			</tr>
	            			<tr>
								<th scope="row" id="gender">성별 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
	                			<td>
	                				<div clase="btn-group" data-toggle="buttons">
										<label class="btn btn-primary active">
											<input type="radio" name="userGender" autocomplate="off" value="male" checked>남자
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="userGender" autocomplate="off" value="female" checked>여자
										</label>
									</div>
	                			</td>
	            			</tr>
							<tr class="displaynone">
								<th scope="row">주소 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="displaynone" alt="필수"></th>
	                			<td>
				                    <input id="postcode1" name="postcode1" fw-filter="isLengthRange[1][14]" fw-label="우편번호1" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="" type="text">                    <a href="#none" class="btnNormal" onclick="" id="postBtn">우편번호</a><br>
				                    <input id="addr1" name="addr1" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text"> 기본주소<br>
				                    <input id="addr2" name="addr2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> 나머지주소                 
				                </td>
				            </tr>
							<tr class="">
								<th scope="row">휴대전화 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" class="displaynone" alt="필수"></th>
	                			<td><select id="mobile1" name="userTel1" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									</select>-<input id="mobile2" name="userTel2" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="" type="text">-<input id="mobile3" name="userTel3" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="" type="text">
								</td>
	            			</tr>
							<tr>
								<th scope="row">이메일 <img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수"></th>
	                			<td><input id="email1" name="userEmail" fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N" fw-msg="" placeholder="" value="" type="email"> <span id="emailMsg"></span>
								</td>
	            			</tr>
						</tbody>
					</table>
				</div>
				<div class="ec-base-button">
					<input type="submit" class="btnSubmitFix sizeM" value="회원가입">
			    </div>
				<div id="ec_shop_member_confirm-infolayer" class="joinConfirm ec-base-layer">
	    			<a href="#none" class="close"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif" alt="닫기" onclick="CheckingJoinInfoLayerClose()"></a>
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
		var idVal = 0;
		var pwVal = 0;
		var pwChk = 0;
	
		function onBlurId(){
			 var id = $("#userId").val();
			 var engNum = id.search(/^[a-zA-Z0-9]*$/);
			 
			 if(id.length < 4 || id.length > 16){
				 $('#idChk').text('4자리 ~ 16자리 이내로 입력해주세요.').css({'color':'red', 'display':'block'} );
				 idVal = 0;
			 }else if(id.search(/\s/) != -1){
				 $('#idChk').text('아이디는 공백 없이 입력해주세요.').css({'color':'red', 'display':'block'} )
				 idVal = 0;
			 }else if( engNum < 0  ){
				 $('#idChk').text('영문,숫자만 입력해주세요.').css({'color':'red', 'display':'block'} )
				 idVal = 0;
			 }else {
				 $('#idChk').text('조건에 일치하는 아이디입니다.').css({'color':'green', 'display':'block'} );
				 idVal = 1;
			 }
		}
		
		function onBlur(){
			 var pw = $("#userPw").val();
			 var num = pw.search(/[0-9]/g);
			 var eng = pw.search(/[a-z]/ig);
			 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			 
			 $('#passwd_confirm').val("");
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
		
		function validation(){
			if( frm.userId.value == "" ) {
		        frm.userId.focus();
		        alert("아이디를 입력해 주십시오.");

		        return false;
		    }
			if( idVal == 0 ) {
		        frm.userId.focus();
		        alert("조건에 일치하는 아이디를 입력해주십시오.");

		        return false;
		    }
			if( frm.userPw.value == "" ) {
		        frm.userPw.focus();
		        alert("비밀번호를 입력해 주십시오.");

		        return false;
		    }
			if( pwVal == 0 ) {
		        frm.userPw.focus();
		        alert("조건에 일치하는 비밀번호를 입력해주십시오.");

		        return false;
		    }
			if( pwChk == 0 ) {
		        frm.user_passwd_confirm.focus();
		        alert("비밀번호가 일치하지 않습니다.");

		        return false;
		    }
			if( frm.userName.value == "" ) {
		        frm.userName.focus();
		        alert("성명을 입력해 주십시오.");

		        return false;
		    }
			if( frm.userEmail.value == "" ) {
		        frm.userEmail.focus();
		        alert("이메일 입력해 주십시오.");

		        return false;
		    }
		}
	
		function pwCheck(){
		    if($('#userPw').val() == $('#passwd_confirm').val()){
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