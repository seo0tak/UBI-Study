package ubi.admin.nboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.nboard.model.NboardBean;
import ubi.admin.nboard.model.NboardDao;

@Controller
public class NboardViewController 
{
	private static final String command = "/admin_nboard_view.ubi";
	private static final String getPage = "admin/nboard/admin_nboard_view";
	
	@Autowired
	@Qualifier("myNboardDao")
	private NboardDao nboardDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "num", required = true) int num, Model model)
	{
		NboardBean bean = nboardDao.GetData(num);
		model.addAttribute("bean", bean);
		return getPage;
	}
}
