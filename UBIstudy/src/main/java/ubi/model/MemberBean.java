package ubi.model;

public class MemberBean {
	int num;
	int point;
	String id;
	String pw;
	String name;
	String email;
	String pnum;
	String nick;
	String grade;
	String day;
	String memo;
	String image;
	String fav;
	String proof;
	public MemberBean() {}
	public MemberBean(int num, int point, String id, String pw, String name, String email, String pnum, String nick,
			String grade, String day, String memo, String image, String fav, String proof) {
		super();
		this.num = num;
		this.point = point;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.pnum = pnum;
		this.nick = nick;
		this.grade = grade;
		this.day = day;
		this.memo = memo;
		this.image = image;
		this.fav = fav;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	@Override
	public String toString() {
		return "MemberBean [num=" + num + ", point=" + point + ", id=" + id + ", pw=" + pw + ", name=" + name
				+ ", email=" + email + ", pnum=" + pnum + ", nick=" + nick + ", grade=" + grade + ", day=" + day
				+ ", memo=" + memo + ", image=" + image + ", fav=" + fav + ", proof=" + proof + "]";
	}
	
	
}
