package com.chinasoft.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinasoft.pojo.Pose;
import com.chinasoft.service.PoseService;

import net.sf.json.JSONObject;

/*
 * 公告管理Controller
 */
@Controller
public class PoseController {

	@Resource
	private PoseService poseService;
	
	@RequestMapping("/showAllPose")
	public String getAllPose(HttpServletRequest request){
		//取出所以公告數據
		List<Pose> poses = poseService.selectAllpose();
		
		request.setAttribute("poselist", poses);
		
		return "index";
	}
	
	@RequestMapping("/publishPose")
	public void publishPose(@RequestBody String poseStr,HttpServletRequest request,HttpServletResponse resp){
		
		//拼装pojo对象
		JSONObject object = JSONObject.fromObject(poseStr);
		Pose dbPose = new Pose();
		dbPose.setT_title(object.getString("t"));
		dbPose.setT_content(object.getString("c"));
		dbPose.setT_date(object.getString("d"));
		
		
		int count = poseService.addPose(dbPose);
		
		String res = null;
		if (count > 0) {
			res = "{\"res\":\"OK\"}";
		}else {
			res = "{\"res\":\"Er\"}";
		}
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=utf-8");
		try {
			resp.getWriter().write(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/del.do")
	public void delPose(HttpServletRequest request,HttpServletResponse resp){
		
		String title = request.getParameter("title");
		
		int count = poseService.deleteByTitle(title);
		
		String res = null;
		if (count > 0) {
			res = "{\"res\":\"OK\"}";
		}else {
			res = "{\"res\":\"Er\"}";
		}
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=utf-8");
		try {
			resp.getWriter().write(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
