package ubi.admin.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.member.model.AdminMemberDao;

@Controller
public class AdminMemberDeleteController 
{
	private static final String command = "/admin_member_delete.ubi";
	private static final String gotoPage = "redirect:/admin_member_list.ubi";
	
	@Autowired
	@Qualifier("myAdminMemberDao")
	private AdminMemberDao adminMemberDao;
	
	@RequestMapping(value = command)
	public String doAction(@RequestParam(value = "num", required = true) int num)
	{
		adminMemberDao.deleteData(num);
		return gotoPage;
	}
}
