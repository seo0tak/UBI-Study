package ubi.study.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
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
	public ModelAndView doAction(@RequestParam("nick") String nick,HttpServletRequest request) {
		
		String isDir = request.getSession().getServletContext().getRealPath("/compile_temp/");
		File path = new File(isDir);
		
		String fileList[] = path.list(new FilenameFilter() {
			  @Override
			  public boolean accept(File dir, String name) {
				  return name.endsWith("java"); //java로 끝나는 파일
			  }
		});
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("nick", nick);
		mav.addObject("fileList", fileList);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value="/compile")
	@ResponseBody
	public String doAction(@RequestParam Map<String,Object> param,
							HttpServletRequest request) {
		String code = (String)param.get("code");
		String file_name = (String)param.get("file_name");
		String result = null;
		System.out.println("aaa"+file_name);
		if(file_name!="") {
			String path2 = request.getSession().getServletContext().getRealPath("/compile_temp/");
			File file = new File(path2+file_name+".class");
			//File file = new File(path2+"Main.class");
			if( file.exists() ){
	            file.delete();
	        }
			File Folder = new File(path2);
			//file = new File(path2+"Main.java");
			file = new File(path2+file_name+".java");
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
			String command = cmd.inputCommand("cd "+path2+" & javac "+file_name+".java");
			//String command = cmd.inputCommand("cd "+path2+" & javac Main.java");
			cmd.execCommand(command);
			command = cmd.inputCommand("cd "+path2+" & java "+file_name);
			//command = cmd.inputCommand("cd "+path2+" & java Main");
			result = cmd.execCommand(command);
		}
		System.out.println("result : " + result);
		return result;
	}
	
	@RequestMapping(value="/file")
	@ResponseBody
	public String doAction(HttpServletRequest request,@RequestParam("file_name") String file_name) throws IOException {
		String path2 = request.getSession().getServletContext().getRealPath("/compile_temp/"+file_name);
		StringBuilder  stringBuilder;
	    FileReader     fileReader     = null;
	    BufferedReader bufferedReader = null;
		try{
			stringBuilder = new StringBuilder();
			fileReader = new FileReader(path2);
	        bufferedReader = new BufferedReader(fileReader);
		    String line;
		    while ((line = bufferedReader.readLine()) != null)
		            stringBuilder.append(line).append('\n');
		         
		    } finally {
		        if (bufferedReader != null) try { bufferedReader.close(); } catch (Exception ex) { /* Do Nothing */ }
		        if (fileReader     != null) try { fileReader    .close(); } catch (Exception ex) { /* Do Nothing */ }
		    }
		    
		    return stringBuilder.toString();
	}
	
}
