package ubi.member.model;

public class PlanerBean {
	int num;
	int pay;
	String id;
	String title;
	String start_day;
	String end_day;
	String memo;
	public PlanerBean() {}
	public PlanerBean(int num, int pay, String id, String title, String start_day, String end_day, String memo) {
		super();
		this.num = num;
		this.pay = pay;
		this.id = id;
		this.title = title;
		this.start_day = start_day;
		this.end_day = end_day;
		this.memo = memo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "PlanerBean [num=" + num + ", pay=" + pay + ", id=" + id + ", title=" + title + ", start_day="
				+ start_day + ", end_day=" + end_day + ", memo=" + memo + "]";
	}
	
	
	
}
