package ubi.admin.vboard.controller;

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

import ubi.admin.vboard.model.VboardBean;
import ubi.admin.vboard.model.VboardDao;

@Controller
public class VboardUpdateController 
{
	private static final String command = "/admin_vboard_update.ubi";
	private static final String getPage = "admin/vboard/admin_vboard_update";
	private static final String gotoPage = "redirect:/admin_vboard_list.ubi";
	
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
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("vboard") @Valid VboardBean bean)
	{
		ModelAndView mav = new ModelAndView();
		vboardDao.UpdateData(bean);
		mav.setViewName(gotoPage);
		return mav;
	}
}
