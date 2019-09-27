package ubi.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ubi.admin.fboard.model.FboardBean;
import ubi.admin.fboard.model.FboardDao;
import ubi.admin.nboard.model.NboardDao;
import ubi.admin.sboard.model.SboardDao;
import ubi.admin.vboard.model.VboardDao;
import utility.Paging;

@Controller
public class UbiAdminMainController 
{
	private static final String command = "/admin_main.ubi";
	private static final String getPage = "admin/admin_main";
	
	@Autowired
	private FboardDao fboardDao;
	@Autowired
	private NboardDao nboardDao;
	@Autowired
	private SboardDao sboardDao;
	@Autowired
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
		int totalCount = fboardDao.GetTotalCount(map);
		int ncount = nboardDao.GetTotalCount(map);
		int scount = sboardDao.GetTotalCount(map);
		int vcount = vboardDao.GetTotalCount(map);
		String url = request.getContextPath() + this.command;
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);
		List<FboardBean> fbl = fboardDao.GetDataList(pageInfo, map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ncount", ncount);
		mav.addObject("scount", scount);
		mav.addObject("vcount", vcount);
		mav.addObject("totalCount", totalCount);
		mav.addObject("fbl", fbl);
		mav.addObject("pageInfo", pageInfo);
		mav.setViewName(getPage);
		return mav;
	}
	
	/*@RequestMapping(value="/chart.ubi")
	public int chart() {
		int new_fcount = fboardDao.GetNewCount();
		int new_ncount = nboardDao.GetNewCount();
		int new_scount = sboardDao.GetNewCount();
		int new_vcount = vboardDao.GetNewCount();
		return 0;
	}*/
}
