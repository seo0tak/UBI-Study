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

import ubi.admin.member.model.AdminMemberBean;
import ubi.admin.member.model.AdminMemberDao;
import ubi.admin.sboard.model.SboardBean;
import ubi.admin.sboard.model.SboardDao;

@Controller
public class SboardInsertController 
{
	private static final String command = "/admin_sboard_insert.ubi";
	private static final String getPage = "admin/sboard/admin_sboard_insert";
	private static final String gotoPage = "redirect:/admin_sboard_list.ubi";
	
	@Autowired
	@Qualifier("myAdminMemberDao")
	private AdminMemberDao adminMemberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "id", required = true) String id, Model model )
	{
		AdminMemberBean bean = adminMemberDao.GetThisMember(id);
		model.addAttribute("bean", bean);
		return getPage;
	}
	@Autowired
	@Qualifier("mySboardDao")
	private SboardDao sboardDao;
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("sboard") @Valid SboardBean bean)
	{
		ModelAndView mav = new ModelAndView();
		sboardDao.InsertData(bean);
		mav.setViewName(gotoPage);
		return mav;
	}
}
