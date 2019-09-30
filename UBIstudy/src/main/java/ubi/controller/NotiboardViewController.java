package ubi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ubi.admin.notiboard.model.NotiboardBean;
import ubi.admin.notiboard.model.NotiboardDao;


public class NotiboardViewController {

	private static final String command = "/notiboard_view.ubi";
	private static final String getPage = "notiboard/notiboard_view";
	
	@Autowired
	@Qualifier("myNotiboardDao")
	private NotiboardDao notiboardDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "num", required = true) int num,
			@RequestParam(value = "pageNumber", required = false) String pageNumber, Model model)
	{
		NotiboardBean bean = notiboardDao.GetData(num);
		model.addAttribute("bean", bean);
		model.addAttribute("pageNumber", pageNumber);
		return getPage;
	}
	
	@RequestMapping(value="noti_read_count.ubi")
	public void updateReadCount(@RequestParam(value = "id", required = false ) String id) {
		notiboardDao.updateReadCount(Integer.valueOf(id));
	}
	
	
}
