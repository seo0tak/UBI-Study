package ubi.controller;

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

import ubi.model.UbiDao;
import ubi.study.model.StudyBoardBean;
import ubi.study.model.StudyBoardDao;
import utility.Paging;

@Controller
public class UbiMainController {
	private static final String getPage = "main";
	private static final String command = "/main.ubi";
	
	@Autowired
	private UbiDao ubiDao;
	
	@Autowired
	private StudyBoardDao s_dao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam(value = "whatColumn", required = false ) String whatColumn,
			@RequestParam(value = "keyword", required = false ) String keyword,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			HttpServletRequest request, Model model,Locale locale) {
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("whatColumn", whatColumn ) ;
		/*검색 단어 대문자로 바꿔주는 작업*/
		
		//System.out.println("공백제거해주냐                  :"+keyword.replaceAll(" ", ""));
		//System.out.println("한글+영문도 대문자로 바꿔주나                   :"+keyword.toUpperCase());
		map.put("keyword", "%" + keyword + "%" );
		
		int totalCount = s_dao.GetTotalCount( map );
		String url = request.getContextPath() + "/main.ubi" ;
		
		Paging pageInfo 
		= new Paging( pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		
		List<StudyBoardBean> study_list=s_dao.selectAll(pageInfo,map);
		ModelAndView mav = new ModelAndView();
		mav.addObject( "study_list", study_list );
		mav.addObject( "totalCount", totalCount );
		mav.addObject( "pageInfo", pageInfo );
		mav.setViewName(getPage);
		return mav;
	}
	
	
}
