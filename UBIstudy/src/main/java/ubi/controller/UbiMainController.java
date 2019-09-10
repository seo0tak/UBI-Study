package ubi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ubi.model.UbiDao;

@Controller
public class UbiMainController {
	private static final String getPage = "main";
	private static final String command = "/main.ubi";
	
	@Autowired
	private UbiDao ubiDao;
	
	@RequestMapping(value=command)
	public String doAction() {
		return getPage;
	}
	
	
}
