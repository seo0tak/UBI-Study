package ubi.admin.sboard.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("mySboardDao")
public class SboardDao 
{
	private final String namespace = "ubi.admin.sboard.model.SboardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int GetTotalCount(Map<String, String> map)
	{
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}

	public List<SboardBean> GetDataList(Paging pageInfo, Map<String, String> map) 
	{
		List<SboardBean> lists = new ArrayList<SboardBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		return lists;
	}

	public void deleteData(int num) 
	{
		sqlSessionTemplate.delete(namespace + ".DeleteData", num);
	}

	public SboardBean GetData(int num) 
	{
		SboardBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".GetData", num);
		return bean;
	}

	public void InsertData(SboardBean bean) 
	{
		sqlSessionTemplate.insert(namespace + ".InsertData", bean);
	}

	public void UpdateData(SboardBean bean) 
	{
		sqlSessionTemplate.update(namespace + ".UpdateData", bean);
	}
}
