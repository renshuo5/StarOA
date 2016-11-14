function registerPre() {
	// 显示相关的静态数据
	var spanShow = {};
	// 输入提示数组
//	spanShow.REMIND_MSG = {
//			employeeempSn:" ",
//			employeeempName:" ",
//			employeeidCardNo:" ",
//			employeephoneN:" ",
//			recruitmentrecstyle:" ",
//			recruitmentbaserec:" ",
//			jobsjobsName:""
//
//	};
//	// 前台校验失败提示信息
//	spanShow.ERROR_MSG = {
//			employeeempSn:"请输入员工号",
//			employeeempName:"请输入员工姓名",
//			employeeidCardNo:"请输入正确的身份证号",
//			employeephoneN:"请输入有效的联系电话",
//			recruitmentrecstyle:"请输入需求类别",
//			recruitmentbaserec:"请输入基本要求",
//			jobsjobsName:"请输入职位名称"
//	
//	};
//	
//	// 前台校验REG表达式
//	spanShow.REG_MSG = {
//			employeeempSn : /\S/,
//			employeeempName:/\S/,
//			employeeidCardNo: /^(\d{14}|\d{17})(\d|[xX])$/,
//			employeephoneN:/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/,
//			recruitmentrecstyle:/\S/,
//			recruitmentbaserec:/\S/,
//			jobsjobsName:/\S/,
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
//					if(name=="supplierinfo.supcname" || name=="supplierinfo.address" ||name=="supplierinfo.phone"||name=="supplierinfo.business"||name=="supplierinfo.quality"||name=="supplierinfo.tech"||name=="supplierinfo.obtain"||name=="supplierinfo.quamger"||name=="supplierinfo.award" ){
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
//			var inputId = ["employeeempSn","employeeempName","employeeidCardNo","employeephoneN","recruitmentrecstyle","recruitmentbaserec","jobsjobsName"];
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
	
	
	// 1.输入框获得焦点onfocus:
	$(".itemname").focus(
			function() {
				$(this).addClass(
						"box_onfocus");
				spanShow.remaining($(this).attr("id"));
			});
	// 2 失去焦点
	$(".itemname").blur(function() {
		$(this).toggleClass("box_onfocus");
		spanShow.check($(this).attr("id"), $(this).val());
		
	});	
	
//	//提交
//	$("#SYS_SET").click(
//			function() {
//				//alert("start");
//		// alert("dingdong!");
//		if (!spanShow.register()) {
//			
//			return false;
//		}
//	});
}