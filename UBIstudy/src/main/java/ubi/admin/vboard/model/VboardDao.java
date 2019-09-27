package ubi.admin.vboard.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myVboardDao")
public class VboardDao 
{
	private final String namespace = "ubi.admin.vboard.model.VboardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int GetTotalCount(Map<String, String> map)
	{
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}

	public List<VboardBean> GetDataList(Paging pageInfo, Map<String, String> map) 
	{
		List<VboardBean> lists = new ArrayList<VboardBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		return lists;
	}

	public void deleteData(int num) 
	{
		sqlSessionTemplate.delete(namespace + ".DeleteData", num);
	}

	public VboardBean GetData(int num) 
	{
		VboardBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".GetData", num);
		return bean;
	}

	public void InsertData(VboardBean bean) 
	{
		sqlSessionTemplate.insert(namespace + ".InsertData", bean);
	}

	public void UpdateData(VboardBean bean) 
	{
		sqlSessionTemplate.update(namespace + ".UpdateData", bean);
	}

	public int GetNewCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
