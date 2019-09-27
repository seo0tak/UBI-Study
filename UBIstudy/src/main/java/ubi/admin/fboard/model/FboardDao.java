package ubi.admin.fboard.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myFboardDao")
public class FboardDao 
{
	private final String namespace = "ubi.admin.fboard.model.FboardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int GetTotalCount(Map<String, String> map) 
	{
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}

	public List<FboardBean> GetDataList(Paging pageInfo, Map<String, String> map) 
	{
		List<FboardBean> lists = new ArrayList<FboardBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		return lists;
	}

	public void deleteData(int num) 
	{
		sqlSessionTemplate.delete(namespace + ".DeleteData", num);
	}

	public FboardBean GetData(int num) 
	{
		FboardBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".GetData", num);
		return bean;
	}
	public void InsertData(FboardBean bean)
	{
		sqlSessionTemplate.insert(namespace + ".InsertData", bean);
	}

	public void UpdateData(FboardBean bean) 
	{
		sqlSessionTemplate.update(namespace + ".UpdateData", bean);
	}

	public int GetNewCount() {
		// TODO Auto-generated method stub
		return 0;
	}


/*	public int GetCount() {
		int cnt = 0;
		cnt = sqlSessionTemplate.selec
		return 0;
	}
*/
}
