package ubi.admin.vboard.model;

public class VboardBean 
{
	private int num;
	private int read_count;
	private String name;
	private String title;
	private String content;
	private String day;
	private String price;
	private String url;
	private String filename;
	
	public VboardBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VboardBean(int num, int read_count, String name, String title, String content, String day, String price,
			String url, String filename) {
		super();
		this.num = num;
		this.read_count = read_count;
		this.name = name;
		this.title = title;
		this.content = content;
		this.day = day;
		this.price = price;
		this.url = url;
		this.filename = filename;
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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
