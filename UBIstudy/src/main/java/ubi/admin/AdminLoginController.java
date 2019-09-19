package ubi.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLoginController 
{
	private static final String command = "/admin_login.ubi";
	private static final String getPage = "admin/admin_login";
	
	@RequestMapping(value = command)
	public String doAction()
	{
		return getPage;
	}
}
