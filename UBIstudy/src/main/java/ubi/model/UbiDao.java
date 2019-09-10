package ubi.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myUbiDao")
public class UbiDao {
	private final String namespace = "ubi.UbiBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	

}
