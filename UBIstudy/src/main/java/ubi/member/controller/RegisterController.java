package ubi.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ubi.member.model.MemberBean;
import ubi.member.model.MemberDao;

@Controller
public class RegisterController {
	
	private static final String command = "/register.ubi";
	private static final String getPage= "register";
	private static final String gotoPage= "redirect:/main.ubi";
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	private UserMailSendService mailsender;
	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doAction(){
		return getPage;
	}
	
	@RequestMapping(value=command , method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute @Valid MemberBean member,BindingResult result,HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		memberDao.InsertData(member);
		mailsender.mailSendWithUserKey(member.getEmail(), member.getId(), request);
		
		mav.setViewName(gotoPage);
		return mav;
	}
	
}
