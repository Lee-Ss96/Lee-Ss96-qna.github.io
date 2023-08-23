package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDAO {

	private Connection conn;
	private ResultSet rs;
	
	public NoticeDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/notice";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";   //db 오류
	}
	

	public int getNext(String searchKey, String searchWord) {
		String SQL = "";
		if(searchWord == null || searchWord == "" || "null".equals(searchWord)) {
			SQL = "SELECT noticeId FROM NOTICE ORDER BY noticeId DESC";
		}else {
			if("subject".equals(searchKey)) {
				SQL = "SELECT noticeId FROM NOTICE WHERE noticeTitle LIKE ? ORDER BY noticeId DESC";
			}else if("content".equals(searchKey)) {
				SQL = "SELECT noticeId FROM NOTICE WHERE noticeCon LIKE ? ORDER BY noticeId DESC";
			}else if("writerName".equals(searchKey)) {
				SQL = "SELECT noticeId FROM NOTICE WHERE userId LIKE ? ORDER BY noticeId DESC";
			}
			
		}
				
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			if(searchWord == null || searchWord == "" || "null".equals(searchWord)) {
			}else {
				pstmt.setString(1, "%" + searchWord + "%");
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			
			return 1; //첫번째 게시글

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;   //db 오류
	}

	
	/*public int write(String noticeTitle, String userId, String noticeCon) {
		String SQL = "INSERT INTO NOTICE VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, noticeTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, noticeCon);
			pstmt.setInt(6, 1);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;   //db 오류
	}*/
	
	
	//게시글 리스트
	public ArrayList<Notice> getList(int pageNumber, String searchKey, String searchWord){
		String SQL = "";
		
		if(searchWord == null || searchWord == "" || "null".equals(searchWord)) {
			SQL = "SELECT * FROM NOTICE WHERE noticeId < ? AND noticeDel = 'N' ORDER BY noticeId DESC LIMIT 10";
		}else {
			if("subject".equals(searchKey)) {
				SQL = "SELECT * FROM NOTICE WHERE noticeDel = 'N' AND noticeTitle LIKE ? ORDER BY noticeId DESC LIMIT ?, 10";
			}else if("content".equals(searchKey)) {
				SQL = "SELECT * FROM NOTICE WHERE noticeDel = 'N' AND noticeCon LIKE ? ORDER BY noticeId DESC LIMIT ?, 10";
			}else if("writerName".equals(searchKey)) {
				SQL = "SELECT * FROM NOTICE WHERE noticeDel = 'N' AND userId LIKE ? ORDER BY noticeId DESC LIMIT ?, 10";
			}
				
		}
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			if(searchWord == null || searchWord == "" || "null".equals(searchWord)) {
				pstmt.setInt(1, getCount(searchKey, searchWord) - (pageNumber - 1) * 10);
			}else {
				pstmt.setString(1, "%" + searchWord + "%");
				pstmt.setInt(2, (pageNumber - 1) * 10);
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setNoticeCon(rs.getString(3));
				notice.setUserId(rs.getString(4));
				notice.setNoticeDate(rs.getString(5));
				notice.setViewCount(rs.getInt(6));
				notice.setNoticeDel(rs.getString(7));
				list.add(notice);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean nextPage(int pageNumber, String searchKey, String searchWord) {
		String SQL = "";
		if(searchWord == null || searchWord == "" || "null".equals(searchWord)) {
			SQL = "SELECT * FROM NOTICE WHERE noticeId < ? AND noticeDel = 'N'";
		}else {
			if("subject".equals(searchKey)) {
				SQL = "SELECT * FROM NOTICE WHERE noticeId < ? AND noticeDel = 'N' AND noticeTitle LIKE ?";
			}else if("content".equals(searchKey)) {
				SQL = "SELECT * FROM NOTICE WHERE noticeId < ? AND noticeDel = 'N' AND noticeCon  LIKE ?";
			}else if("writerName".equals(searchKey)) {
				SQL = "SELECT * FROM NOTICE WHERE noticeId < ? AND noticeDel = 'N' AND userId LIKE ?";
			}
		}
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getCount(searchKey,searchWord) - (pageNumber - 1) * 10);
			
			if(searchWord == null || searchWord == "" || "null".equals(searchWord)) {
				
			}else {
				pstmt.setString(2, "%" + searchWord + "%");
			}
			rs = pstmt.executeQuery();

			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public int getCount(String searchKey, String searchWord) {
		String SQL = "";
		if(searchWord == null || searchWord == "" || "null".equals(searchWord)) {
			SQL = "SELECT count(*) FROM NOTICE ORDER BY noticeId DESC";
		}else {
			if("subject".equals(searchKey)) {
				SQL = "SELECT count(*) FROM NOTICE WHERE noticeTitle LIKE ? ORDER BY noticeId DESC";
			}else if("content".equals(searchKey)) {
				SQL = "SELECT count(*) FROM NOTICE WHERE noticeCon LIKE ? ORDER BY noticeId DESC";
			}else if("writerName".equals(searchKey)) {
				SQL = "SELECT count(*) FROM NOTICE WHERE userId LIKE ? ORDER BY noticeId DESC";
			}
			
		}
				
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			if(searchWord == null || searchWord == "" || "null".equals(searchWord)) {
			}else {
				pstmt.setString(1, "%" + searchWord + "%");
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			
			return 1; //첫번째 게시글

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;   //db 오류
	}
	
	//글 상세
	public Notice getNotice(int noticeId) {
		String SQL = "SELECT * FROM NOTICE WHERE noticeId = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, noticeId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setNoticeCon(rs.getString(3));
				notice.setUserId(rs.getString(4));
				notice.setNoticeDate(rs.getString(5));
				notice.setViewCount(rs.getInt(6));
				notice.setNoticeDel(rs.getString(7));
				return notice;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//글 수정
	public int update(int noticeId, String noticeTitle, String noticeCon) {
		String SQL = "UPDATE NOTICE SET noticeTitle = ?, noticeCon = ? WHERE noticeId =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, noticeTitle);
			pstmt.setString(2, noticeCon);
			pstmt.setInt(3, noticeId);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;   //db 오류
	}
	
	//글 삭제
	public int delete(int noticeId) {
		String SQL = "UPDATE NOTICE SET noticeDel = 0 WHERE noticeId= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, noticeId);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;   //db 오류
	}
	
	//공지사항 이전글
	public Notice getPrevNotice(int noticeId) {
		String SQL = "SELECT * FROM NOTICE WHERE noticeId = (SELECT MAX(noticeId) FROM NOTICE WHERE noticeID < ? AND noticeDel = 'N') ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, noticeId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setNoticeCon(rs.getString(3));
				notice.setUserId(rs.getString(4));
				notice.setNoticeDate(rs.getString(5));
				notice.setViewCount(rs.getInt(6));
				notice.setNoticeDel(rs.getString(7));
				return notice;
			}else {
				Notice notice = new Notice();
				return notice;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//공지사항 다음글
	public Notice getNextNotice(int noticeId) {
		System.out.println(noticeId);
		String SQL = "SELECT * FROM NOTICE WHERE noticeId = (SELECT MIN(noticeId) FROM NOTICE WHERE noticeID > ? AND noticeDel = 'N') ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, noticeId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setNoticeCon(rs.getString(3));
				notice.setUserId(rs.getString(4));
				notice.setNoticeDate(rs.getString(5));
				notice.setViewCount(rs.getInt(6));
				notice.setNoticeDel(rs.getString(7));
				System.out.println("11111");
				return notice;
			}else {
				Notice notice = new Notice();
				return notice;
			}

		} catch (Exception e) {
			System.out.println("33333");
			e.printStackTrace();
		}
		System.out.println("44444");
		return null;
	}
	
}
