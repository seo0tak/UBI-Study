package ubi.admin.vboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.vboard.model.VboardBean;
import ubi.admin.vboard.model.VboardDao;

@Controller
public class VboardViewController 
{
	private static final String command = "/admin_vboard_view.ubi";
	private static final String getPage = "admin/vboard/admin_vboard_view";
	
	@Autowired
	@Qualifier("myVboardDao")
	private VboardDao vboardDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "num", required = true) int num, Model model)
	{
		VboardBean bean = vboardDao.GetData(num);
		model.addAttribute("bean", bean);
		return getPage;
	}
}
