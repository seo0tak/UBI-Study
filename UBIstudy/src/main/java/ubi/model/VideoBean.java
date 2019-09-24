package ubi.model;

public class VideoBean {
	int num;
	int read_count;
	String title;
	String content;
	String day;
	int price;
	String url;
	String filename;
	@Override
	public String toString() {
		return "VideoBean [num=" + num + ", read_count=" + read_count + ", title=" + title + ", content=" + content
				+ ", day=" + day + ", price=" + price + ", url=" + url + ", filename=" + filename + "]";
	}
	public VideoBean() {}
	public VideoBean(int num, int read_count, String title, String content, String day, int price, String url,
			String filename) {
		super();
		this.num = num;
		this.read_count = read_count;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
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
