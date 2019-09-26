package ubi.admin.fboard.controller;

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

import ubi.admin.fboard.model.FboardBean;
import ubi.admin.fboard.model.FboardDao;

@Controller
public class FboardUpdateController 
{
	private static final String command = "/admin_fboard_update.ubi";
	private static final String getPage = "admin/fboard/admin_fboard_update";
	private static final String gotoPage = "redirect:/admin_fboard_list.ubi";
	
	@Autowired
	@Qualifier("myFboardDao")
	private FboardDao fboardDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "num", required = true) int num, Model model)
	{
		FboardBean bean = fboardDao.GetData(num);
		model.addAttribute("bean", bean);
		return getPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("fboard") @Valid FboardBean bean)
	{
		ModelAndView mav = new ModelAndView();
		fboardDao.UpdateData(bean);
		mav.setViewName(gotoPage);
		return mav;
	}
}
