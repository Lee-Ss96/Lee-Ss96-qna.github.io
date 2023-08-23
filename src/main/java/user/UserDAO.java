package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import notice.Notice;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	
	//로그인 처리
	public int login(String userId, String userPw) {
		String SQL = "SELECT userPw FROM USER WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPw))  
					return 1;    //성공
				else
					return 0;	//실패
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -2; //db 오류
	}
	
	
	//회원가입 처리
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?)";
		String userTel = null;
		
		if(user.getUserTel1() != null && user.getUserTel2() != null && user.getUserTel3() != null) {
			userTel = user.getUserTel1() + user.getUserTel2() + user.getUserTel3();
		}
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPw());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, userTel);
			pstmt.setString(5, user.getUserGender());
			pstmt.setString(6, user.getUserEmail());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return -1;
		
	}
	
	//아이디 찾기
	public String findId(String checkFind, String userName, String userEmail, String userTel1, String userTel2, String userTel3) {
		String SQL = "";
		String userTel = null;
		
		if(userTel1 != null && userTel2 != null && userTel3 != null) {
			userTel = userTel1 + userTel2 + userTel3;
		}
		
		if("2".equals(checkFind)) {
			SQL = "SELECT userId FROM USER WHERE userName = ? and userEmail = ?";      //이메일로 찾기
		}else {
			SQL = "SELECT userId FROM USER WHERE userName = ? and userTel = ?";      //전화번호로 찾기
		}
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			if("2".equals(checkFind) ) {
				pstmt.setString(2, userEmail);
			}else {
				pstmt.setString(2, userTel);
			}
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(rs.getString("userId") != null)  
					return rs.getString("userId");    //성공
			}else {
				return "1"; //실패
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "-2"; //db 오류
	}
	
	//비밀번호 찾기
	public int findPw(User user) {
		String SQL = "";
		String userTel = null;
		
		if(user.getUserTel1() != null && user.getUserTel2() != null && user.getUserTel3() != null) {
			userTel = user.getUserTel1() + user.getUserTel2() + user.getUserTel3();
		}
		
		if("2".equals(user.getCheckFind())) {
			SQL = "SELECT userPw FROM USER WHERE userId = ? and userName = ? and userEmail = ?";      //이메일로 찾기
		}else {
			SQL = "SELECT userPw FROM USER WHERE userId = ? and userName = ? and userTel = ?";      //전화번호로 찾기
		}
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserName());
			if("2".equals(user.getCheckFind()) ) {
				pstmt.setString(3, user.getUserEmail());
			}else {
				pstmt.setString(3, userTel);
			}
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(rs.getString("userPw") != null)  
					return 0;    //성공
			}else {
				return 1; //실패
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -2; //db 오류
	}
	
	//비밀번호 변경
	public int updatePw(String userId, String userPw) {
		
		String SQL = "UPDATE USER SET userPw = ? WHERE userId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPw);
			pstmt.setString(2, userId);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;   //db 오류
		
	}
}
