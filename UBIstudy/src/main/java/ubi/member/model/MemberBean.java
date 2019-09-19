package ubi.member.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	@NotEmpty(message="아이디 입력은 필수!!")
	@Email(message="아이디 형식이 다릅니다.")
	private String id;
	@NotEmpty(message="비밀번호 입력은 필수!!")
	@Size(min=4,max=12,message="8~20자 입력하시오!!")
	private String pw;
	
	@NotEmpty(message="이름 입력은 필수!!")
	private String name;
	
	@NotEmpty(message="핸드폰번호 입력은 필수!!")
	private String pnum;
	
	@NotEmpty(message="닉네임 입력은 필수!!")
	private String nick;
	
	private String grade;
	private String day;
	private String memo;
	private String image;
	private String fav;
	private String proof;
	private int num;
	private int point;
	public MemberBean() {}

	public MemberBean(String id, String pw, String name, String pnum, String nick, String grade, String day,
			String memo, String image, String fav, String proof, int num, int point) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.pnum = pnum;
		this.nick = nick;
		this.grade = grade;
		this.day = day;
		this.memo = memo;
		this.image = image;
		this.fav = fav;
		this.proof = proof;
		this.num = num;
		this.point = point;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getFav() {
		return fav;
	}
	public void setFav(String fav) {
		this.fav = fav;
	}
	public String getProof() {
		return proof;
	}
	public void setProof(String proof) {
		this.proof = proof;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
