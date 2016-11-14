$(document).ready(function(){
	//判断值是不是身份证
	function isIdentity(value){
		var reg=RegExp(/^(\d{14}|\d{17})(\d|[xX])$/);
		if(!reg.test(value)){
			return false;
		}
		return true;
	}
	//判断是不是电话号码
    function isTellPhone(value){
    	var reg=RegExp(/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/);
    	if(!reg.test(value)){
    		return false;
    	}
    	return true;
    }
 // 判断一个值是不是为空
	function isEmpty(value)
	{
		if(value==undefined||value=="")
		{
			return true;
		}
		return false;
	}
	
	
	//判断值是不是身份证
	var employeeidCardNo=$("#employeeidCardNo");
	//判断是不是电话号码
	var employeephoneNo=$(".employeephoneNo");
	// 提交按钮
	var submitBtn = $("input[type='submit']");
	//培训地点
	var checkAddress=$(".checkAddress");
	
	
	//判断值是不是身份证
	employeeidCardNo.live("blur",function(){
		if(!isIdentity($(this).val())){
			var infoStr=$.trim($(this).parent().prev().text().replace(":","").replace("：","")+"输入有误");
			var span=$(this).next("span");
			if(span){
				span.remove();
			}
			$(this).after($("<span style='color: #FF0000; font-size: 12px;' ></span>").css("color", "#ff6600").html("<img  src='images/pic/empty.gif' class='img_align'></img> "+infoStr));
		}
		else{
			var span=$(this).next("span");
			if(span){
			span.remove();}
		}
	})
	//判断是不是电话号码
	employeephoneNo.live("blur",function(){
		if(!isTellPhone($(this).val())){
			var infoStr =$.trim($(this).parent().prev().text().replace(":","").replace("：","")+"格式有误");
			var span=$(this).next("span");
			if(span){
				span.remove();
			}
			$(this).after($("<span style='color: #FF0000; font-size: 12px;' ></span>").css("color", "#ff6600").html("<img  src='images/pic/empty.gif' class='img_align'></img> "+infoStr));
		}
		else{
		var span=$(this).next("span");
		if(span){
			span.remove();
		}
		    }
	})
	
	
	
	//提交按钮返回false
	//培训地点为空时失去焦点添加span
			checkAddress.live("blur",function(){
				if(isEmpty($(this).val()))
				{
					var infoStr = "培训地点不能为空";
					var span = $(this).next("span");
					if(span)
					{
						span.remove();
					}
					$(this).after($("<span style='color: #FF0000; font-size: 12px;' ></span>").css("color", "#ff6600").html("<img  src='images/pic/empty.gif' class='img_align'></img> "+infoStr));
				}
				else{
					var span = $(this).next("span");
					if(span)
					{
						span.remove();
					}
				}
			})
	
		submitBtn.click(function(){
			checkDate_peixun=$(".checkDate_peixun");
			var mre=$("#year1").val();
			var isStop = false;
			if(mre=="year1"){
				alert("該年份已经制定过");
				return false;
			}
			//点击提交时弹出"请填写规范的身份证号码"
			if(employeeidCardNo.val()!=undefined){
			if(!isSubmitAlert)
			{
				if(!isIdentity(employeeidCardNo.val())){
					alert("请填写规范的身份证号码");
					employeeidCardNo.focus();
					isSubmitAlert = true;
					return false;
				}
			}
		}
			//点击提交时弹出"请填写规范的电话"
			if(employeephoneNo.val()!=undefined){
				if(!isSubmitAlert)
				{
					if(!isTellPhone(employeephoneNo.val())){
						alert("请填写规范的电话");
						employeephoneNo.focus();
						isSubmitAlert = true;
						return false;
					}
				}
			}
			
			
			//比较两个时间的先后
			var startDate = $("#startDate");
			//alert(startDate.val());
			var endDate = $("#endDate");
			
			//alert(endDate.val());
			//alert(startDate.val()<endDate.val());
			if(!isSubmitAlert){
			
			 if(startDate.val()!=undefined&&endDate.val()!=undefined&&endDate.val()!=""){
			if(startDate.val()>endDate.val()){
				alert("结束/离开时间应在开始/进入时间之后！");
				isSubmitAlert = true;
				return false;
			}
			}
			}
			 
			if(checkDate_peixun!=undefined){
				if(!isSubmitAlert){
					checkDate_peixun.each(function(i){
						var eachpeixun = checkDate_peixun.eq(i);
						if(eachpeixun.val()==""){
							alert("培训时间不能为空");
							eachpeixun.focus();
							isStop = true;
							return false;
						}
					});
					if(isStop)
					{
						isSubmitAlert = true;
						return false;
					}
				}
			}
			
			if(checkAddress!=undefined){
				if(!isSubmitAlert){
					checkAddress.each(function(i){
						var eachAddress = checkAddress.eq(i);
						if(eachAddress.val()==""){
							alert("培训地点不能为空");
							eachAddress.focus();
							isStop = true;
							return false;
						}
					});
					if(isStop)
					{
						isSubmitAlert = true;
						return false;
					}
				}
			}

		
		})
		
	
	
	
	// 显示相关的静态数据
//	var spanShow = {};
//	// 输入提示数组
//	spanShow.REMIND_MSG = {
//			employeeempSn:" ",
//			employeeempName:" ",
//			employeeidCardNo:" ",
//			employeephoneNo:" ",
//			recruitmentrecstyle:" ",
//			recruitmentbaserec:" ",
//			jobsjobsName:"",
//			employeeRaprapName:"",
//			trainingtraName:"",
//			traininglecture:"",
//			trainingtraNumber:"",
//			recruitmentrecstyle:"",
//			recruitmentrecno:"",
//			departmentdptName:""
//
//	};
//	// 前台校验失败提示信息
//	spanShow.ERROR_MSG = {
//			employeeempSn:"请输入员工号",
//			employeeempName:"请输入员工姓名",
//			employeeidCardNo:"请输入正确的身份证号",
//			employeephoneNo:"请输入有效的联系电话",
//			recruitmentrecstyle:"请输入需求类别",
//			recruitmentbaserec:"请输入基本要求",
//			jobsjobsName:"请输入职位名称",
//			employeeRaprapName:"请输入奖惩情况",
//			trainingtraName:"请输入培训名称",
//			traininglecture:"请输入讲师",
//			trainingtraNumber:"请输入培训人数（数字）",
//			recruitmentrecstyle:"请输入需求类别",
//			recruitmentrecno:"请输入需求人数（数字）",
//			departmentdptName:"请输入部门名称"
//	
//	};
//	
//	// 前台校验REG表达式
//	spanShow.REG_MSG = {
//			employeeempSn : /\S/,
//			employeeempName:/\S/,
//			employeeidCardNo: /^(\d{14}|\d{17})(\d|[xX])$/,
//			employeephoneNo:/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/,
//			recruitmentrecstyle:/\S/,
//			recruitmentbaserec:/\S/,
//			jobsjobsName:/\S/,
//			employeeRaprapName:/\S/,
//			trainingtraName:/\S/,
//			traininglecture:/\S/,
//			trainingtraNumber:/^[0-9]*$/,
//			recruitmentrecstyle:/\S/,
//			recruitmentrecno:/^[1-9]\d*$/,
//			departmentdptName:/\S/
//	};
//	// 输入信息提示函数
//	spanShow.remaining = function(obj) {
//	
//		$("#check" + obj).css("color", "#666666")
//				.html(spanShow.REMIND_MSG[obj]);
//	};
//	// 前台校验信息更新函数：空值
//	spanShow.inputNull = function(obj) {
//		$("#check" + obj).css("color", "#ff6600").html("<img  src='images/pic/empty.gif' class='img_align'></img> "+ "不能为空");
//	};
//	// 前台校验信息更新函数：格式错误
//	spanShow.erroring = function(obj) {
//		$("#check" + obj)
//				.css("color", "#ff6600")
//				.html("<img  src='images/pic/unchecked.gif' class='img_align'></img> " + spanShow.ERROR_MSG[obj]);
//	};
//	// 所有校验通过信息更新函数
//	spanShow.pass = function(obj) {
//		$("#check" + obj).html("<img  src='images/pic/checked.gif' class='img_align'></img> ");
//	};
////  前台校验
//	spanShow.check = function(name, value) {
//		if (value == '') {
//			spanShow.inputNull(name);
//			return;
//		}
//		 else {
//			if (spanShow.REG_MSG[name] != undefined) {
//				if (spanShow.REG_MSG[name].test(value)) {
//					if(name=="supplierinfo.supcname" || name=="supplierinfo.address" ||name=="supplierinfo.phone"||name=="supplierinfo.business"||name=="supplierinfo.quality"||name=="supplierinfo.tech"||name=="supplierinfo.obtain"||name=="supplierinfo.quamger"||name=="supplierinfo.award" ||name=="training.traNumber"){
//						serverCheck(name, value);
//					}
////					else{
////						spanShow.pass(name);
////					}
//				} else {
////					alert("!");
//					spanShow.erroring(name);
//				}
//			}
//		}
//	};
//	
////		判断是否符合正则表达式
//		spanShow.register = function() {
//			
//			var inputId = ["employeeempSn","employeeempName","employeeidCardNo","employeephoneNo","recruitmentrecstyle","recruitmentrecno","recruitmentbaserec","jobsjobsName","employeeRaprapName","trainingtraName","traininglecture","trainingtraNumber","recruitmentrecstyle","departmentdptName"];
//			for ( var i = 0; i < inputId.length; i++) {
//				
//				if (undefined!=$("#" + inputId[i]).val()&&!spanShow.REG_MSG[inputId[i]].test($("#" + inputId[i]).val())) {
//					spanShow.erroring(inputId[i]);
//					$("#"+inputId[i]).focus();
//					return false;
//				}
//				
//			}
//			return true;
//		}
//	
//	
	// 1.输入框获得焦点onfocus:
//	$(".itemname").focus(
//			function() {
//				$(this).addClass(
//						"box_onfocus");
//				spanShow.remaining($(this).attr("id"));
//			});
	// 2 失去焦点
//	$(".itemname").blur(function() {
//		$(this).toggleClass("box_onfocus");
//		spanShow.check($(this).attr("id"), $(this).val());
//		
//	});	
	//比较两个时间的先后
//	function daysBetween(DateOne,DateTwo)   
//	{    
//	    var neMonth = DateOne.substring(5,DateOne.lastIndexOf ('-'));   
//	    var neDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('-')+1);   
//	    var neYear = DateOne.substring(0,DateOne.indexOf ('-'));   
//	   
//	    var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('-'));   
//	    var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('-')+1);   
//	    var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('-'));   
//	   
//	    var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000);    
//	    return Math.abs(cha);   
//	} 


	//提交
	$("#SYS_SET").click(
			function() {
			
//		if (!spanShow.register()) {
//			
//			return false;
//		}
//		else if($("#employeesex").val()=='choose')
//		{
//			alert("请选择性别");
//			return false;
//		}
//		else if($("#d244").val()=='')
//		{
//			alert("请填写出生年月");
//			return false;
//		}
//		else if($("#dptName").val()=='choose')
//		{
//			alert("请选择部门单位");
//			return false;
//		}
//		else if($("#d2441").val()=='')
//		{
//			alert("请选择时间");
//			return false;
//		}
//		else if($("#employeestatus").val()=='choose')
//		{
//			alert("请选择状态");
//			return false;
//		}
//		else if($("#employeenature").val()=='choose')
//		{
//			alert("请选择员工性质");
//			return false;
//		}
//		else if($("#jobsName").val()=='choose')
//		{
//			alert("请选职位");
//			return false;
//		}
//		else if($("#employeeNameId_0").val()=='')
//		{
//			alert("请选择员工姓名");
//			return false;
//		}
//		else if($("#trainingexam").val()=='choose')
//		{
//			alert("请选择是否考试");
//			return false;
//		}
//		else if($("#departmentdptType").val()=='choose')
//		{
//			alert("请选择部门类别");
//			return false;
//		}
		
	});
});