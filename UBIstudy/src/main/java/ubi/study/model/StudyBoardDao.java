package ubi.study.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyStudyBoard")
public class StudyBoardDao {
	
	private final String namespace = "ubi.study.model.StudyBaordBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
}
