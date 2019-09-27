package ubi.admin.nboard.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myNboardDao")
public class NboardDao 
{
	private final String namespace = "ubi.admin.nboard.model.NboardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int GetTotalCount(Map<String, String> map) 
	{
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}

	public List<NboardBean> GetDataList(Paging pageInfo, Map<String, String> map) 
	{
		List<NboardBean> lists = new ArrayList<NboardBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds); 
		return lists;
	}

	public void deleteData(int num) 
	{
		sqlSessionTemplate.delete(namespace + ".DeleteData", num);
	}

	public NboardBean GetData(int num) 
	{
		NboardBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".GetData", num);
		return bean;
	}

	public void InsertData(NboardBean bean) 
	{
		sqlSessionTemplate.insert(namespace + ".InsertData", bean);
	}

	public void updateData(NboardBean bean) 
	{
		sqlSessionTemplate.update(namespace + ".UpdateData", bean);
	}

	public int GetNewCount() {
		// TODO Auto-generated method stub
		return 0;
	}
}
