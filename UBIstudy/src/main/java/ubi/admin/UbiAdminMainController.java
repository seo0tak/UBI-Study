package ubi.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UbiAdminMainController 
{
	private static final String command = "/admin_main.ubi";
	private static final String getPage = "admin/admin_main";
	
	@RequestMapping(value = command)
	public String doAction()
	{
		return getPage;
	}
}
