package com.chinasoft.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinasoft.pojo.Sign;
import com.chinasoft.service.SignService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/*
 * ǩ������������
 */
@Controller
public class SignController {

	@Resource
	private SignService signService;

	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	public void doSave(@RequestBody String signJsonStr,HttpServletRequest req,HttpServletResponse resp) {

		// ����ǰ̨����
		JSONObject jsonObject = JSONObject.fromObject(signJsonStr);
		JSONArray jsonArray = jsonObject.getJSONArray("sign");
		for (int i = 0; i < jsonArray.size(); i++) {
			Sign sign = new Sign();

			// ��װJava����
			sign.setG_id(null);
			sign.setG_yno(JSONObject.fromObject(jsonArray.get(i)).getString("yno"));
			sign.setG_yname(JSONObject.fromObject(jsonArray.get(i)).getString("yname"));
			sign.setG_pname(JSONObject.fromObject(jsonArray.get(i)).getString("pname"));
			sign.setG_zname(JSONObject.fromObject(jsonArray.get(i)).getString("zname"));
			sign.setG_scode(JSONObject.fromObject(jsonArray.get(i)).getString("sataus"));
			sign.setG_date(JSONObject.fromObject(jsonArray.get(i)).getString("sdate"));

			// нˮĬ������Ϊ8000
			sign.setG_salary("8000");
			
			//�������ݿ�
			signService.addSignData(sign);
			//System.out.println("====>>>" + sign.getG_yname());
		}
		
		try {
			PrintWriter out = resp.getWriter();
			out.write("true");
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*@Param String empNo 
	 * 
	 * ������Ա����Ų�ѯ
	 */
	@RequestMapping(value="/showAllSign")
	public String getAllSign(HttpServletRequest request,
							@RequestParam(required=true,defaultValue="1") Integer pageNo,
							@RequestParam(required=false) String empNo){
		List<Sign> signs = null;
		PageHelper.startPage(pageNo, 10);
		//�����ŵĵ�һ�������ᱻ��ҳ
		if (empNo != null) {
			signs = signService.searchEmpByNo(empNo);
		}else {
			signs = signService.selectAllSign();
		}

		PageInfo page = new PageInfo(signs);

		request.setAttribute("signlist", signs);
		request.setAttribute("page", page);
		request.setAttribute("empno", empNo);

		return "show_sign";
	}
	
	
	@RequestMapping(value="/delSignById")
	public void deletSign(HttpServletRequest req,HttpServletResponse resp,
							@RequestParam(required=true) String id){

		signService.deleteSignById(id);
		
		String res = "{\"res\":\"OK\"}";
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=utf-8");
		try {
			resp.getWriter().write(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public void doUpdate(@RequestBody String signJsonStr,HttpServletRequest req,HttpServletResponse resp) {

		// ����ǰ̨����
		JSONObject jsonObject = JSONObject.fromObject(signJsonStr);
		String id = jsonObject.getString("g_id");
		String date = jsonObject.getString("g_date");
		String sts = jsonObject.getString("g_scode");
			
		//�޸�����
		int flag = signService.modify(id, date, sts);
		
		String res = "{\"res\":\""+flag+"\"}";
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=utf-8");
		try {
			resp.getWriter().write(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//���ڱ�ͳ����Ϣ������
	@RequestMapping(value="/statisticsInfo")
	public String showStatisInfo(HttpServletRequest request,@RequestParam(required=false) String day){

		//���ڣ����٣��¼٣�����
		int attendance,illLeave,busLeave,other;
		attendance = signService.selectByDate("����", day);
		illLeave = signService.selectByDate("����", day);
		busLeave = signService.selectByDate("�¼�", day);
		other = signService.selectByDate("����", day);
		
		int leave = illLeave + busLeave;
		
		request.setAttribute("attend", attendance);
		request.setAttribute("ill", illLeave);
		request.setAttribute("bus", busLeave);
		request.setAttribute("other", other);
		request.setAttribute("leave", leave);
		
		request.setAttribute("day", day);
		
		return "showInfo";
	}
	
}
