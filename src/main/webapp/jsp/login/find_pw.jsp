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
		
		
		request.setAttribute("ID", "test");
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
    			<h2>비밀번호 찾기</h2>
			    <ul>
			    	<li>회원가입시 등록된 전화번호 및 이메일 정보로 비밀번호 찾기가 가능합니다.</li>
			    </ul>
			</div>

			<form name="frm" action="findPwAction.jsp" method="post" onsubmit="return validation()">
				<div class="xans-element- xans-member xans-member-findid ec-base-box typeThin ">
					<div class="findId">
        				<h3 class="boxTitle">비밀번호 찾기</h3>
        				<fieldset>
							<legend>비밀번호 찾기</legend>
            				<p class="check"><input id="check_find0" name="checkFind" fw-filter="" fw-label="찾는방법" fw-msg="" value="1" type="radio" style="display: none;"><label for="check_find0" style="display: none;"><span id="ssn_lable" style="display: none;"></span></label>
								<input id="check_find1" name="checkFind" fw-filter="" fw-label="찾는방법" fw-msg="" value="2" type="radio" checked="checked"><label for="check_find1">이메일</label>
								<input id="check_find2" name="checkFind" fw-filter="" fw-label="찾는방법" fw-msg="" value="3" type="radio"><label for="check_find2"><span id="search_type_mobile_lable" style="display:inline;">휴대폰번호</span></label>
							</p>
				            <p id="id_view" class="idUser" style=""><strong id="id_lable">아이디</strong> <input id="id_User" name="userId" fw-filter="" fw-label="아이디" fw-msg="" class="lostInput" style="width: 226px;" placeholder="" value="" type="text"></p>
				            <p id="name_view" class="name" style=""><strong id="name_lable">이름</strong> <input id="name" name="userName" fw-filter="" fw-label="이름" fw-msg="" class="lostInput" placeholder="" value="" type="text"></p>
				            <p id="email_view" class="email" style=""><strong>이메일로 찾기</strong> <input id="email" name="userEmail" fw-filter="isEmail" fw-label="이메일" fw-msg="" class="lostInput" placeholder="" value="" type="text"></p>
				            <p id="mobile_view" class="mobile" style="display:none;"><strong>휴대폰 번호로 찾기</strong> <input id="mobile1" name="userTel1" fw-filter="isMin[3]&amp;isMax[3]&amp;isNumber" fw-label="휴대전화 번호" fw-msg="" class="mobile" placeholder="" maxlength="3" value="" type="text"> - <input id="mobile2" name="userTel2" fw-filter="isMin[3]&amp;isMax[4]&amp;isNumber" fw-label="휴대전화 번호" fw-msg="" class="mobile" placeholder="" maxlength="4" value="" type="text"> - <input id="mobile3" name="userTel3" fw-filter="isMin[4]&amp;isMax[4]&amp;isNumber" fw-label="휴대전화 번호" fw-msg="" class="mobile" placeholder="" maxlength="4" value="" type="text"></p>
				            <div class="ec-base-button gColumn">
				            	<input type="submit" class="btn btn-primary form-control" value="확인">
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
	<script src="<%= request.getContextPath()%>/<%= request.getContextPath()%>/js/bootstrap.js"></script>
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
			
			$("#id_User").val("");
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
			if( frm.userId.value == "" ) {
		        frm.userId.focus();
		        alert("아이디를 입력해 주십시오.");

		        return false;
		    }

			
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