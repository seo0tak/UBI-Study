package ubi.admin.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.member.model.AdminMemberBean;
import ubi.admin.member.model.AdminMemberDao;

@Controller
public class AdminMemberViewContoller 
{
	private static final String command = "/admin_member_view.ubi";
	private static final String getPage = "admin/member/admin_member_view";
	
	@Autowired
	@Qualifier("myAdminMemberDao")
	private AdminMemberDao adminMemberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "num", required = true) int num, Model model)
	{
		AdminMemberBean bean = adminMemberDao.GetData(num);
		model.addAttribute("bean", bean);
		return getPage;
	}
}
