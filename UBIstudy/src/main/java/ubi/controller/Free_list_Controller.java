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

import ubi.model.UbiBean;
import ubi.model.UbiDao;
import utility.Paging;

@Controller
public class Free_list_Controller {
	private static final String getPage = "freeBoard/list";
	private static final String command = "/freeboard_list.ubi";
	
	@Autowired
	private UbiDao ubiDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value = "whatColumn", required = false ) String whatColumn,
			@RequestParam(value = "keyword", required = false ) String keyword,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			HttpServletRequest request, Model model,Locale locale) {
		Map<String, String> map = new HashMap<String, String>() ;
		
		int totalCount = ubiDao.GetTotalCount( map );
		String url = request.getContextPath() + command ;
		
		Paging pageInfo 
		= new Paging( pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		
		List<UbiBean> lists=ubiDao.selectAll(pageInfo,map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject( "lists", lists );
		mav.addObject( "totalCount", totalCount );
		try {
			System.out.println("ctrl : "+lists.get(3).getTitle());			
		}catch(Exception e) {System.out.println("ctrl실패");}
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value="read_count_update")
	public void updateReadCount(@RequestParam(value = "id", required = false ) String id) {
		ubiDao.updateReadCount(Integer.valueOf(id));
	}
}
