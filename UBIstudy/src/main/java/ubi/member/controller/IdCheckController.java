package ubi.member.controller;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ubi.member.model.MemberDao;

@Controller
public class IdCheckController {

	private static final String command = "/idcheck.ubi";
	
	@Autowired
	MemberDao memberDao;
	
	@ResponseBody
	@RequestMapping(value=command)
	public Map<Object,Object> doAction(@RequestBody String id){
		System.out.println("여긴오냐");
		int count = 0;
		Map<Object,Object> map = new HashMap<Object,Object>();
		
		count = memberDao.IdCheck(id);
		map.put("cnt", count);
		System.out.println("cnt             :"+count);
		return map;
	}
}
