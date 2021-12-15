package cn.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.springframework.stereotype.Controller;

import cn.util.Const;

@Controller("uploadAction")
public class UploadAction extends BaseAction{
	private File fujian;
	private String fujianFileName;
	
	@Override
    public String execute() throws Exception
    {
        String root = session.getServletContext().getRealPath("/upload");   
        InputStream is = new FileInputStream(fujian);
        String newFileName=Const.getFileId()+fujianFileName.substring(fujianFileName.lastIndexOf("."));
        OutputStream os = new FileOutputStream(new File(root, newFileName));
        byte[] buffer = new byte[500];
        int length = 0;   
        while(-1 != (length = is.read(buffer, 0, buffer.length)))
        {
            os.write(buffer);
        }
        os.close();
        is.close();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
		out.print(newFileName);
		out.close();
		return null;
    }

	public File getFujian() {
		return fujian;
	}

	public void setFujian(File fujian) {
		this.fujian = fujian;
	}

	public String getFujianFileName() {
		return fujianFileName;
	}

	public void setFujianFileName(String fujianFileName) {
		this.fujianFileName = fujianFileName;
	}

	
}
