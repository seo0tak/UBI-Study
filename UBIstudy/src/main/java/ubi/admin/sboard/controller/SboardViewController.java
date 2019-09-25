package ubi.admin.sboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.sboard.model.SboardBean;
import ubi.admin.sboard.model.SboardDao;

@Controller
public class SboardViewController 
{
	private static final String command = "/admin_sboard_view.ubi";
	private static final String getPage = "admin/sboard/admin_sboard_view";
	
	@Autowired
	@Qualifier("mySboardDao")
	private SboardDao sboardDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "num", required = true) int num, Model model)
	{
		SboardBean bean = sboardDao.GetData(num);
		model.addAttribute("bean", bean);
		return getPage;
	}
}
