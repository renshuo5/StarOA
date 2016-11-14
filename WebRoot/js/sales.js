function registerPre() {
	// 显示相关的静态数据
	var spanShow = {};
	// 输入提示数组
	spanShow.REMIND_MSG = {
			returnedcustomern:" ",
			returnedretid: " ",
			returnedsignper: " ",
			qualitymanager:"请输入主管 "
		   
	};
	// 前台校验失败提示信息
	spanShow.ERROR_MSG = {
			returnedcustomern:"请输入客户名称",
			returnedretid:"请输入退货日期",
			returnedsignper: "请输入出单人",
			qualitymanager:"请输入主管"
			
	};
	
	// 前台校验REG表达式
	spanShow.REG_MSG = {
			returnedcustomern  : /\S/,
			returnedretid: /\S/,
			returnedsignper:/\S/,
			qualitymanager:/\S/
//			
						 //  
	};
	// 输入信息提示函数
	spanShow.remaining = function(obj) {
		$("#check" + obj).css("color", "#666666")
				.html(spanShow.REMIND_MSG[obj]);
	};
	// 前台校验信息更新函数：空值
	spanShow.inputNull = function(obj) {
		$("#check" + obj).css("color", "#ff6600").html("<img  src='images/pic/empty.gif' class='img_align'></img> "+ "不能为空");
	};
	// 前台校验信息更新函数：格式错误
	spanShow.erroring = function(obj) {
		$("#check" + obj)
				.css("color", "#ff6600")
				.html("<img  src='images/pic/unchecked.gif' class='img_align'></img> " + spanShow.ERROR_MSG[obj]);
	};
	
	// 所有校验通过信息更新函数
	spanShow.pass = function(obj) {
		$("#check" + obj).html("<img  src='images/pic/checked.gif' class='img_align'></img> ");
	};
	
	//  前台校验
	spanShow.check = function(name, value) {
		if (value == '') {
			spanShow.inputNull(name);
			return;
		}
		 else {
			if (spanShow.REG_MSG[name] != undefined) {
				if (spanShow.REG_MSG[name].test(value)) {
					if(name=="supplierinfo.supcname" || name=="supplierinfo.address" ||name=="supplierinfo.phone"||name=="supplierinfo.business"||name=="supplierinfo.quality"||name=="supplierinfo.tech"||name=="supplierinfo.obtain"||name=="supplierinfo.quamger"||name=="supplierinfo.award" ){
						serverCheck(name, value);
					}
//					else{
//						spanShow.pass(name);
//					}
				} else {
					spanShow.erroring(name);
				}
			}
		}
	};
	

//	判断是否符合正则表达式
	spanShow.register = function() {
	 
		var inputId = ["returnedcustomern","returnedretid","returnedsignper","qualitymanager"];
		for ( var i = 0; i < inputId.length; i++) {
			
			if (undefined!=$("#" + inputId[i]).val()&&!spanShow.REG_MSG[inputId[i]].test($("#" + inputId[i]).val())) {
				spanShow.erroring(inputId[i]);
				$("#"+inputId[i]).focus();
				return false;
			}
			
		}
		return true;
	}


	
	
	
	
	$("#SYS_SET").click(
			function() {	
			  if (!spanShow.register()) {
				return false;
		}
		 return true;
	} 
			);
}