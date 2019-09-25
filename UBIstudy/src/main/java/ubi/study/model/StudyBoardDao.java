package ubi.study.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ubi.member.model.PlanerBean;
import utility.Paging;

@Component("myStudyBoardDao")
public class StudyBoardDao {
	
	private final String namespace = "ubi.study.model.StudyBoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int GetTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}
	
	public List<StudyBoardBean> selectAll(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		return sqlSessionTemplate.selectList(namespace + ".selectAll", map, rowBounds);
	}

	public List<PlanerBean> PlanByNick(String nick) {
		return sqlSessionTemplate.selectList(namespace + ".PlanByNick", nick);
	}

	public void InsertData(StudyBoardBean bean) {
		System.out.println(bean);
		sqlSessionTemplate.selectList(namespace + ".InsertData", bean);
	}
	
	public List<StudyBoardBean> selectAllByNick(Paging pageInfo, Map<String, String> map,String nick) {
		return sqlSessionTemplate.selectList(namespace + ".selectAllByNick", nick);
	}
}
