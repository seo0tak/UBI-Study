package ubi.admin.fboard.model;

public class FboardBean 
{
	private int num;
	private int ref;
	private int re_level;
	private int read_count;
	private String name;
	private String title;
	private String content;
	private String pw;
	private String day;
	
	public FboardBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FboardBean(int num, int ref, int re_level, int read_count, String name, String title, String content,
			String pw, String day) {
		super();
		this.num = num;
		this.ref = ref;
		this.re_level = re_level;
		this.read_count = read_count;
		this.name = name;
		this.title = title;
		this.content = content;
		this.pw = pw;
		this.day = day;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}
	
	
}
