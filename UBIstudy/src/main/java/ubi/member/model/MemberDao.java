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
	
	public String getMember(MemberBean bean){
        return sqlSessionTemplate.selectOne(namespace+".getMember",bean);
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

	public String getNick(MemberBean bean) {
		return sqlSessionTemplate.selectOne(namespace+".getNick",bean);
	}

	public String getName(String e_mail) {
		return sqlSessionTemplate.selectOne(namespace+".getName",e_mail);
	}

	public MemberBean getDataByNick(String nick) {
		return sqlSessionTemplate.selectOne(namespace + ".getDataByNick", nick);
	}

	public String getPw(String id) {
		return sqlSessionTemplate.selectOne(namespace+".getPw",id);
	}

}
