function registerPre() {
	// 显示相关的静态数据
	var exist=false;
	var spanShow = {};
	// 输入提示数组
	spanShow.REMIND_MSG = {
			resourcename : " ",
			resourcevalue : " ",
			rolename :"请输入角色名",
			username :"请输入新添加的用户名",
			password :"请设定6位以上的密码",
			roleDescription :"  ",
			newPassword:"请输入6位以上新密码",
			
	};
	// 前台校验失败提示信息
	spanShow.ERROR_MSG = {
			resourcename : "  ",
			resourcevalue : "  ",
			rolename :"请输入角色名",
			username :"请输入新添加的用户名", 
			password :"密码过于简短"	,
			newPassword:"密码过于简短",
			
	};
	
	// 前台校验REG表达式
	spanShow.REG_MSG = {
			resourcename : /\S/ ,
			resourcevalue : /\S/, 
			rolename : /\S/,
			username : /\S/,
			password : /\S{6,}/,
			roleName :/\S/,
			newPassword: /\S{6,}/,
			
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
		//alert("erer");
		$("#check" + obj).html("<img  src='images/pic/checked.gif' class='img_align'></img> ");
	};
	//前台校验
	spanShow.check = function(name, value) {
		//alert("name = "+name);
		if (value == '') {
			spanShow.inputNull(name);
			return; alert("!!");
		}
		 else {
			
			if (spanShow.REG_MSG[name] != undefined) {
				if (spanShow.REG_MSG[name].test(value)) {
					
					if(name=="username"){
						serverCheck(name, value);
					}else{
						spanShow.pass(name);
					}
				} else {
					spanShow.erroring(name);
				}
			}
		}
	};
	
	// add_item的部品名 后台校验
	function serverCheck(id, value) {
		var userName= $("#username").attr("value");
		params = "userName=" + userName;
		$.ajax( {
			type : "JSON",
			url : "user/userverify/user_verify.action",
			data : params,
			success : function(data){
			    data = eval("(" + data + ")");
				if("ok"==data.result.replace(/^\s*/, "").replace(/\s*$/, "")){
					//alert("ok");
					exist=false;
					spanShow.pass(username);
				}
				else{
					
					exist=true;
					$("#check" + id)
					.css("color", "#ff6600")
					.html(
							"<img  src='images/pic/unchecked.gif' class='img_align'></img> " + data.result);
				}
			}
		});

	}
	
	//判断是否与正则表达式相符
	spanShow.register = function() {
		//alert("dd");
		var inputId = [ "resourcename","resourcevalue","rolename","username","password","newPassword"];
		for ( var i = 0; i < inputId.length; i++) {
			if (undefined!=$("#" + inputId[i]).val()&&!spanShow.REG_MSG[inputId[i]].test($("#" + inputId[i]).val())&&exist) {
				spanShow.erroring(inputId[i]);
				$("#" + inputId[i]).focus();
				return false;
			}
		}
		if ($("#newPassword").val() != $("#newPasswordagain").val()) {
		spanShow.erroring("newPasswordagain");
		$("#newPasswordagain").focus();
		alert("两次输入的密码不一致！");
		return false;
	}
	return true;
	
}

	
	
	
	//注册
	$(".frm_btn").click(
			function() {
		if (!spanShow.register()) {
			
			return false;
		}
		
	});
}

