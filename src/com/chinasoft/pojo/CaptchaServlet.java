package com.chinasoft.pojo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/captcha.png")
public class CaptchaServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("image/png");
        //获取随机字符串
        String random = CaptchaUtil.random();
        //输出图片
        CaptchaUtil.outputImage(random,response.getOutputStream());
        //存入结果
        request.getSession().setAttribute("res",CaptchaUtil.num);
        
    }


}
