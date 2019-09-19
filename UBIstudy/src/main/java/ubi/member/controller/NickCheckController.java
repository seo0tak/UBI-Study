package ubi.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ubi.member.model.MemberBean;
import ubi.member.model.MemberDao;

@Controller
public class NickCheckController {

	private static final String command = "/checkNick.ubi";
	
	@Autowired
	MemberDao memberDao;
	
	@ResponseBody
    @RequestMapping(value=command)
    public int doAction(MemberBean bean) {
        int result=0;
        String user=memberDao.getNick(bean);
        if(user!=null) result=1;
        return result;
    }

}
