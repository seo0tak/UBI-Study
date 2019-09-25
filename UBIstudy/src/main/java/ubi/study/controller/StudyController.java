package ubi.study.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudyController {
	private static final String getPage = "studyboard/online_list";
	private static final String command = "/study_list.ubi";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(@RequestParam("nick") String nick) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("nick", nick);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value="/compile")
	@ResponseBody
	public String doAction(@RequestParam Map<String,Object> param,
							HttpServletRequest request) {
		String code = (String)param.get("code");
		String path2 = request.getSession().getServletContext().getRealPath("/compile_temp/");
		System.out.println("�����ι��� : "+path2);	
		File file = new File(path2+"Main.class");
		if( file.exists() ){
            file.delete();
        }
		File Folder = new File(path2);
		file = new File(path2+"Main.java");
		FileWriter fw;
		try{
		    Folder.mkdir(); 
		    fw = new FileWriter(file);
			fw.write(code);
			fw.close();
	    } 
        catch(Exception e){
		    e.getStackTrace();
		}        
		
		Cmd cmd = new Cmd();
		String command = cmd.inputCommand("cd "+path2+" & javac Main.java");
		cmd.execCommand(command);
		command = cmd.inputCommand("cd "+path2+" & java Main");
		String result = cmd.execCommand(command);
		return result;
	}
	
	@RequestMapping(value="/file")
	@ResponseBody
	public String doAction(HttpServletRequest request) {
		String path2 = request.getSession().getServletContext().getRealPath("/compile_temp/Main.txt");
		String line = null;
		BufferedReader br = null;
		try{
			br = new BufferedReader(new FileReader(path2));
			StringBuffer sb = new StringBuffer();
			while ((line = br.readLine()) != null) {
                sb.append(line);
            }
		} 
		catch(Exception e){
			e.getStackTrace();
		} finally {
            try { 
                if (br!=null) 
                    br.close();
            } catch (Exception e) {}
        }
		return line;
	}
}
