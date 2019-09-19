package ubi.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
	
}
