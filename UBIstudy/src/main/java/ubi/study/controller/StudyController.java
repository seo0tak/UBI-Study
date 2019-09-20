package ubi.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudyController {
	private static final String getPage = "studyboard/online_list";
	private static final String command = "/study_list.ubi";
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
}
