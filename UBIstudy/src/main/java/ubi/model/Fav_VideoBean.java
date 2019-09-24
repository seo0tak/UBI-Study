package ubi.model;

public class Fav_VideoBean {
	int num;
	String id;
	int videonum;
	
	
	
	@Override
	public String toString() {
		return "Fav_VideoBean [num=" + num + ", id=" + id + ", videonum=" + videonum + "]";
	}
	public Fav_VideoBean() {}
	public Fav_VideoBean(int num, String id, int videonum) {
		super();
		this.num = num;
		this.id = id;
		this.videonum = videonum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getVideonum() {
		return videonum;
	}
	public void setVideonum(int videonum) {
		this.videonum = videonum;
	}
	
	
	
}
