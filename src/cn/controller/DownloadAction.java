package cn.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

@Controller("downloadAction")
public class DownloadAction extends BaseAction{
	private String fileName;
	private String tempname;
	public String execute() {
		try {
			tempname=fileName;
			//在弹出下载框里面的中文文件名
			fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
			String filePath = session.getServletContext().getRealPath("/upload/"+tempname);
			File file=new File(filePath);
			if(!file.exists()){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('File not exist');history.go(-1);</script>");
				out.close();
				return null;
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public InputStream  getDownloadFile() throws Exception{
		String filePath = session.getServletContext().getRealPath("/upload/"+tempname);
		File file=new File(filePath);
		InputStream is = new FileInputStream(file);
		return is;
	}
	public void setFileName(String fileName) throws UnsupportedEncodingException {
		this.fileName = new String(fileName.getBytes("ISO8859-1"),"UTF-8");
	}
	
	public String getFileName(){
		return this.fileName;
	}

}
