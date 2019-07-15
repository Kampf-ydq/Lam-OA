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
        //��ȡ����ַ���
        String random = CaptchaUtil.random();
        //���ͼƬ
        CaptchaUtil.outputImage(random,response.getOutputStream());
        //������
        request.getSession().setAttribute("res",CaptchaUtil.num);
        
    }


}
