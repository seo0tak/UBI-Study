package ubi.admin.fboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.fboard.model.FboardBean;
import ubi.admin.fboard.model.FboardDao;

@Controller
public class FboardViewController 
{
	private static final String command = "/admin_fboard_view.ubi";
	private static final String getPage = "admin/fboard/admin_fboard_view";
	
	@Autowired
	@Qualifier("myFboardDao")
	private FboardDao fboardDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "num", required = true) int num,
			@RequestParam(value = "pageNumber", required = false) String pageNumber, Model model)
	{
		FboardBean bean = fboardDao.GetData(num);
		model.addAttribute("bean", bean);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
}
