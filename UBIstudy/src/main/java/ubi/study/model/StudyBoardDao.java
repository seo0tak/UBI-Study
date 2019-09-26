package ubi.study.model;

import java.util.List;
import java.util.Map;
import java.util.Random;

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
	
	// 키값 난수 만드는 메서드
		private String init() {
	     Random ran = new Random();
	     StringBuffer sb = new StringBuffer();
	     int num = 0;
	
	     do {
	        num = ran.nextInt(75) + 48;
	        if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
	           sb.append((char) num);
	        } else {
	           continue;
	        }
	
	     } while (sb.length() < size);
	     if (lowerCheck) {	
	        return sb.toString().toLowerCase();
	     }
	     return sb.toString();
	  }
		// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}
		

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
		String key = getKey(false, 20);
		bean.setFlag(key);
		System.out.println(bean);
		sqlSessionTemplate.insert(namespace + ".InsertData", bean);
	}

	public String PlanByDescription(String start, String end) {
		StudyBoardBean bean = new StudyBoardBean();
		bean.setStart_day(start);
		bean.setEnd_day(end);
		String result = sqlSessionTemplate.selectOne(namespace + ".PlanByDescription", bean);
		return	result;
	}

	public StudyBoardBean GetData(int num) {
		return sqlSessionTemplate.selectOne(namespace + ".GetData", num);
	}
	
	public List<StudyBoardBean> selectAllByNick(Paging pageInfo, Map<String, String> map,String nick) {
		return sqlSessionTemplate.selectList(namespace + ".selectAllByNick", nick);
	}


	public void Delete(int num) {
		sqlSessionTemplate.delete(namespace + ".Delete",num);
	}

}
