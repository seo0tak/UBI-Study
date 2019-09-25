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
import ubi.admin.member.model.AdminMemberBean;
import ubi.admin.member.model.AdminMemberDao;

@Controller
public class FboardInsertController 
{
	private static final String command = "/admin_fboard_insert.ubi";
	private static final String getPage = "admin/fboard/admin_fboard_insert";
	private static final String gotoPage = "redirect:/admin_fboard_list.ubi";
	
	@Autowired
	@Qualifier("myAdminMemberDao")
	private AdminMemberDao adminMemberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)//admin_fboard_list에서 글쓰기 클릭
	public String doAction(@RequestParam(value = "id", required = true) String id, Model model)
	{
		System.out.println("id: " + id);
		AdminMemberBean bean = adminMemberDao.GetThisMember(id);
		model.addAttribute("bean", bean);
		return getPage;
	}
	@Autowired
	@Qualifier("myFboardDao")
	private FboardDao fboardDao;
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("fboard") @Valid FboardBean bean)
	{
		ModelAndView mav = new ModelAndView();
		fboardDao.InsertData(bean);
		mav.setViewName(gotoPage);
		return mav;
	}
}
