package ubi.member.model;

public class PlanerBean {
	int num;
	String nick;
	String title;
	String start_day;
	String end_day;
	String color;
	String memo;
	
	public PlanerBean() {}
	
	public PlanerBean(int num, String nick, String title, String start_day, String end_day, String color, String memo) {
		super();
		this.num = num;
		this.nick = nick;
		this.title = title;
		this.start_day = start_day;
		this.end_day = end_day;
		this.color = color;
		this.memo = memo;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}
