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
		
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		//검색키, 검색값
		
		String searchKey = null;
		String searchValue = null;
		
		
		if(request.getParameter("searchKey") != null || request.getParameter("searchKey") != "")
			searchKey = request.getParameter("searchKey");
		
		if(request.getParameter("searchWord") != null || request.getParameter("searchWord") != "")
			searchValue = request.getParameter("searchWord");
		
		NoticeDAO noticeDAO  = new NoticeDAO();
		ArrayList<Notice> list = noticeDAO.getList(pageNumber, searchKey, searchValue);
		
		

	%>
	<%@ include file="../common/header.jsp" %> 
	
	<div id="container">
        <div id="contents">
			<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
				<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
					<div class="path">
	            		<span>현재 위치</span>
	            		<ol>
							<li><a href="<%= request.getContextPath()%>/jsp/main.jsp">홈</a></li>
	                		<li><a href="notice.jsp">게시판</a></li>
	                		<li title="현재 위치"><strong>공지사항</strong></li>
	            		</ol>
					</div>
					<div class="titleArea">
	            		<h2 style="font-size: 1.72em;">공지사항 </h2>
	        		</div>
				</div>
				<!-- 
				<div class="boardSort">
                	<span class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 ">
                		<select id="reply_sort" name="reply_sort" fw-filter="" fw-label="" fw-msg="" onchange="BOARD.change_reply_sort(this);">
							<option value="" selected="selected">전체글보기</option>
								<option value="N">답변전 글보기</option>
								<option value="Y">답변완료 글보기</option>
						</select>
					</span>
    			</div>
    			 -->
				<div class="ec-base-table typeList gBorder">
        			<table border="1" summary="">
						<caption>게시판 목록</caption>
            			<colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
            				<col style="width:70px;">
							<col style="width:135px;" class="displaynone">
							<col style="width:auto;">
							<col style="width:84px;">
							<col style="width:77px;" class="">
							<col style="width:55px;" class="">
							<col style="width:55px;" class="displaynone">
							<col style="width:80px;" class="displaynone">
						</colgroup>
					<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
						<tr style=" ">
							<th scope="col"> 번호</th>
		                    <th scope="col" class="displaynone">카테고리</th>
		                    <th scope="col">제목</th>
		                    <th scope="col">작성자</th>
		                    <th scope="col" class="">작성일</th>
		                    <th scope="col" class="">조회</th>
		                    <th scope="col" class="displaynone">추천</th>
		                    <th scope="col" class="displaynone">평점</th>
		                </tr>
		            </thead>
					<tbody class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
						<% 
							
							for(int i = 0; i < list.size(); i++){
						%>
						<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
							<td> <%= list.get(i).getNoticeId() %></td>
		                    <td class="displaynone"></td>
		                    <td class="subject left txtBreak">
		                         <a href="noticeDetail.jsp?noticeId=<%= list.get(i).getNoticeId() %>" style="color:#555555;"><%= list.get(i).getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></a> <span class="txtEm"></span>
		                    </td>
		                    <td><%= list.get(i).getUserId() %></td>
		                    <td class=""><span class="txtNum"><%= list.get(i).getNoticeDate().substring(0, 11) + list.get(i).getNoticeDate().substring(11, 13) + "시 " + list.get(i).getNoticeDate().substring(14, 16) + "분 " %></span></td>
		                    <td class=""><span class="txtNum"><%= list.get(i).getViewCount() %></span></td>
		                    <td class="displaynone"><span class="txtNum">0</span></td>
		                    <td class="displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"></td>
		                </tr>
		                <%
							}
		                %>
					</tbody>
				</table>
				<p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone "></p>
    		</div>
			<div class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002 ec-base-button typeBG displaynone ">
				<span class="gRight"><a href="/board/free/write.html?board_no=1" class="btnSubmitFix sizeS displaynone">글쓰기</a></span>
			</div>
		</div>

		<div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
			<%
				if(pageNumber != 1){
			%>
				<a href="noticeList.jsp?pageNumber=<%=pageNumber - 1%>&searchKey=<%=searchKey%>&searchWord=<%=searchValue%>"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif" alt="이전 페이지"></a>
			<%
				}
			%>
			<ol>
				<li class="xans-record-"><a href="#" class="this"><%=pageNumber%></a></li>
            </ol>
            <%
				if(noticeDAO.nextPage(pageNumber + 1, searchKey, searchValue)){
			%>
				<a href="noticeList.jsp?pageNumber=<%=pageNumber + 1%>&searchKey=<%=searchKey%>&searchWord=<%=searchValue%>"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif" alt="다음 페이지"></a>
			<% 
			}
		%>
		</div>

		<div class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
			<fieldset class="boardSearch">
				<legend>게시물 검색</legend>
		        <p>
		        	<!-- 
		        	<select id="search_date" name="searchDate" fw-filter="" fw-label="" fw-msg="">
						<option value="week">일주일</option>
						<option value="month">한달</option>
						<option value="month3">세달</option>
						<option value="">전체</option>
					</select> 
					 -->
					<select id="search_key" name="keyWord" fw-filter="" fw-label="" fw-msg="">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writerName">작성자</option>
					</select> 
					<input id="search" name="searchWord" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> <button onclick="searchNotice()" class="btnEmFix">찾기</button>
				</p>
		    </fieldset>
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