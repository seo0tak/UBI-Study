package ubi.admin.nboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.nboard.model.NboardDao;

@Controller
public class NboardDeleteController 
{
	private static final String command = "admin_nboard_delete.ubi";
	private static final String gotoPage = "redirect:/admin_nboard_list.ubi";
	
	@Autowired
	@Qualifier("myNboardDao")
	private NboardDao nboardDao;
	
	@RequestMapping(value = command)
	public String doAction(@RequestParam(value = "num", required = true) int num)
	{
		nboardDao.deleteData(num);
		return gotoPage;
	}
}
