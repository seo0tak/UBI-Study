package ubi.controller;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ubi.admin.notiboard.model.NotiboardBean;
import ubi.admin.notiboard.model.NotiboardDao;
import utility.Paging;

@Controller
public class NotiboardListController {

	private static final String getPage = "notiBoard/list";
	private static final String command = "/notiboard_list.ubi";
	
	@Autowired
	private NotiboardDao notiboardDao;
	
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pageSize", required = false) String pageSize,
			HttpServletRequest request, Model model, Locale locale) {

		Map<String, String> map = new HashMap<String, String>();
		int totalCount = notiboardDao.GetTotalCount(map);
		String url = request.getContextPath() + command;
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		
		ModelAndView mav = new ModelAndView();
		List<NotiboardBean> lists = notiboardDao.GetDataList(pageInfo, map);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		mav.addObject("lists",lists);
		mav.addObject("totalCount", totalCount);
		mav.setViewName(getPage);
		return mav; 
	}
			
			
			
	
}