package ubi.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ubi.member.model.MemberBean;
import ubi.member.model.PlanerBean;
import utility.Paging;

@Component("myUbiDao")
public class UbiDao {
	private final String namespace = "ubi.UbiBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int GetTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}
	
	public List<UbiBean> selectAll(Paging pageInfo, Map<String, String> map){
		List<UbiBean> lists=new ArrayList<UbiBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".selectAll", map);
		try {
			System.out.println("dao : "+lists.get(3).getTitle());			
		}catch(Exception e) {System.out.println("dao실패");}
		return lists;
	}
	
	public void updateReadCount(int id) {
		sqlSessionTemplate.update(namespace + ".updateReadCount", id);
	}
	
	public void freeUpdate(int id,String name,String title,String content) {
		UbiBean bean=new UbiBean(0, 0, 0, 0,"0","0","0","0","0");
		bean.setNum(id);
		bean.setName(name);
		bean.setTitle(title);
		bean.setContent(content);
		sqlSessionTemplate.update(namespace + ".FreeUpdate", bean);
	}
	public void freeRef(int id,String name,String title,String content,int ref,int re_level,String pw) {
		UbiBean bean=new UbiBean(0, 0, 0, 0,"0","0","0","0","0");
		bean.setNum(id);
		bean.setName(name);
		bean.setTitle(title);
		bean.setContent(content);
		bean.setRef(ref);
		bean.setRe_level(re_level);
		bean.setPw(pw);
		sqlSessionTemplate.insert(namespace + ".FreeRef", bean);
	}
	public void freeInsert(int id,String name,String title,String content,String pw) {
		UbiBean bean=new UbiBean(0, 0, 0, 0,"0","0","0","0","0");
		bean.setNum(id);
		bean.setName(name);
		bean.setTitle(title);
		bean.setContent(content);
		bean.setPw(pw);
		sqlSessionTemplate.insert(namespace + ".FreeInsert", bean);
	}
	
	public void freeDelete(int id) {
		sqlSessionTemplate.delete(namespace + ".FreeDelete", id);
	}
	
	public int loginCheck(MemberBean id) {
		System.out.println(id.getId());
		int cnt=0;
		cnt=sqlSessionTemplate.selectOne(namespace + ".LoginSelectOne", id);
		return cnt;
	}
	
	public String loginPwCheck(MemberBean id) {
		System.out.println(id.getId());
		String pw="";
		pw=sqlSessionTemplate.selectOne(namespace + ".LoginSelectPw", id);
		return pw;
	}
	
	public String SelectProof(MemberBean id) {
		String proof="";
		proof=sqlSessionTemplate.selectOne(namespace + ".SelectProof", id);
		return proof;
	}
	public String SelectNick(MemberBean id) {
		String nick="";
		nick=sqlSessionTemplate.selectOne(namespace + ".SelectNick", id);
		System.out.println("dao : "+nick);
		return nick;
	}
	public MemberBean SelectOneMember(String id) {
		MemberBean bean=null;
		bean=sqlSessionTemplate.selectOne(namespace + ".SelectOneMember", id);
		return bean;
	}
	public List<PlanerBean> selectPlanById(String id,Paging pageInfo, Map<String, String> map) {
		List<PlanerBean> plan=null;
		plan= sqlSessionTemplate.selectList(namespace + ".selectPlanById", id);
		System.out.println("여긴 DAO : "+plan.size());
		System.out.println("여긴 DAO의 id! : "+id);
		return plan;
	}

	public void updatePlanByoldstart(String title, String start, String end, String oldstart) {
		/* oracle dateformat : YYYY-MM-DD HH:MI:SS */
		/* java dateformat : yyyy-MM-dd HH:mm:ss */
		System.out.println(oldstart);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.sql.Date d = java.sql.Date.valueOf(oldstart);//string을date형식으로
		System.out.println(d);
		String id = sdf.format(d);
		System.out.println(id);
		System.out.println("          adgadgda       "+sdf.format(d));
		PlanerBean bean = new PlanerBean();
		bean.setStart_day(start);
		bean.setEnd_day(end);
		bean.setTitle(title);
		bean.setId(id);
		sqlSessionTemplate.update(namespace + ".updatePlanByoldstart",bean);
	}
	
	
	
	 public int GetTotalVideo(Map<String, String> map){
		 int cnt=0;
		 cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalVideoCount", map);
		 return cnt;
	 }
	 public List<VideoBean> selectAllVideo(Paging pageInfo, Map<String, String> map){
		 List<VideoBean> list=new ArrayList<VideoBean>();
		 list = sqlSessionTemplate.selectList(namespace + ".selectAllVideo", map);
			try {
				System.out.println("dao : "+list.get(0).getTitle());			
			}catch(Exception e) {System.out.println("dao실패");}
		 
		 return list;
	}
	 
	 
	 public int GetTotalKeyVideo(Map<String, String> map,String id){
		 int cnt=0;
		 cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalKeyVideoCount", id+"%");
		 return cnt;
	 }
	 public List<VideoBean> selectKeyVideo(Paging pageInfo, Map<String, String> map,String id){
		 List<VideoBean> list=new ArrayList<VideoBean>();
		 list = sqlSessionTemplate.selectList(namespace + ".selectKeyVideo", id+"%");
		 System.out.println("dao : "+id+"%");
		 
			try {
				System.out.println("dao : "+list.get(0).getTitle());			
			}catch(Exception e) {System.out.println("dao실패");}
		 
		 return list;
	}
	 
	 
	public List<Fav_VideoBean> selectFavVideo(Paging pageInfo, Map<String, String> map){
		 List<Fav_VideoBean> list=new ArrayList<Fav_VideoBean>();
		 list = sqlSessionTemplate.selectList(namespace + ".selectFavVideo", map);
		 
		 try {
			 System.out.println("dao : "+list.get(0).getId());			
		 }catch(Exception e) {System.out.println("dao실패");}
		 
		 return list;
	 }
	
}
