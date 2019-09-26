package ubi.model;

public class KeyBean {
	int num;
	String key;
	String id;
	String conf;
	
	
	public KeyBean() {}
	
	
	
	public KeyBean(int num, String key, String id, String conf) {
		super();
		this.num = num;
		this.key = key;
		this.id = id;
		this.conf = conf;
	}

	

	public String getConf() {
		return conf;
	}



	public void setConf(String conf) {
		this.conf = conf;
	}



	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
