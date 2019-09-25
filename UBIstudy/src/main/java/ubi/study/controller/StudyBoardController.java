package ubi.study.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ubi.study.model.StudyBoardBean;
import ubi.study.model.StudyBoardDao;
import utility.Paging;

@Controller
public class StudyBoardController {
	private static final String getPage = "studyboard/list";
	
	@Autowired 
	StudyBoardDao studyBoardDao;
	
	@RequestMapping(value="/studyboard_list.ubi")
	public ModelAndView doAction(@RequestParam(value = "whatColumn", required = false ) String whatColumn,
			@RequestParam(value = "keyword", required = false ) String keyword,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			HttpServletRequest request, Model model,Locale locale) {
		Map<String, String> map = new HashMap<String, String>() ;
		
		map.put("whatColumn", whatColumn ) ;
		map.put("keyword", "%" + keyword + "%" ) ;
		
		int totalCount = studyBoardDao.GetTotalCount( map );
		String url = request.getContextPath() + "/studyboard_list.ubi" ;
		
		Paging pageInfo 
		= new Paging( pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		
		List<StudyBoardBean> lists=studyBoardDao.selectAll(pageInfo,map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject( "lists", lists );
		mav.addObject( "totalCount", totalCount );
		mav.addObject( "pageInfo", pageInfo );
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		mav.addObject( "login", 0 );
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value="/studyboard_insert.ubi")
	public void doAction(@ModelAttribute("study") StudyBoardBean bean) {
		System.out.println("닉이오냐       :"+bean.getNick());
		System.out.println("flag이오냐       :"+bean.getFlag());
		studyBoardDao.InsertData(bean);
	}
}
