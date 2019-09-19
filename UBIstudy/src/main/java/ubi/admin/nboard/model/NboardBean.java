package ubi.admin.nboard.model;

public class NboardBean 
{
	private int num;
	private int read_count;
	private String title;
	private String content;
	private String day;
	
	public NboardBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NboardBean(int num, int read_count, String title, String content, String day) {
		super();
		this.num = num;
		this.read_count = read_count;
		this.title = title;
		this.content = content;
		this.day = day;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
}
