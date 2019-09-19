package ubi.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.member.model.MemberDao;

@Controller
public class EmailProof {
	private static final String command = "/proof.ubi";
	private static final String getPage= "proofSucces";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public String doAction(@RequestParam("id") String id,@RequestParam("proof") String proof){
		memberDao.alter_proof(id, proof);
		return getPage;
	}
}
