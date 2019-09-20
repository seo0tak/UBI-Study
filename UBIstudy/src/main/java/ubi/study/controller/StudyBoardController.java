package ubi.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudyBoardController {
	private static final String getPage = "studyboard/list";
	private static final String command = "/studyboard_list.ubi";
	
	@RequestMapping(value=command)
	public String doAction() {
		
		return getPage;
	}
}
