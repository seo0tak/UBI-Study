package ubi.admin.nboard.controller;

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

import ubi.admin.nboard.model.NboardBean;
import ubi.admin.nboard.model.NboardDao;

@Controller
public class NboardUpdateController 
{
	private static final String command = "/admin_nboard_update.ubi";
	private static final String getPage = "admin/nboard/admin_nboard_update";
	private static final String gotoPage = "redirect:/admin_nboard_list.ubi";
	
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
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("nboard") @Valid NboardBean bean)
	{
		ModelAndView mav = new ModelAndView();
		nboardDao.updateData(bean);
		mav.setViewName(gotoPage);
		return mav;
	}
}
