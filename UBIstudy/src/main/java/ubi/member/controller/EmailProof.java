package ubi.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ubi.member.model.MemberDao;

@Controller
public class EmailProof {
	private static final String command = "/proof.ubi";
	private static final String getPage= "proofSucces";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam("id") String id,@RequestParam("proof") String proof){
		memberDao.alter_proof(id, proof);
		String name = memberDao.getName(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("name", name);
		mav.setViewName(getPage);
		return mav;
	}
}
