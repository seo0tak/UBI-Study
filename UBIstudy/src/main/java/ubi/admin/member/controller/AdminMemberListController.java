package ubi.admin.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ubi.admin.member.model.AdminMemberBean;
import ubi.admin.member.model.AdminMemberDao;
import utility.Paging;

@Controller
public class AdminMemberListController 
{
	private static final String command = "/admin_member_list.ubi";
	private static final String getPage = "admin/member/admin_member_list";
	
	@Autowired
	@Qualifier("myAdminMemberDao")
	private AdminMemberDao adminMemberDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pagSize", required = false) String pagSize,
			HttpServletRequest request)
	{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		int totalCount = adminMemberDao.GetTotalCount(map);
		String url = request.getContextPath() + this.command;
		Paging pageInfo = new Paging(pageNumber, pagSize, totalCount, url, whatColumn, keyword, null);
		List<AdminMemberBean> lists = adminMemberDao.GetDataList(pageInfo, map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);
		return mav;
	}
}
