package ubi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ubi.model.UbiDao;

@Controller
public class UbiMainController {
	private static final String getPage = "main";
	private static final String command = "/main.ubi";
	
	@Autowired
	private UbiDao ubiDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		return mav;
	}
	
	
}
