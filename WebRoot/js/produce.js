function registerPre() {
	// 显示相关的静态数据
	var spanShow = {};
	// 输入提示数组
	spanShow.REMIND_MSG = {
		preparationpresn : " ",
		discardproductionnumber : " ",
		discardproductionreason : " ",
		discardproductionlosetime : " ",
		discardproductionlosemoney : " "

	};
	// 前台校验失败提示信息
	spanShow.ERROR_MSG = {
		preparationpresn : "请输入编号",
		discardproductionnumber : "请输入数字"

	};

	// 前台校验REG表达式
	spanShow.REG_MSG = {
		preparationpresn : /\S/,
		discardproductionnumber : /^[0-9]*[1-9][0-9]*$/,
		discardproductionreason : /\S/,
		discardproductionlosetime : /\S/,
		discardproductionlosemoney : /\S/
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
		$("#check" + obj).css("color", "#ff6600").html(
				"<img  src='images/pic/empty.gif' class='img_align'></img> "
						+ "不能为空");
	};
	// 前台校验信息更新函数：格式错误
	spanShow.erroring = function(obj) {
		$("#check" + obj).css("color", "#ff6600").html(
				"<img  src='images/pic/unchecked.gif' class='img_align'></img> "
						+ spanShow.ERROR_MSG[obj]);
	};

	// 所有校验通过信息更新函数
	spanShow.pass = function(obj) {
		$("#check" + obj).html(
				"<img  src='images/pic/checked.gif' class='img_align'></img> ");
	};

	// 前台校验
	spanShow.check = function(name, value) {
		if (value == '') {
			spanShow.inputNull(name);
			return;
		} else {
			if (spanShow.REG_MSG[name] != undefined) {
				if (spanShow.REG_MSG[name].test(value)) {
					if (name == "supplierinfo.supcname"
							|| name == "supplierinfo.address"
							|| name == "supplierinfo.phone"
							|| name == "supplierinfo.business"
							|| name == "supplierinfo.quality"
							|| name == "supplierinfo.tech"
							|| name == "supplierinfo.obtain"
							|| name == "supplierinfo.quamger"
							|| name == "supplierinfo.award"
							|| "discardproduction.number") {
						serverCheck(name, value);
					}
					// else{
					// spanShow.pass(name);
					// }
				} else {
					spanShow.erroring(name);
				}
			}
		}
	};
	// add_preparation的部品名 后台校验
	$("#preparationpresn").change(function(){
		var id = $(this).attr("id");
		var inputData_preparation = $(this).val();
		params = "preparation.presn="+ inputData_preparation;
		$.ajax( {
			type : "POST",
			url : "produce/preparationajax/preparation_checkExistsByNO.action",
			data : params,
			dataType:"JSON",
			success : function(data){
				data = eval("(" + data + ")");
				if("1"==data.result.replace(/^\s*/, "").replace(/\s*$/, "")){
					spanShow.pass(id);
					exists = false;
					return true;
				}
				else{
					exists = true;
					$("#check" + id)
					.css("color", "#ff6600")
					.html("<img  src='images/pic/unchecked.gif' class='img_align'></img> " + "该编码已被使用");
				}
			}
		});
		return false;
	});
	// 判断是否符合正则表达式
	spanShow.register = function() {

		var inputId = [ "preparationpresn", "discardproductionnumber",
				"discardproductionreason", "discardproductionlosetime",
				"discardproductionlosemoney" ];
		for ( var i = 0; i < inputId.length; i++) {

			if (undefined != $("#" + inputId[i]).val()
					&& !spanShow.REG_MSG[inputId[i]].test($("#" + inputId[i])
							.val())) {
				spanShow.erroring(inputId[i]);
				$("#" + inputId[i]).focus();
				return false;
			}

		}
		return true;
	}

	

	$("#SYS_SET").click(function() {
		if (!spanShow.register()) {
			alert("请填写规范的信息！");
			return false;
		}
		return true;
	});
}