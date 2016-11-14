package com.fjsdfx.starerp.persons.action;



import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.ObjectUtils.Null;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.fjsdfx.starerp.common.bean.FileUpload;
import com.fjsdfx.starerp.common.bean.PagerModel;
import com.fjsdfx.starerp.persons.model.Rasmessage;
import com.fjsdfx.starerp.persons.service.RasmessageService;
import com.fjsdfx.starerp.security.model.User;
import com.fjsdfx.starerp.security.service.UserService;
import com.googlecode.jsonplugin.annotations.JSON;
import com.opensymphony.xwork2.ActionSupport;

import org.springframework.security.context.SecurityContextHolder;




/**
 * @author wuhaibin
 *
 */
@Controller
@Scope("prototype")
public class RasmessageAction extends ActionSupport{
	private Logger logger=LoggerFactory.getLogger(RasmessageAction.class);
	private RasmessageService RasmessageService;
	private Rasmessage rasmessage=null;
	private PagerModel pm;
	private Integer userId;
	private Integer rasmessageId;
	private String paname; 
	private UserService userService;
	private User user=null;
	private User rperString;//当前用户
	
	private File uploadFile;
	private String uploadFileFileName;
	private String uploadFileContentType;
	private String  meString;
	
	

	//@JSON(serialize=false)
	public Integer getRasmessageId() {
		return rasmessageId;
	}

	//@JSON(serialize=false)
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public void setRasmessageId(Integer rasmessageId) {
		this.rasmessageId = rasmessageId;
	}

	@JSON(serialize=false)
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	@JSON(serialize=false)
	public RasmessageService getRasmessageService() {
		return RasmessageService;
	}

	@Resource
	public void setRasmessageService(RasmessageService rasmessageService) {
		RasmessageService = rasmessageService;
	}
	
	@JSON(serialize=false)
	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Rasmessage getRasmessage() {
		return rasmessage;
	}

	public void setRasmessage(Rasmessage rasmessage) {
		this.rasmessage = rasmessage;
	}


	public PagerModel getPm() {
		return pm;
	}

	public void setPm(PagerModel pm) {
		this.pm = pm;
	}
	
	
	

	public String getPaname() {
		return paname;
	}

	public void setPaname(String paname) {
		this.paname = paname;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getRperString() {
		return rperString;
	}

	public void setRperString(User rperString) {
		this.rperString = rperString;
	}
	
	//@JSON(serialize=false)
	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}

	
	public String getMeString() {
		return meString;
	}

	public void setMeString(String meString) {
		this.meString = meString;
	}

	/**
	 * 获取当前用户
	 * @return
	 */
	private User users(){
		rperString=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return rperString;
	}

	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()  {
		

		pm=RasmessageService.getPagerDesc(Rasmessage.class,"where o.rper.id="+this.users().getId()+" and o.fla3='0' ");

		return "list";
	}

	/**
	 * 模糊查询（对收信人 ，标题）
	 * @return
	 */
	public String search()
	{
		Map<String,String> like=new HashMap<String,String>();

//		if(null==(rasmessage.getTitle())&&null!=(rasmessage.getSper().getUsername())){
//		   like.put("sper.name", rasmessage.getSper().getUsername());
//		   like.put("rper.name", this.users().getName());
//		   like.put("fla3", "0");
//		}
//		else if(null!=(rasmessage.getTitle())&&null==(rasmessage.getSper().getUsername())){
//		   like.put("title",  rasmessage.getTitle());
//		   like.put("rper.name", this.users().getName());
//		   like.put("fla3", "0");
//		}else {
			
			like.put("sper.employee.empName", rasmessage.getSper().getEmployee().getEmpName());
			like.put("title",  rasmessage.getTitle());
			like.put("rper.employee.empName", this.users().getEmployee().getEmpName());
			like.put("fla3", "0");
		//}
				
		pm=RasmessageService.fuzzyQuery(Rasmessage.class,like);
		
		return "list";
		
	}
	
	
	
	public String show()
	{

		rasmessage=RasmessageService.findById(Rasmessage.class, rasmessageId);
		rasmessage.setRasstatus("1");
		RasmessageService.update(rasmessage);
	    return "show";
	}
	
	/**
	 * 删除
	 * @return
	 */
	
	public String del()
	{
//		pm=employeeRapService.getPagerDesc(EmployeeRap.class, "where o.employee.empId="+employeeId);
//		List<EmployeeRap> list1=pm.getDatas();
//		for (EmployeeRap employeeRapTemp : list1) {
//			employeeRapService.delete(employeeRapTemp);
//		}
//        /***************************以上的步骤是先删除奖惩表里面的信息，以防人员表的信息删除不掉************************************************************/
		rasmessage=RasmessageService.findById(Rasmessage.class, rasmessageId);
		rasmessage.setFla3("1");
		RasmessageService.update(rasmessage);
		//RasmessageService.deleteById(Rasmessage.class, rasmessageId);
		logger.warn("del empId="+rasmessageId);
		return "pub_del_success";
	}
	/**
	 * 添加
	 * @return
	 */
	public String add()
	{  
	if(userId!=null && rasmessage.getTitle()!=null){
		
	
			try {
			rasmessage.setRper(userService.findById(User.class,userId));
			rasmessage.setSper(this.users());
			if(FileUpload.upload(uploadFile, uploadFileFileName, uploadFileContentType)==null){
				rasmessage.setFla1("0"); 
			}else{
				System.out.println("上传成功");
				rasmessage.setAccessories(FileUpload.upload(uploadFile, uploadFileFileName, uploadFileContentType));
				rasmessage.setFla1(uploadFileFileName); 
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		rasmessage.setRastime(new Date());
		rasmessage.setRasstatus("0");
		rasmessage.setFla2("0");
		rasmessage.setFla3("0");
		RasmessageService.saveAndRefresh(rasmessage);
		
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" add id="+rasmessage.getId());//日志记录
		
		
	}
		return "pub_add_success";
	}

	
	
	
	
	
/*===================================input============================================================*/
	
	public String addInput(){
		return "addInput";
	}
	public String replay()
	{
      
		user=userService.findById(User.class,userId);
		//user=this.users();
		return "replay";
	}
	public String selectInput(){
		
		pm=userService.getPagerDesc(User.class);
		return "selectInput";
	}

	/**
	 * 查看已发送的信息
	 */
	public String sList()  {
		

		pm=RasmessageService.getPagerDesc(Rasmessage.class,"where o.sper.id="+this.users().getId()+" and o.fla2='0' ");

		return "sList";
	}

	/**
	 * 删除
	 * @return
	 */
	
	public String sendedDel()
	{
		rasmessage= RasmessageService.findById(Rasmessage.class, rasmessageId);
		rasmessage.setFla2("1");
		RasmessageService.update(rasmessage);
		User currentUser =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		logger.warn("user id="+currentUser.getId()+" del id="+rasmessage.getId());//日志记录
		
		return "pub_del_success";
	}	
	/**
	 * 模糊查询（对收信人 ，标题）
	 * @return
	 */
	public String sendedSearch()
	{
		Map<String,String> like=new HashMap<String,String>();


			like.put("rper.employee.empName", rasmessage.getRper().getEmployee().getEmpName());
			like.put("title",  rasmessage.getTitle());
			like.put("sper.employee.empName", this.users().getEmployee().getEmpName());
			like.put("fla2", "0");
		
				
		pm=RasmessageService.fuzzyQuery(Rasmessage.class,like);
		
		return "sList";
		
	}	


public String isCkeck(){
	return "check";

}
public String checkFanhui(){

	User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	meString=RasmessageService.getMessg(user.getId());
	
	return SUCCESS;
	
}

}
