function registerPre() {
	// 显示相关的静态数据
	var spanShow = {};
	// 输入提示数组
	spanShow.REMIND_MSG = {
			feedexaminesupplier : " ",
			feedexamineorderno: " ",	
			feedexaminefeebuyer:" "	,
			requisitioncompany:"请输入单位",
			requisitiondptmanager:"请输入部门负责人",
			requisitionpickingper:"请输入领料人",
			auxmaterialunit:"请输入单位",
			auxmaterialuprice:"请输入价格",
			rewindersuplyu:"请输入供货单位"
				

	};
	// 前台校验失败提示信息
	spanShow.ERROR_MSG = {
			feedexaminesupplier : "请输入供应商名",
			feedexamineorderno: "请输入订单号",	
			feedexaminefeebuyer:"请输入采购",
			requisitioncompany:"请输入单位",
			requisitiondptmanager:"请输入部门负责人",
			requisitiondptmanager:"请输入领料人",
			auxmaterialunit:"请输入单位",
			auxmaterialuprice:"请输入价格",
			rewindersuplyu:"请输入供货单位"
	
	};
	
	// 前台校验REG表达式
	spanShow.REG_MSG = {
			feedexaminesupplier : /\S/,
			feedexamineorderno : /\S/,
			feedexaminefeebuyer:/\S/ ,
			requisitioncompany:/\S/,
			requisitiondptmanager:/\S/,
			requisitionpickingper:/\S/,
			auxmaterialunit:/\S/,
			auxmaterialuprice:/\S/,
			rewindersuplyu:/\S/
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
//					alert("!");
					spanShow.erroring(name);
				}
			}
		}
	};
	
//		判断是否符合正则表达式
		spanShow.register = function() {
			
			var inputId = ["feedexaminesupplier","feedexamineorderno","feedexaminefeebuyer","requisitioncompany","requisitiondptmanager","requisitionpickingper","auxmaterialunit","auxmaterialuprice","rewindersuplyu"];
			for ( var i = 0; i < inputId.length; i++) {
				
				if (undefined!=$("#" + inputId[i]).val()&&!spanShow.REG_MSG[inputId[i]].test($("#" + inputId[i]).val())) {
					spanShow.erroring(inputId[i]);
					$("#"+inputId[i]).focus();
					return false;
				}
				
			}
			return true;
		}
	
	
	
	
	//提交
	$("#SYS_SET").click(
			function() {
				//alert("start");
		// alert("dingdong!");
		if (!spanShow.register()) {
			
			return false;
		}
		
		else if($("#rewindersuplyu").val()=='choose')
		{
			alert("请选择供货单位");
			return false;
			
		}
		else if($("#d244").val()=='')
		{
			alert("请选择日期");
			return false;
		}
		
		else if($("#rewinderrewinspectorempId").val()=='choose')
		{
			alert("请选择检验");
			return false;
		}
		else if($("#quaprolistnameId").val()=='')
		{
			alert("请选择供应商");
			return false;
		}
//		else if($("#itemnameId").val()=='')
//		{
//			alert("请选择品名");
//			return false;
//		}
//		else if($("#itemtypenameId").val()=='')
//		{
//			alert("请选择材料代码");
//			return false;
//		}
	});
}