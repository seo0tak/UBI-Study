package ubi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.model.UbiDao;

@Controller
public class Free_inputs_Controller {
	private static final String getPage = "freeBoard/list";
	private static final String command = "/freeboard_list.ubi";
	
	@Autowired
	private UbiDao ubiDao;
	
	@RequestMapping(value="freeboard_update.ubi", method=RequestMethod.POST)
	public void FreeUpdate(@RequestParam(value = "id", required = false ) String id,
			@RequestParam(value = "f_name", required = false ) String name,
			@RequestParam(value = "f_title", required = false ) String title,
			@RequestParam(value = "f_content", required = false ) String content
			) {
		System.out.println("update : "+id);
		ubiDao.freeUpdate(Integer.valueOf(id),name,title,content);
	}
	@RequestMapping(value="freeboard_ref.ubi", method=RequestMethod.POST)
	public void FreeRef(@RequestParam(value = "id", required = false ) String id,
			@RequestParam(value = "f_name", required = false ) String name,
			@RequestParam(value = "f_title", required = false ) String title,
			@RequestParam(value = "f_content", required = false ) String content,
			@RequestParam(value = "f_ref", required = false ) String ref,
			@RequestParam(value = "f_re_level", required = false ) String re_level,
			@RequestParam(value = "pw", required = false ) String pw
			) {
		System.out.println("ref : "+id);
		System.out.println("ref-----"+Integer.valueOf(re_level));
		
		/*id="1";
		ref="1";
		re_level="1";*/
		
		ubiDao.freeRef(Integer.valueOf(id),name,title,content,Integer.valueOf(ref),Integer.valueOf(re_level),pw);
	}
	@RequestMapping(value="freeboard_input.ubi", method=RequestMethod.POST)
	public void FreeInsert(@RequestParam(value = "id", required = false ) String id,
			@RequestParam(value = "f_name", required = false ) String name,
			@RequestParam(value = "f_title", required = false ) String title,
			@RequestParam(value = "f_content", required = false ) String content,
			@RequestParam(value = "pw", required = false ) String pw
			) {
		System.out.println("insert : "+id);
		System.out.println("insert : "+content);
		ubiDao.freeInsert(Integer.valueOf(id),name,title,content,pw);
	}
	
	@RequestMapping(value="freeboard_delete.ubi", method=RequestMethod.POST)
	public void FreeDelete(@RequestParam(value = "id", required = false ) String id
			) {
		System.out.println("delete : "+id);
		ubiDao.freeDelete(Integer.valueOf(id));
	}
}
