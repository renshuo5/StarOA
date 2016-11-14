package com.fjsdfx.starerp.common.bean;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

/**
 * @author Chen_Luqiang
 *
 */
public class FileUpload {
	
	/**
	 * 
	 *
	 * 
	 *1. 在jsp页面的上传图片的form里加上 enctype="multipart/form-data" 
	 * 
	 * 例如：<form action="security/user/user_add" method="post"   enctype="multipart/form-data" >
	 *   	<input type="file" name="uploadFile" size="50">
	 *   	</form>
	 *2.  若上传文件的<input> 的name是"uploadFile"
	 *   
	 *   在action中定义	private File uploadFile;
						private String uploadFileFileName;
						private String uploadFileContentType;
		并加上get和set方法
		
		将这三个参数传入该方法，若文件上传成功 则返回的是这个文件上传后的路径。若没有文件上传，则返回值是null;
	 *   
	 * 3.  使用此方法前请先判断好有选定文件，并用try catch包围该方法
	 * 例如：
	 * try
	 * {
	 * path=FileUpload.upload(uploadFile,uploadFileFileName,uploadFileContentType)
	 * }
	 * catch(Exception e)
	 * {
	 * 	return "upload error";
	 * }
	 *   
	 * @param uploadFile
	 * @param uploadFileFileName
	 * @param uploadFileContentType
	 * @return 文件存储路径
	 */
	public static String upload(File uploadFile,String uploadFileFileName,String uploadFileContentType) throws Exception
	{
		SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy/MM/dd");

		String logopath = "upload/" + simpledateformat.format(new Date());
		String path = ServletActionContext.getServletContext().getRealPath(
				logopath);
		File file = new File(path + "/" + uploadFileFileName);
		System.out.println(file);
		BufferedInputStream bis = null;//获取一个上传文件的输入流 
		BufferedOutputStream bos = null;//获取一个上传文件的输出流
		try {

			
			file.getParentFile().mkdirs();
		
		bis = new BufferedInputStream(new FileInputStream(uploadFile));
		bos = new BufferedOutputStream(new FileOutputStream(file));

		byte buf[] = new byte[(int) uploadFile.length()];
		int length = 0;
		while ((length = bis.read(buf)) != -1) {
			bos.write(buf, 0, length);
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (bis != null) {
				bis.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			if (bos != null) {
				bos.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	if(uploadFile!=null)
	{
	return logopath + "/" + uploadFileFileName;
	}
	else
	{
		return null;
	}
	
	}

}
