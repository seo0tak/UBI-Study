package ubi.admin.vboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.vboard.model.VboardDao;

@Controller
public class VboardDeleteController 
{
	private static final String command = "/admin_vboard_delete.ubi";
	private static final String gotoPage = "redirect:/admin_vboard_list.ubi";
	
	@Autowired
	@Qualifier("myVboardDao")
	private VboardDao vboardDao;
	
	@RequestMapping(value = command)
	public String doAction(@RequestParam(value = "num", required = true) int num)
	{
		vboardDao.deleteData(num);
		return gotoPage;
	}
}
