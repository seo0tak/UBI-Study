package ubi.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ubi.member.model.MemberBean;
import ubi.member.model.PlanerBean;
import ubi.model.UbiBean;
import ubi.model.UbiDao;
import ubi.study.model.StudyBoardDao;
import utility.Paging;

@Controller
public class Free_list_Controller {
	private static final String getPage = "freeBoard/list";
	private static final String command = "/freeboard_list.ubi";
	
	@Autowired
	private UbiDao ubiDao;
	
	@Autowired
	private StudyBoardDao studyBoardDao;
	
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
		
		
		mav.addObject( "login", 0 );
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value="read_count_update")
	public void updateReadCount(@RequestParam(value = "id", required = false ) String id) {
		ubiDao.updateReadCount(Integer.valueOf(id));
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/login.ubi",produces = "application/text; charset=utf8")
	public String login(MemberBean bean,HttpServletResponse response) {
		//response.setCharacterEncoding("UTF-8");
		int cnt=0;
		String pw="";
		String proof="";
		String nick="";
		cnt=ubiDao.loginCheck(bean);
		pw=ubiDao.loginPwCheck(bean);
		proof=ubiDao.SelectProof(bean);
		nick=ubiDao.SelectNick(bean);
		if(cnt==0) {
		}
		System.out.println("cnt : "+cnt);
		System.out.println("ctrl : "+nick);
		String cnts=String.valueOf(cnt)+"/"+pw+"/"+proof+"/"+nick;
		return cnts;
	}
	
	@RequestMapping(value="user_myPage")
	public ModelAndView user_myPage(@RequestParam(value = "whatColumn", required = false ) String whatColumn,
			@RequestParam(value = "keyword", required = false ) String keyword,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			HttpServletRequest request, Model model,Locale locale,@RequestParam(value = "id", required = false ) String id) {
		MemberBean bean=ubiDao.SelectOneMember(id);
		System.out.println(bean.getId());
		System.out.println(bean.getPoint());
		Map<String, Object> map = new HashMap<String, Object>() ;
		int totalCount=1;
		String url="";
		Paging pageInfo 
		= new Paging( pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		List<PlanerBean> plan =studyBoardDao.PlanByNick(bean.getNick());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject( "bean", bean );
		mav.addObject( "plan", plan );
		mav.setViewName("myPage");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="description.ubi",produces="text/plain;charset=UTF-8")
	public String description(@RequestParam("start") String start,@RequestParam("end") String end) {
		String result = studyBoardDao.PlanByDescription(start,end);
		System.out.println("이거왜또안나와                :"+result);
		return result;
	}
}
