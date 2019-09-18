package ubi.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myMemberDao")
public class MemberDao {
	
	private final String namespace = "ubi.member.model.MemberBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void InsertData(MemberBean member) {
		sqlSessionTemplate.insert(namespace+".InsertData",member);
	}

	public int IdCheck(String id) {
		int cnt = 0;
		cnt = sqlSessionTemplate.selectOne(namespace+".IdCheck",id);
		return cnt;
	}

	public void GetKey(String user_id, String key) {
		MemberBean bean = new MemberBean();
		bean.setId(user_id);
		bean.setProof(key);
		sqlSessionTemplate.update(namespace+".GetKey",bean);
	}

	public void alter_proof(String user_id, String key) {
		MemberBean bean = new MemberBean();
		bean.setId(user_id);
		bean.setProof(key);
		sqlSessionTemplate.update(namespace+".alter_proof",bean);
	}
}
