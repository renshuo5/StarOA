function registerPre() {
	//判断是不是电话号码
    function isTellPhone(value){
    	var reg=RegExp(/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/);
    	if(!reg.test(value)){
    		return false;
    	}
    	return true;
    }
  //判断是否为英文字母。 
	function isEnglish(value){
		var reg=RegExp(/^[A-Za-z]+$/);
		if(!reg.test(value)){
			return false;
		}
		return true;
	}
  //判断是不是电话号码
	var phoneNo=$(".phoneNo");
	// 提交按钮
	var submitBtn = $("input[type='submit']");
	//判断是不是英文字母
	var checkEnglish=$(".checkEnglish");
	
	//判断是不是电话号码
	phoneNo.live("blur",function(){
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
	//判断是不是英文名字
	checkEnglish.live("blur",function(){
		if(!isEnglish($(this).val())){
			var infoStr ="输入的英文名称有误";
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
	submitBtn.click(function(){
		//点击提交的时候判断是不是英文
		if(checkEnglish.val()!=""){
		if(checkEnglish.val()!=undefined){
			
			if(!isSubmitAlert)
			{
				
				if(!isEnglish(checkEnglish.val())){
					alert("请填写英文或让英文名为空");
					checkEnglish.focus();
					isSubmitAlert = true;
					return false;
				}
			   
			}
		
		}
	}
		})
	// 显示相关的静态数据
//	var spanShow = {};
//	// 输入提示数组
//	spanShow.REMIND_MSG = {
//		supplierinfoaddress : " ",
//		supplierinfophone : " ",
//		supplierinfobusiness : " ",
//		supplierinfoquality : " ",
//		supplierinfotech : " ",
//		applicationn : "",
//		transactionn : "",
//		principaln : "",
//		num : " ",
//		uprice : " "
//		
//	};
//	// 前台校验失败提示信息
//	spanShow.ERROR_MSG = {
//		supplierinfoaddress : "输入的地址不够详细",
//		supplierinfophone : "不存在该格式的电话号码",
//		supplierinfobusiness : "请输入业务",
//		supplierinfoquality : "请输入质量",
//		supplierinfotech : "请输入技术",
//		applicationn : "请填写申请单位名称",
//		transactionn : "请填写经办人",
//		principaln : "请填写负责人",
//		num : "请输入数量（数字）",
//		uprice : "请输入单价（数字）"
//
//	};
//
//	// 前台校验REG表达式
//	spanShow.REG_MSG = {
//		supplierinfoaddress : /\S/,
//		supplierinfophone : /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/,
//		supplierinfobusiness : /\S/,
//		supplierinfoquality : /\S/,
//		supplierinfotech : /\S/,
//		applicationn : /\S/,
//		transactionn : /\S/,
//		principaln : /\S/,
//		num : /^[1-9]\d*$/,
//		uprice : /^[1-9]\d*$/
//	
//	//			
//	//  
//	};
//	// 输入信息提示函数
//	spanShow.remaining = function(obj) {
//		$("#check" + obj).css("color", "#666666")
//				.html(spanShow.REMIND_MSG[obj]);
//	};
//	// 前台校验信息更新函数：空值
//	spanShow.inputNull = function(obj) {
//		$("#check" + obj).css("color", "#ff6600").html(
//				"<img  src='images/pic/empty.gif' class='img_align'></img> "
//						+ "不能为空");
//	};
//	// 前台校验信息更新函数：格式错误
//	spanShow.erroring = function(obj) {
//		$("#check" + obj).css("color", "#ff6600").html(
//				"<img  src='images/pic/unchecked.gif' class='img_align'></img> "
//						+ spanShow.ERROR_MSG[obj]);
//	};
//
//	// 所有校验通过信息更新函数
//	spanShow.pass = function(obj) {
//		$("#check" + obj).html(
//				"<img  src='images/pic/checked.gif' class='img_align'></img> ");
//	};
//
//	// 前台校验
//	spanShow.check = function(name, value) {
//		if (value == '') {
//			spanShow.inputNull(name);
//			return;
//		} else {
//			if (spanShow.REG_MSG[name] != undefined) {
//				if (spanShow.REG_MSG[name].test(value)) {
//					if (name == "supplierinfo.supcname"
//							|| name == "supplierinfo.address"
//							|| name == "supplierinfo.phone"
//							|| name == "supplierinfo.business"
//							|| name == "supplierinfo.quality"
//							|| name == "supplierinfo.tech"
//							|| name == "supplierinfo.obtain"
//							|| name == "supplierinfo.quamger"
//							|| name == "supplierinfo.award") {
//						serverCheck(name, value);
//					}
//					// else{
//					// spanShow.pass(name);
//					// }
//				} else {
//					spanShow.erroring(name);
//				}
//			}
//		}
//	};
//
//	// 判断是否符合正则表达式
//	spanShow.register = function() {
//
//		var inputId = [ "supplierinfoaddress", "supplierinfophone",
//				"supplierinfobusiness", "supplierinfoquality",
//				"supplierinfotech", "applicationn", "transactionn",
//				"principaln", "num", "uprice","sparequaprolistsupplierinfosupcname" ];
//		for ( var i = 0; i < inputId.length; i++) {
//
//			if (undefined != $("#" + inputId[i]).val()
//					&& !spanShow.REG_MSG[inputId[i]].test($("#" + inputId[i])
//							.val())) {
//				spanShow.erroring(inputId[i]);
//				$("#" + inputId[i]).focus();
//				return false;
//			}
//
//		}
//		return true;
//	}
//
//	

	// 提交点击
	$(".frm_btn")
			.click(
					function() {
						//复选框
						var checkbox = $("input[type='checkbox']:visible");
						var isSelected = true;
						checkbox.each(function(i){
							var eachCheckBox = checkbox.eq(i);
//							alert(eachCheckBox.attr("checked"));
							if(eachCheckBox.attr("checked"))
							{
								isSelected = true;
							}
						});
						if(isSelected==false)
						{
							alert("属性至少选一个");
							checkbox.eq(0).focus();
							return false;
						}
						if ($("#supplierinfosupcname_C").val() == ""
								&& $("#supplierinfosupename_E").val() == "") {
							$("#checksupplierinfosupename").css("color",
									"#ff6600").html(
									"<img  src='images/pic/empty.gif' class='img_align'></img> "
											+ "请输入中文名或英文名");
							$("#supplierinfosupcname_C").focus();
							return false;
						} else if (($("#supplierinfosupcname_C").val() != "" || $(
								"#supplierinfosupename_E").val() != "")
								&& !spanShow.register())

						{
							$("#checksupplierinfosupename").html("");
							return false;
						}

						else if (!spanShow.register()) {

							return false;

						}

						return true;

					});

	$(".yes").click(function() {
		if (!spanShow.register()) {
			return false;
		}

		return true;
	});
	//add_spar.jsp中供应商必填校验
	$("#add_spar").click(function() {
		if ($("#quaprolistnameId").val()=="") {
			alert("请选择供应商！");
			return false;
		}

		return true;
	});
}