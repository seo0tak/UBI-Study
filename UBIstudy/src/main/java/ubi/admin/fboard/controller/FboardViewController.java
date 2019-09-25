package ubi.admin.fboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import ubi.admin.fboard.model.FboardDao;

@Controller
public class FboardViewController 
{
	private static final String command = "/admin_fboard_view.ubi";
	private static final String getPage = "admin/fboard/admin_fboard_view";
	
	@Autowired
	@Qualifier("myFboardDao")
	private FboardDao fboardDao;
	
	public String doAction()
	{
		return getPage;
	}
}
