package com.chinasoft.pojo;
import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;
import java.util.List;

public class CaptchaUtil {

    public static String [] fuhao = {"+","-","*","/"};
    public static int num = 0;

    //���������ʽ
    public static String random(){

        List list = new ArrayList();
        Random ran = new Random();
        int n1 = ran.nextInt(10);
        int n2 = ran.nextInt(10);
        String f = fuhao[ran.nextInt(fuhao.length)];
        StringBuilder sb = new StringBuilder(4);

        switch (f){
            case "+":
                num = n1+n2;
                break;
            case "-":
                num =n1-n2;
                break;
            case "*":
                num = n1*n2;
                break;
            case "/":
                if(n2 == 0){
                    n2 = ran.nextInt(10)+1;
                    num = n1/n2;
                }else{
                    num = n1/n2;
                }
                break;
        }
        sb.append(n1);
        sb.append(f);
        sb.append(n2);
        sb.append("=");

        return sb.toString();
    }
    public static void outputImage(String str, OutputStream os){
        Random ran = new Random();
        //����ͼƬ����
        BufferedImage img = new BufferedImage(100,40, BufferedImage.TYPE_INT_RGB);
        //��ȡ����
        Graphics g = img.getGraphics();
        //���ñ���
        g.setColor(Color.white);
        g.fillRect(0,0,100,40);
        //д��
        g.setColor(Color.black);
        g.setFont(new Font("΢���ź�",Font.PLAIN,30));
        g.drawString(str,10,40);
        //���������
        g.drawLine(ran.nextInt(100),ran.nextInt(40),
                ran.nextInt(100),ran.nextInt(40));
        g.drawLine(ran.nextInt(100),ran.nextInt(40),
                ran.nextInt(100),ran.nextInt(40));
        g.drawLine(ran.nextInt(100),ran.nextInt(40),
                ran.nextInt(100),ran.nextInt(40));
        // 4. ������
        // ������ѹ����ʽ��jpeg(����ѹ��), png(����ѹ��) ...
        try {
            ImageIO.write(img, "png", os);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
