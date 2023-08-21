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
	

	public int getNext() {
		String SQL = "SELECT noticeId FROM NOTICE ORDER BY noticeId DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
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

	
	public int write(String noticeTitle, String userId, String noticeCon) {
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
	}
	
	
	//게시글 리스트
	public ArrayList<Notice> getList(int pageNumber){
		String SQL = "SELECT * FROM NOTICE WHERE noticeId < ? AND noticeDel = 1 ORDER BY noticeId DESC LIMIT 10";
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setUserId(rs.getString(3));
				notice.setNoticeDate(rs.getString(4));
				notice.setNoticeCon(rs.getString(5));
				notice.setNoticeDel(rs.getInt(6));
				list.add(notice);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM NOTICE WHERE noticeId < ? AND noticeDel = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
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
				notice.setUserId(rs.getString(3));
				notice.setNoticeDate(rs.getString(4));
				notice.setNoticeCon(rs.getString(5));
				notice.setNoticeDel(rs.getInt(6));
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
}
