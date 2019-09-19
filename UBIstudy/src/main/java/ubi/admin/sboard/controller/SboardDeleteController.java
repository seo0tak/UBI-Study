package ubi.admin.sboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.sboard.model.SboardDao;

@Controller
public class SboardDeleteController 
{
	private static final String command = "/admin_sboard_delete.ubi";
	private static final String gotoPage = "redirect:/admin_sboard_list.ubi";
	
	@Autowired
	@Qualifier("mySboardDao")
	private SboardDao sboardDao;
	
	@RequestMapping(value = command)
	public String doAction(@RequestParam(value = "num", required = true) int num)
	{
		sboardDao.deleteData(num);
		return gotoPage;
	}
}
