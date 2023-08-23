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
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/notice.css">
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
			    <ol><li><a href="<%= request.getContextPath()%>/jsp/main.jsp">홈</a></li>
			        <li title="현재 위치"><strong>게시판 메인</strong></li>
			    </ol>
			</div>
			<div class="titleArea">
			    <h2>게시판 메인</h2>
			</div>

			<div class="boardMain">
			    <div class="leftArea">
            </div>
    		<div class="rightArea">
            </div>
		</div>

		<div class="boardMain">
    		<div class="leftArea">
       			<div class="xans-element- xans-board xans-board-listpackage-1 xans-board-listpackage xans-board-1 board "><h3 class="xans-element- xans-board xans-board-title-1 xans-board-title xans-board-1 " style="font-size: 1.17em;">공지사항</h3>
					<div class="ec-base-table typeList gLine">
                		<table border="1" summary="">
							<caption>공지사항 목록</caption>
                			<colgroup>
								<col style="width:auto;">
								<col style="width:100px;">
							</colgroup>
							<thead class="xans-element- xans-board xans-board-listheader-1 xans-board-listheader xans-board-1 blind "><tr>
								<th scope="col">제목</th>
                        		<th scope="col">작성일</th>
                    			</tr>
                    		</thead>
							<tbody class="xans-element- xans-board xans-board-list-1 xans-board-list xans-board-1 top">
								<tr class="xans-record-">
									<td class="title"><a href="/article/공지사항/1/7983/">카드사 할부 혜택 - 2022년 4월</a> </td>
                        			<td class="right ">2021-03-09</td>
                    			</tr>
								<tr class="xans-record-">
									<td class="title"><a href="/article/공지사항/1/7084/">제이유로 설치팀에서 인덕션 설치 기사님을 모집</a> </td>
                        			<td class="right ">2021-02-18</td>
                    			</tr>
								<tr class="xans-record-">
									<td class="title"><a href="/article/공지사항/1/6396/">설 연휴 택배사별 배송일정 안내</a> </td>
                        			<td class="right ">2021-02-03</td>
                    			</tr>
								<tr class="xans-record-">
									<td class="title"><a href="/article/공지사항/1/6096/">[인덕션 배송 공지] 택배노조 파업 및 명절 </a> </td>
                        			<td class="right ">2021-01-28</td>
                    			</tr>
								<tr class="xans-record-">
									<td class="title"><a href="/article/공지사항/1/488/">코로나-19 이슈 관련 고객센터 운영 안내</a> </td>
                        			<td class="right ">2020-07-30</td>
                    			</tr>
							</tbody>
						</table>
					</div>
					<a href="/board/free/list.html?board_no=1" class="btnLink">더보기</a>
				</div>
    		</div>

    		<div class="rightArea">
        		<div class="xans-element- xans-board xans-board-listpackage-2 xans-board-listpackage xans-board-2 board "><h3 class="xans-element- xans-board xans-board-title-2 xans-board-title xans-board-2 " style="font-size: 1.17em;">뉴스/이벤트</h3>
					<div class="ec-base-table typeList gLine">
                		<table border="1" summary="">
							<caption>뉴스&amp;이벤트 목록</caption>
                			<colgroup>
								<col style="width:auto;">
								<col style="width:100px;">
							</colgroup>
							<thead class="xans-element- xans-board xans-board-listheader-2 xans-board-listheader xans-board-2 blind ">
								<tr>
									<th scope="col">제목</th>
	                        		<th scope="col">작성일</th>
	                    		</tr>
	                    	</thead>
							<tbody class="xans-element- xans-board xans-board-list-2 xans-board-list xans-board-2 top">
								<tr class="xans-record-">
									<td class="title"><a href="/article/뉴스이벤트/2/8867/">제이유로 캠페인 시즌 1 두번째, 소원을 말해</a> </td>
                        			<td class="right ">2021-04-17</td>
                   				</tr>
								<tr class="xans-record-">
									<td class="title"><a href="/article/뉴스이벤트/2/8484/">제이유로 캠페인 시즌 1 : 내돈내산 리뷰 이</a> </td>
                        			<td class="right ">2021-03-25</td>
                    			</tr>
								<tr class="xans-record-">
									<td class="title"><a href="/article/뉴스이벤트/2/8426/">신혼부부 신부님을 위한 제이유로 이벤트</a> </td>
								    <td class="right ">2021-03-24</td>
								</tr>
								<tr class="xans-record-">
									<td class="title"><a href="/article/뉴스이벤트/2/4573/">제이유로 설치비 지원</a> </td>
								    <td class="right ">2020-12-22</td>
								</tr>
							</tbody>
						</table>
					</div>
					<a href="/board/free/list.html?board_no=2" class="btnLink">더보기</a>
				</div>
			</div>
		</div>


		<!--<div class="boardMain">
    		<div class="leftArea">
        		<div class="xans-element- xans-board xans-board-listpackage-3 xans-board-listpackage xans-board-3 board "><h3 class="xans-element- xans-board xans-board-title-3 xans-board-title xans-board-3 " style="font-size: 1.17em;">이용안내 FAQ</h3>
					<div class="ec-base-table typeList gLine">
                		<table border="1" summary="">
							<caption>이용안내 목록</caption>
                			<colgroup>
								<col style="width:auto;">
								<col style="width:100px;">
							</colgroup>
							<thead class="xans-element- xans-board xans-board-listheader-3 xans-board-listheader xans-board-3 blind ">
								<tr>
									<th scope="col">제목</th>
                        			<th scope="col">작성일</th>
                    			</tr>
                    		</thead>
						</table>
					</div>
					<a href="/board/free/list.html?board_no=3" class="btnLink">더보기</a>
				</div>
    		</div>

    		<div class="rightArea">
        		<div class="xans-element- xans-board xans-board-listpackage-7 xans-board-listpackage xans-board-7 board "><h3 class="xans-element- xans-board xans-board-title-7 xans-board-title xans-board-7 " style="font-size: 1.17em;">자료실</h3>
					<div class="ec-base-table typeList gLine">
                		<table border="1" summary="">
							<caption>자료실 목록</caption>
                			<colgroup>
								<col style="width:auto;">
								<col style="width:100px;">
							</colgroup>
							<thead class="xans-element- xans-board xans-board-listheader-7 xans-board-listheader xans-board-7 blind ">
								<tr>
									<th scope="col">제목</th>
                        			<th scope="col">작성일</th>
                    			</tr>
                    		</thead>
						</table>
					</div>
					<a href="/board/free/list.html?board_no=7" class="btnLink">더보기</a>
				</div>
    		</div>
		</div>
-->
		<div class="boardMain">
    		<div class="leftArea">
        		<div class="xans-element- xans-board xans-board-listpackage-6 xans-board-listpackage xans-board-6 board "><h3 class="xans-element- xans-board xans-board-title-6 xans-board-title xans-board-6 " style="font-size: 1.17em;">상품 Q&A</h3>
					<div class="xans-element- xans-board xans-board-list-6 xans-board-list xans-board-6 galleryList">
						<ul>
							<li class="xans-record-"><a href="/article/상품-qa/6/13302/" class="imgLink">김**** - 상품 Q&amp;A </a><span>2023-08-07</span></li>
							<li class="xans-record-"><a href="/article/상품-qa/6/13291/" class="imgLink"><img src="//jeuro.co.kr/web/product/tiny/20200503/f7b138b899d9558bde34541622c9c47f.jpg" border="0" alt="">서**** - 상품 Q&amp;A </a><span>2023-05-23</span></li>
                		</ul>
					</div>
					<a href="/board/product/list.html?board_no=6" class="btnLink">더보기</a>
				</div>
    		</div>

    		<div class="rightArea">
        		<div class="xans-element- xans-board xans-board-listpackage-8 xans-board-listpackage xans-board-8 board "><h3 class="xans-element- xans-board xans-board-title-8 xans-board-title xans-board-8 " style="font-size: 1.17em;">내돈내산 리뷰 게시판</h3>
					<div class="xans-element- xans-board xans-board-list-8 xans-board-list xans-board-8 galleryList">
						<ul>
							<li class="xans-record-"><a href="/article/내돈내산-리뷰-게시판/8/10077/" class="imgLink"><img src="//jeuro.co.kr/file_data/jeuro25/gallery/2021/08/24/7cb181b3b3c5f286a019863024a2b399.jpg" alt="">지멘스인덕션 강추 </a><span>2021-08-24</span></li>
                    		<li class="xans-record-"><a href="/article/내돈내산-리뷰-게시판/8/9966/" class="imgLink"><img src="//jeuro.co.kr/file_data/jeuro25/gallery/2021/08/09/0b257f0cf5cdad66d0d870b68050c865.jpg" alt="">EX651FEB1F 내돈내산 리뷰 </a><span>2021-08-09</span></li>
                		</ul>
					</div>
					<a href="/board/gallery/list.html?board_no=8" class="btnLink">더보기</a>
				</div>
    		</div>
		</div>
     </div>
     
    <%@ include file="../common/nav.jsp" %> 
    </div>
    
    <%@ include file="../common/footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="<%= request.getContextPath()%>/js/bootstrap.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		
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