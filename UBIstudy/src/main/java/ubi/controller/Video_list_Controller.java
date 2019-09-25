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

import ubi.model.Fav_VideoBean;
import ubi.model.UbiDao;
import ubi.model.VideoBean;
import utility.Paging;

@Controller
public class Video_list_Controller {
	private static final String getPage = "freeBoard/list";
	private static final String command = "/freeboard_list.ubi";
	
	@Autowired
	private UbiDao ubiDao;
	
	
	
	@RequestMapping(value="videoboard_list")
	public ModelAndView doAction(@RequestParam(value = "whatColumn", required = false ) String whatColumn,
			@RequestParam(value = "keyword", required = false ) String keyword,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			HttpServletRequest request, Model model,Locale locale) {
		Map<String, String> map = new HashMap<String, String>() ;
		
		int totalCount = ubiDao.GetTotalVideo( map );
		String url = request.getContextPath() + command ;
		Paging pageInfo= new Paging( pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		
		List<VideoBean> lists=ubiDao.selectAllVideo(pageInfo,map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject( "lists", lists );
		mav.addObject( "totalCount", totalCount );
		try {
			System.out.println("ctrl : "+lists.get(0).getTitle());			
		}catch(Exception e) {System.out.println("ctrl실패");}
		
		List<Fav_VideoBean> fav=ubiDao.selectFavVideo(pageInfo,map);
		mav.addObject( "fav", fav );
		try {
			System.out.println("ctrl_FAV : "+fav.get(0).getId());
			System.out.println("ctrl_FAVSIZE : "+fav.size());
		}catch(Exception e) {System.out.println("ctrl_FAV실패");}
		mav.addObject( "favCount", fav.size() );
		
		mav.setViewName("videoBoard/list");
		return mav;
	}
	
	
	@RequestMapping(value="videoboard_key")
	public ModelAndView doKeyAction(@RequestParam(value = "whatColumn", required = false ) String whatColumn,
			@RequestParam(value = "keyword", required = false ) String keyword,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			HttpServletRequest request, Model model,Locale locale,
			@RequestParam(value = "key", required = false ) String id
			) {
		Map<String, String> map = new HashMap<String, String>() ;
		
		int totalCount = ubiDao.GetTotalKeyVideo( map,id );
		String url = request.getContextPath() + command ;
		Paging pageInfo= new Paging( pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		
		List<VideoBean> lists=ubiDao.selectKeyVideo(pageInfo,map,id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject( "lists", lists );
		mav.addObject( "totalCount", totalCount );
		try {
			System.out.println("ctrl : "+lists.get(0).getTitle());			
		}catch(Exception e) {System.out.println("ctrl실패");}
		
		List<Fav_VideoBean> fav=ubiDao.selectFavVideo(pageInfo,map);
		mav.addObject( "fav", fav );
		try {
			System.out.println("ctrl_FAV : "+fav.get(0).getId());
			System.out.println("ctrl_FAVSIZE : "+fav.size());
		}catch(Exception e) {System.out.println("ctrl_FAV실패");}
		mav.addObject( "favCount", fav.size() );
		
		mav.setViewName("videoBoard/list");
		return mav;
	}
}
