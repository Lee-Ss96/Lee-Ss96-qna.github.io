<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="userPw" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userTel1" />
<jsp:setProperty name="user" property="userTel2" />
<jsp:setProperty name="user" property="userTel3" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="checkFind" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.css">
<title>게시판 프로젝트</title>
</head>
<body>
	<%
		String userId = null;
	
		if(session.getAttribute("userId") != null){
			userId = (String) session.getAttribute("userId");
		}
		if(userId != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href = '../main.jsp'");
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		
		
		int result = userDAO.findPw(user);
		
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('조회 된 회원 정보가 존재하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원 정보에 오류가 발생하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			//session.setAttribute("userId", user.getUserId());
			session.setAttribute("idVal", user.getUserId());
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'find_pw_success.jsp'");
			script.println("</script>");
		}
		
	%>
</body>
</html>