<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="notice.NoticeDAO" %> 
<%@ page import="notice.Notice" %> 
<%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/custom.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/notice.css">
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
		
		
		NoticeDAO noticeDAO  = new NoticeDAO();
		Notice notice = noticeDAO.getNotice(noticeId);

	%>
	<%@ include file="../common/header.jsp" %> 
	
	<div id="container">
        <div id="contents">
			<div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 ">
				<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
					<div class="path">
            			<span>현재 위치</span>
            			<ol>
							<li><a href="/">홈</a></li>
			                <li><a href="/board/index.html">게시판</a></li>
			                <li title="현재 위치"><strong>공지사항</strong></li>
			            </ol>
					</div>
					<div class="titleArea">
			            <h2>공지사항</h2>
			            <p>공지사항입니다.</p>
			        </div>
				</div>
				<form id="BoardDelForm" name="" action="/exec/front/Board/del/1" method="post" target="_self" enctype="multipart/form-data">
					<div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
						<div class="ec-base-table typeWrite ">
            				<table border="1" summary="">
								<caption>게시판 상세</caption>
            					<colgroup>
									<col style="width:130px;">
									<col style="width:auto;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
									    <td><%= notice.getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
                					</tr>
									<tr>
										<th scope="row">작성자</th>
                    					<td><%= notice.getUserId() %> </td>
                					</tr>
									<tr>
										<td colspan="2">
                        					<ul class="etcArea">
                            					<li class=""><strong>작성일</strong> <span class="txtNum"><%= notice.getNoticeDate().substring(0, 11) + notice.getNoticeDate().substring(11, 13) + "시 " + notice.getNoticeDate().substring(14, 16) + "분 " %></span></li>
                            					<li class=""><strong>조회수</strong> <span class="txtNum"><%= notice.getViewCount() %></span></li>
                        					</ul>
											<div class="detail">
												<div class="fr-view fr-view-article">
													<p><%= notice.getNoticeCon() %></p><p><br></p>
												</div>
											</div>
                    					</td>
                					</tr>
								</tbody>
							</table>
						</div>
						<div class="ec-base-button ">
            				<span class="gLeft">
                				<a href="javascript:window.history.back();" class="btnNormalFix sizeS">목록</a>
            				</span>
				            <span class="gRight">
				                <a href="#none" onclick="BOARD_READ.article_delete('BoardDelForm','1');" class="btnNormalFix sizeS displaynone">삭제</a>
				                <a href="/board/free/modify.html?board_act=edit&amp;no=7983&amp;board_no=1&amp;page=1" class="btnEmFix sizeS displaynone">수정</a>
				                <a href="/board/free/reply.html" class="btnSubmitFix sizeS displaynone">답변</a>
				            </span>
				        </div>
					</div>
				</form>
			</div>

			<div class="xans-element- xans-board xans-board-commentpackage-1002 xans-board-commentpackage xans-board-1002 ">
				<form id="commentForm" name="" action="/exec/front/Board/CommentUpdate/1" method="post" target="_self" enctype="multipart/form-data" style="display: none;">
					<div class="xans-element- xans-board xans-board-commentform-1002 xans-board-commentform xans-board-1002 ">
						<fieldset>
							<legend>댓글 수정</legend>
	            			<p>비밀번호 : <input id="comment_password" name="comment_password" fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value="" type="password"> <span class="secret "><label><input id="secure0" name="secure" fw-filter="" fw-label="비밀댓글" fw-msg="" value="T" type="checkbox"><label for="secure0"></label>비밀댓글</label></span></p>
				            <div class="view">
				                <textarea id="comment_modify" name="comment_modify" fw-filter="isFill" fw-label="댓글내용" fw-msg=""></textarea>                <span class="submit">
				                    <a href="#none" class="btnEm sizeL" onclick="BOARD_COMMENT.comment_update_ok('commentForm');">수정</a>
				                    <a href="#none" class="btnNormal sizeL" onclick="BOARD_COMMENT.comment_cancel_ok('commentForm');">취소</a>
				                </span>
				            </div>
	            			<p class="displaynone"> /  byte</p>
        				</fieldset>
					</div>
				</form>
				<form id="commentSecretForm" name="" action="/exec/front/Board/CommentSecret/1" method="post" target="_self" enctype="multipart/form-data" style="display: none;">
					<div class="xans-element- xans-board xans-board-commentformsecret-1002 xans-board-commentformsecret xans-board-1002 "><p>비밀번호 : <input id="secure_password" name="secure_password" fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value="" type="password">            <a href="#none" class="btnNormal" onclick="BOARD_COMMENT.show_secret_comment('commentSecretForm');">확인</a>
			            <a href="#none" class="btnNormal" onclick="BOARD_COMMENT.hide_secret_comment_form('commentSecretForm');">취소</a>
			        	</p>
					</div>
				</form>
			</div>

			<div class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
				<ul>
				<%
					if(noticeDAO.getPrevNotice(noticeId).getNoticeTitle() != null){
				%>
					<li class="prev">
						<strong>이전글</strong><a href="noticeDetail.jsp?noticeId=<%= noticeDAO.getPrevNotice(noticeId).getNoticeId() %>"><%=noticeDAO.getPrevNotice(noticeId).getNoticeTitle() %></a>
					</li>
				<%
					}
					if(noticeDAO.getNextNotice(noticeId).getNoticeTitle() != null){
				%>
        			<li class="next ">
						<strong>다음글</strong><a href="noticeDetail.jsp?noticeId=<%= noticeDAO.getNextNotice(noticeId).getNoticeId() %>"><%=noticeDAO.getNextNotice(noticeId).getNoticeTitle() %></a>
					</li>
				<%
					}
				%>
    			</ul>
			</div>

<!-- 관리자 전용 메뉴 -->
<!-- // 관리자 전용 메뉴 -->

        </div>
        <%@ include file="../common/nav.jsp" %> 
    </div>
    
    <%@ include file="../common/footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/bootstrap.js"></script>
	<script>
	
		
	
	function searchNotice() {
	    var searchKey = $("#search_key").val();
	    var searchWord = $("#search").val();
	    
	    location.href = "noticeList.jsp?searchKey=" + searchKey + "&searchWord=" + searchWord;
	}
	</script>
</body>
</html>