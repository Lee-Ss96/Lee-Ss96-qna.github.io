<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="notice" class="notice.Notice" scope="page" />
<jsp:setProperty name="notice" property="noticeTitle" />
<jsp:setProperty name="notice" property="noticeCon" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판 프로젝트</title>
</head>
<body>
	<%
		String userId = null;
		
		if(session.getAttribute("userId") != null){
			userId = (String) session.getAttribute("userId");
		}
		if(userId == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요한 서비스입니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}else {
		
			if(notice.getNoticeTitle() == null || notice.getNoticeCon() == null ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않은 항목이 존재합니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				NoticeDAO noticeDAO = new NoticeDAO();
				int result = noticeDAO.write(notice.getNoticeTitle(), userId, notice.getNoticeCon());
				
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'notice.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>