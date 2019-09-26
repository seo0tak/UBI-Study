package ubi.admin.sboard.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ubi.admin.sboard.model.SboardBean;
import ubi.admin.sboard.model.SboardDao;

@Controller
public class SboardUpdateController 
{
	private static final String command = "/admin_sboard_update.ubi";
	private static final String getPage = "admin/sboard/admin_sboard_update";
	private static final String gotoPage = "redirect:/admin_sboard_list.ubi";
	
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
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("sboard") @Valid SboardBean bean)
	{
		ModelAndView mav = new ModelAndView();
		sboardDao.UpdateData(bean);
		mav.setViewName(gotoPage);
		return mav;
	}
}
