package user;

//사용자
public class User {
	private String userId;          //사용자 아이디
	private String userPw;			//사용자 패스워드
	private String userName;		//사용자 명
	private String userTel1; 		//사용자 전화번호
	private String userTel2; 		//사용자 전화번호
	private String userTel3; 		//사용자 전화번호
	private String userGender;		//사용자 성별
	private String userEmail;		//사용자 이메일
	private String checkFind;		//아이디 찾기 방법
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel1() {
		return userTel1;
	}
	public void setUserTel1(String userTel1) {
		this.userTel1 = userTel1;
	}
	public String getUserTel2() {
		return userTel2;
	}
	public void setUserTel2(String userTel2) {
		this.userTel2 = userTel2;
	}
	public String getUserTel3() {
		return userTel3;
	}
	public void setUserTel3(String userTel3) {
		this.userTel3 = userTel3;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getCheckFind() {
		return checkFind;
	}
	public void setCheckFind(String checkFind) {
		this.checkFind = checkFind;
	}
	
}
