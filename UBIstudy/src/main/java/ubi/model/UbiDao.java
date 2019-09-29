package ubi.model;

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

	public List<PlanerBean> PlanByNick(String nick) {
		return sqlSessionTemplate.selectList(namespace + ".PlanByNick", nick);
	}
	
	public List<Fav_VideoBean> selectFavVideoById(Paging pageInfo, Map<String, String> map,String id){
		System.out.println("-----selectFavVideoById : ID :   "+id);
		 List<Fav_VideoBean> list=new ArrayList<Fav_VideoBean>();
		 list = sqlSessionTemplate.selectList(namespace + ".selectFavVideoById", id);
		 System.out.println(list.size());
		 return list;
	}
	
	public VideoBean selectVideoByNum(int num) {
		VideoBean bean=null;
		bean=(VideoBean)sqlSessionTemplate.selectList(namespace + ".selectVideoByNum", num).get(0);
		return bean;
	}
	
	public List<KeyBean> selectKeyById(String id){
		List<KeyBean> list=null;
		list=sqlSessionTemplate.selectList(namespace + ".selectKeyById", id);
		return list;
	}
	public List<KeyBean> selectKeyByKey(String key){
		List<KeyBean> list=null;
		list=sqlSessionTemplate.selectList(namespace + ".selectKeyByKey", key);
		return list;
	}
	public void updateConf(int num) {
		System.out.println("허춘삼            "+num);
		sqlSessionTemplate.selectList(namespace + ".updateConf", num);
	}

	public String SelectCount(MemberBean id) {
		return sqlSessionTemplate.selectOne(namespace + ".SelectCount", id);
	}
	
	
}
