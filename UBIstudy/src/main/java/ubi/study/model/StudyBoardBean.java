package ubi.study.model;

public class StudyBoardBean {
	private int num;
	private int ref;
	private int re_level;
	private int read_count;
	private String nick;
	private String title;
	private String memo;
	private String start_day;
	private String end_day;
	private String day;
	private String pw;
	private String flag;
	private String lang;
	private String color;
	
	public StudyBoardBean() {}

	public StudyBoardBean(int num, int ref, int re_level, int read_count, String nick, String title, String memo,
			String start_day, String end_day, String day, String pw, String flag, String lang, String color) {
		super();
		this.num = num;
		this.ref = ref;
		this.re_level = re_level;
		this.read_count = read_count;
		this.nick = nick;
		this.title = title;
		this.memo = memo;
		this.start_day = start_day;
		this.end_day = end_day;
		this.day = day;
		this.pw = pw;
		this.flag = flag;
		this.lang = lang;
		this.color = color;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getStart_day() {
		return start_day;
	}

	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}

	public String getEnd_day() {
		return end_day;
	}

	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "StudyBoardBean [num=" + num + ", ref=" + ref + ", re_level=" + re_level + ", read_count=" + read_count
				+ ", nick=" + nick + ", title=" + title + ", memo=" + memo + ", start_day=" + start_day + ", end_day="
				+ end_day + ", day=" + day + ", pw=" + pw + ", flag=" + flag + ", lang=" + lang + ", color=" + color
				+ "]";
	};
	
	
}
