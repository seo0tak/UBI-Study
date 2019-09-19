package ubi.admin.fboard.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.fboard.model.FboardDao;

@Controller
public class FboardDeleteController 
{
	private static final String command = "/admin_fboard_delete.ubi";
	private static final String gotoPage = "redirect:/admin_fboard_list.ubi";
	
	@Autowired
	@Qualifier("myFboardDao")
	private FboardDao fboardDao;
	
	@RequestMapping(value = command)
	public String doAction(@RequestParam(value="num", required = true) int num)
	{	
		fboardDao.deleteData(num);
		return gotoPage;
	}
}
