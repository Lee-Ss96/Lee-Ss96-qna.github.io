package notice;

//게시판 
public class Notice {
	private int noticeId;          	
	private String noticeTitle;		//제목
	private String userId;			//작성자
	private String noticeDate;		//생성일
	private String noticeCon;		//내용
	private int noticeDel;			//글 삭제 여부
	
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeCon() {
		return noticeCon;
	}
	public void setNoticeCon(String noticeCon) {
		this.noticeCon = noticeCon;
	}
	public int getNoticeDel() {
		return noticeDel;
	}
	public void setNoticeDel(int noticeDel) {
		this.noticeDel = noticeDel;
	}		

	
}
