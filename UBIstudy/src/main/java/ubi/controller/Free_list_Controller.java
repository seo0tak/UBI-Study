package ubi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ubi.model.UbiDao;

@Controller
public class Free_list_Controller {
	private static final String getPage = "freeBoard/list";
	private static final String command = "/freeboard_list.ubi";
	
	@Autowired
	private UbiDao ubiDao;
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
	
	
}
