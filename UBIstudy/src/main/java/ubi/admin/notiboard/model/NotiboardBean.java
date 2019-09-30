package ubi.admin.notiboard.model;

public class NotiboardBean {

	private int num;
	private int read_count;
	private String title;
	private String content;
	private String day;
	
	public NotiboardBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NotiboardBean(int num, int read_count, String title, String content, String day) {
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


/*
 �Ʒ� ���̺� �ǰ��Ͽ� Bean �ۼ���.
------------------------------noti_board�����Խ���

drop table noti_board;

--order by ref, re_level, num������ select

create table noti_board(
num number primary key,	--noti_board_seq.nextval
read_count number not null,	--��ȸ��. �⺻���� 0�� ����.
title varchar2(50),		--����
content varchar2(50),		--����
day date default sysdate	--�ۼ�����
);

drop sequence noti_board_seq;
create sequence noti_board_seq
minvalue 0
start with 0
nocache;

insert into noti_board values(noti_board_seq.nextval,0,'test','content',sysdate);

commit;

  
  
*/



