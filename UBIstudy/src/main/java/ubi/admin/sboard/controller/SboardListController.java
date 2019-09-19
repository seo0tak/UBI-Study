package ubi.admin.sboard.controller;

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

import ubi.admin.sboard.model.SboardBean;
import ubi.admin.sboard.model.SboardDao;
import utility.Paging;

@Controller
public class SboardListController 
{
	private static final String command = "/admin_sboard_list.ubi";
	private static final String getPage = "admin/sboard/admin_sboard_list";
	
	@Autowired
	@Qualifier("mySboardDao")
	private SboardDao sboardDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pageSize", required = false) String pageSize,
			HttpServletRequest request)
	{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		int totalCount = sboardDao.GetTotalCount(map);
		String url = request.getContextPath() + this.command;
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		List<SboardBean> sbList = sboardDao.GetDataList(pageInfo, map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("sbList", sbList);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);//admin_sboard_list
		return mav;
	}
}
