package ubi.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import ubi.member.model.MemberBean;
import ubi.member.model.PlanerBean;
import ubi.model.Fav_VideoBean;
import ubi.model.KeyBean;
import ubi.model.UbiBean;
import ubi.model.UbiDao;
import ubi.model.VideoBean;
import ubi.study.model.StudyBoardBean;
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
		String countchk="";
		cnt=ubiDao.loginCheck(bean);
		pw=ubiDao.loginPwCheck(bean);
		proof=ubiDao.SelectProof(bean);
		nick=ubiDao.SelectNick(bean);
		countchk=ubiDao.SelectCount(bean);
		if(cnt==0) {
		}
		System.out.println("cnt : "+cnt);
		System.out.println("ctrl : "+nick);
		String cnts=String.valueOf(cnt)+"/"+pw+"/"+proof+"/"+nick+"/"+countchk;
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
		Map<String, String> map2 = new HashMap<String, String>() ;
		
		
		
//--------찜한 영상 가져오기--------찜한 영상 가져오기--------찜한 영상 가져오기--------찜한 영상 가져오기--------찜한 영상 가져오기--------찜한 영상 가져오기--------찜한 영상 가져오기
		
		List<Fav_VideoBean> favList=ubiDao.selectFavVideoById(pageInfo, map2, bean.getId());//fav_video에서 일치하는 id를 가져온다.
		
		List<VideoBean> videoList=new ArrayList<VideoBean>();
		for(int i=0;i<favList.size();i++) {
			int favV=favList.get(i).getVideonum();//fav_video에 있는 영상의 번호를 가져온다.
			VideoBean bean2=ubiDao.selectVideoByNum(favV);//영상의 번호를 통해 video_board에서 영상을 가져온다.
			try{
				System.out.println("------videoList : TITLE : "+bean2.getTitle());//시험삼아 출력해본다.
			}catch(Exception e) {
				System.out.println("------videoList : TITLE : 실패");
			}
			videoList.add(bean2);//찜한 영상 목록에 추가한다.
		}
		
		
//--------'내가 만든 스터디그룹' 가져오기--------'내가 만든 스터디그룹' 가져오기--------'내가 만든 스터디그룹' 가져오기--------'내가 만든 스터디그룹' 가져오기--------'내가 만든 스터디그룹' 가져오기
		List<StudyBoardBean> stdBean =studyBoardDao.selectAllByNick(pageInfo, map2, bean.getNick());
		try {
			System.out.println("studyBoardDao.selectAllByNick : SIZE : "+stdBean.size());
		}catch(Exception e) {
			System.out.println("studyBoardDao.selectAllByNick : SIZE : 실패");
		}
		
		
//--------'내가 참여한 스터디그룹' 가져오기--------'내가 참여한 스터디그룹' 가져오기--------'내가 참여한 스터디그룹' 가져오기--------'내가 참여한 스터디그룹' 가져오기--------'내가 참여한 스터디그룹' 가져오기
		//내가 만든건 안뜨게
		List<KeyBean> key=ubiDao.selectKeyById(bean.getId());//---------------------	//1. id로 검색한 key들을 가져온다.
		List<StudyBoardBean> allstd=studyBoardDao.selectAll(pageInfo, map2);//------	//2. 모든 스터디 그룹을 가져온다.
		
		List<StudyBoardBean> myStudyGroup=new ArrayList<StudyBoardBean>();//--------	//3. 여기에 '내가 참여한 스터디그룹'이 들어갈 예정.
		for(int i=0;i<allstd.size();i++) {
			String stdKey=allstd.get(i).getFlag();//--------------------------------	//4. 순서대로 스터디그룹의 키값을 가져온다.
			for(int j=0;j<key.size();j++) {
				String userKey=key.get(j).getKey();//-------------------------------	//5. 순서대로 회원이 가지고 있는 키값들을 가져온다.
				System.out.println("for(int j=0;j<key.size();j++) : user  : "+userKey);
				System.out.println("for(int j=0;j<key.size();j++) : group : "+stdKey);
				if(stdKey.equals(userKey)) {//--------------------------------------	//6. 두 키값을 비교한다.
					int flag=0;
					for(int k=0;k<stdBean.size();k++) {
						if(allstd.get(i).getNum()==stdBean.get(k).getNum()||key.get(j).getConf().equals("x")) {
						//----------------------------------------------------------	//7. 만약 '내가 만든 스터디그룹'에 있거나 conf가 x인 것이라면 거른다.
							flag=1;break;
						}else {
						}
					}
					if(flag==1) {
					}else {
						myStudyGroup.add(allstd.get(i));//--------------------------	//8. 조건을 만족했다면 리스트에 추가한다.						
					}
					break;
				}
			}
		}
		try {//잘 들어 갔는지 확인.
			System.out.println("List<StudyBoardBean> myStudyGroup : SIZE : "+myStudyGroup.size());
			System.out.println("List<KeyBean> key : SIZE : "+key.size());
			System.out.println("List<StudyBoardBean> allstd : SIZE : "+allstd.size());
		}catch(Exception e) {//만약 출력할 것이 없다면 에러가 발생하여 실패를 출력한다.
			System.out.println("List<StudyBoardBean> myStudyGroup : SIZE : 실패");
		}
		
		List<KeyBean> newMember=new ArrayList<KeyBean>();
		for(int i=0;i<key.size();i++){
			String ke=key.get(i).getKey();
			List<KeyBean> kes=ubiDao.selectKeyByKey(ke);
			System.out.println("kes : SIZE : "+kes.size());
			for(int j=0;j<kes.size();j++) {
				System.out.println("-----kes.get(j).getConf() : value : "+kes.get(j).getConf());
				if(kes.get(j).getConf().equals("x")) {
					newMember.add(kes.get(j));System.out.println("삽입됨");
				}
			}
		}
		
		
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject( "bean", bean );//회원정보
		mav.addObject( "plan", plan );//일정목록
		mav.addObject( "fav", videoList );//찜한 비디오 목록
		mav.addObject( "stdBean", stdBean );//내가 만든 그룹
		mav.addObject( "myStd", myStudyGroup );//내가 참여한 그룹
		mav.addObject( "newMember", newMember );//새로운 맴버
		
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
	
	@RequestMapping(value="confNewMember")
	public String confNewMember(@RequestParam(value = "conf", required = false ) String conf,
			@RequestParam(value = "id", required = false ) String id
			) {
		int num=Integer.parseInt(conf);
		ubiDao.updateConf(num);
		return "redirect:user_myPage.ubi?id="+id;
	}
	@RequestMapping(value="updateMember")
	public ModelAndView updateMember(@RequestParam(value = "id", required = false ) String id) {
		MemberBean bean=ubiDao.SelectOneMember(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject( "bean", bean );//회원정보
		mav.setViewName("update");
		return mav;
	}
	@Bean(name = "multipartResolver") public MultipartResolver multipartResolver() {
		return new CommonsMultipartResolver();
	}
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	@ResponseBody
	public Object uploadFile(MultipartHttpServletRequest request) {
		Iterator<String> itr = request.getFileNames();
		if(itr.hasNext()) {
			MultipartFile mpf = request.getFile(itr.next());
			System.out.println(mpf.getOriginalFilename() +" uploaded!");
			try {System.out.println("file length : " + mpf.getBytes().length);
				System.out.println("file name : " + mpf.getOriginalFilename());
			} catch (IOException e) {
				System.out.println(e.getMessage()); e.printStackTrace();
			}
		return true;
		}
		else {
			return false;
		}
	}

	
}
