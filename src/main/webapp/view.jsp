<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="notice.Notice" %> 
<%@ page import="notice.NoticeDAO" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.css">
<title>게시판 프로젝트</title>
</head>
<body>
	<%
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String) session.getAttribute("userId");
		}
		
		int noticeId = 0;
		if(request.getParameter("noticeId") != null){
			noticeId = Integer.parseInt(request.getParameter("noticeId"));
		}
		
		if(noticeId == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}
		
		Notice notice = new NoticeDAO().getNotice(noticeId);
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">게시판 사이트 구축</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="notice.jsp">게시판</a></li>
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
				<ul class="nav navbar-nav navbar-right">
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
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%">글 제목</td>
						<td colspan="2"><%= notice.getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= notice.getUserId() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= notice.getNoticeDate().substring(0, 11) + notice.getNoticeDate().substring(11, 13) + "시 " + notice.getNoticeDate().substring(14, 16) + "분 " %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= notice.getNoticeCon().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="notice.jsp" class="btn btn-primary">목록</a>
			<%
				if(userId != null && userId.equals(notice.getUserId())) {
			%>
					<a href="update.jsp?noticeId=<%= noticeId %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('게시글을 삭제하시겠습니까?')" href="deleteAction.jsp?noticeId=<%= noticeId %>" class="btn btn-primary">삭제</a>
			<% 
				}
			%>
		</div>
	</div>	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/bootstrap.js"></script>
</body>
</html>