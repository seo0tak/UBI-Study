package ubi.admin.vboard.controller;

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

import ubi.admin.vboard.model.VboardBean;
import ubi.admin.vboard.model.VboardDao;
import utility.Paging;

@Controller
public class VboardListController 
{
	private static final String command = "/admin_vboard_list.ubi";
	private static final String getPage = "admin/vboard/admin_vboard_list";
	
	@Autowired
	@Qualifier("myVboardDao")
	private VboardDao vboardDao;
	
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
		int totalCount = vboardDao.GetTotalCount(map);
		String url = request.getContextPath() + this.command;
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		List<VboardBean> vbList = vboardDao.GetDataList(pageInfo, map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vbList", vbList);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);
		return mav;
	}
}
