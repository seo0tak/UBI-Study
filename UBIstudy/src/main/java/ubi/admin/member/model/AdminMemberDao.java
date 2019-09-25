package ubi.admin.member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myAdminMemberDao")
public class AdminMemberDao 
{
	private final String namespace = "ubi.admin.member.model.AdminMemberBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int GetTotalCount(Map<String, String> map) 
	{
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}

	public List<AdminMemberBean> GetDataList(Paging pageInfo, Map<String, String> map) 
	{
		List<AdminMemberBean> lists = new ArrayList<AdminMemberBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		return lists;
	}

	public void deleteData(int num) 
	{
		sqlSessionTemplate.delete(namespace + ".DeleteData", num);
	}

	public AdminMemberBean GetThisMember(String id) 
	{
		AdminMemberBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".GetThisMember", id);
		return bean;
	}
}
