package ubi.admin.notiboard.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import utility.Paging;

@Component("myNotiboardDao")
public class NotiboardDao {

	private final String namespace = "ubi.admin.notibaord.model.NotiboardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int GetTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt=sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}
	
	public List<NotiboardBean> GetDataList(Paging pageInfo, Map<String, String> map){
		
		List<NotiboardBean> lists = new ArrayList<NotiboardBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		
		return lists;
		
	}
	
	public void deleteData(int num) {
		
		sqlSessionTemplate.delete(namespace+".DeleteData", num);
	}
	
	
	public NotiboardBean GetData(int num) {
	
		NotiboardBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".GetData", num);
		return bean;
	}
	
	
	public void InsertData(NotiboardBean bean){
	
		sqlSessionTemplate.insert(namespace + ".InsertData", bean);
	}

	
	public void UpdateData(NotiboardBean bean) {
		
		sqlSessionTemplate.update(namespace + ".UpdateData", bean);
	}

	public void updateReadCount(Integer num) {
		// TODO Auto-generated method stub
		System.out.println("num:"+num);  
		sqlSessionTemplate.update(namespace+".notiReadcount", num);
	}

	
	
	
	
}
