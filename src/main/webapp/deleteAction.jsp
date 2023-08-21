<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.Notice" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		}
		int noticeId = 0;
		if(request.getParameter("noticeId") != null){
			noticeId = Integer.parseInt(request.getParameter("noticeId"));
		}
		
		if(noticeId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}
		
		Notice notice = new NoticeDAO().getNotice(noticeId);
		if(!userId.equals(notice.getUserId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}else {
			NoticeDAO noticeDAO = new NoticeDAO();
			int result = noticeDAO.delete(noticeId);
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패하였습니다.')");
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
	%>
</body>
</html>