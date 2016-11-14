function registerPre() {
	var exists = false;
	// 显示相关的静态数据
	var spanShow = {};
	// 输入提示数组
	spanShow.REMIND_MSG = {
			itemNameId : "",
			itemTypename:"",
			itemTypemCode:"",
			itemTypebondedNo:""
	};
	// 前台校验失败提示信息
	spanShow.ERROR_MSG = {
			itemNameId : "请输入部品名",
			itemTypename:"请添输入合法的规格型号",
			itemTypemCode:"请输入合法的材料代码",
			itemTypebondedNo:"保税号格式为数字"
	};
	// 前台校验REG表达式
	spanShow.REG_MSG = {
			itemNameId : /\S/ ,
			itemTypename:/\S/ ,
			itemTypemCode:/\S/,
			itemTypebondedNo:/^[0-9]*$/
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
	
	//选“否”时，收起保税号输入框
	$(".need_hide").show();
	$(".no_hide").show();
	$("#checkitemTypebondedNo").show();   
	    $("#itemTypebondedNo").focus(
			function() {
				$(this).addClass(
						"box_onfocus");
				spanShow.remaining($(this).attr("id"));
			});
	    $("#itemTypebondedNo").blur(function() {
		       $(this).toggleClass("box_onfocus");
		       spanShow.check($(this).attr("id"), $(this).val());
			   var s = "";
	});
	 
	$("SELECT[name=itemType.isbonded]").change(function(){
		$(".need_hide").toggle("slow");
		$("#checkitemTypebondedNo").toggle("slow");
	});
	$("SELECT[name=itemType.isCon]").change(function(){
		$(".no_hide").toggle("slow");
	});
	
	//edit打开时是否隐藏
	
	if($(".baosui").val()=="0"||$(".baosui").val()==undefined||$(".baosui").val()==null|$(".baosui").val()==""){
		$("#itemTypebondedNo").hide();
		$("#isBonded option[name='noBonded']").attr("selected","selected");
	}
	else $("#itemTypebondedNo").show();
	if($(".kongzhi").val()=="0"||$(".kongzhi").val()==undefined||$(".kongzhi").val()==null||$(".kongzhi").val()==""){
		$("#itemTypecontrollerunit").hide();
		$("#isCon option[name='noCon']").attr("selected","selected");
	}
	else $("#itemTypecontrollerunit").show();
	// add_item的部品名 前台校验
	function checkItemNameEmpty(){
		var itemname = $("#itemname");
		return itemname.val()==undefined||itemname.val()=="";
	}
	function checkItemExists(){
		var itemname = $("#itemname");
		var id = itemname.attr("id");
		var inputData = itemname.val();
		if(itemname.next("span"))
		{
			var span = itemname.next("span");
			span.remove();
		}
		params = "itemName=" + inputData;
		$.ajax( {
			type : "POST",
			url : "item/itemverify/item_verify.action",
			data : params,
			async: false,
			dataType:"JSON",
			success : function(data){
				data = eval("(" + data + ")");
				if("ok"==data.result.replace(/^\s*/, "").replace(/\s*$/, "")){
					spanShow.pass(id);
					exists = false;
					return true;
				}
				else{
					if(itemname.next("span"))
					{
						var span = itemname.next("span");
						span.remove();
					}
					exists = true;
					itemname.after($("<span  id='checkitemname' style='color: #FF0000; font-size: 12px;' ></span>")
					.css("color", "#ff6600")
					.html("<img  src='images/pic/unchecked.gif' class='img_align'></img> " + data.result));
					return false;
				}
			}
		});
	}
	$("#itemname").blur(function(){
		
		if(!checkItemNameEmpty())
		{
			checkItemExists();
		}
	});
	$("#additem").click(function(){
		if(exists)
		{
			alert("部品名已经存在");
			$("#itemname").focus();
			return false;
		}
	});
	spanShow.check = function(name, value) {
		if (value == '') {
			spanShow.inputNull(name);
			return;
		}
		 else {
			if (spanShow.REG_MSG[name] != undefined) {
				if (spanShow.REG_MSG[name].test(value)) {
					if(name=="itemname"){
//						alert(serverCheck(name, value));
						if(serverCheck(name, value))
						{
							return true;
						}
						else
						{
							return false;
						}
					}
					else{
						spanShow.pass(name);
					}
				} else {
					spanShow.erroring(name);
				}
			}
		}
	};
	
	//注册
	spanShow.register = function() {
		//alert("dd");
		var inputId = [ "itemNameId","itemTypename" ,"itemTypemCode","itemTypebondedNo"];
		for ( var i = 0; i < inputId.length; i++) {
			if (undefined!=$("#" + inputId[i]).val()&&(exists||!spanShow.REG_MSG[inputId[i]].test($("#" + inputId[i]).val()))) {
				spanShow.erroring(inputId[i]);
				$("#" + inputId[i]).focus();
				return false;
			}
			
		}
		
		if(!spanShow.REG_MSG["itemTypebondedNo"].test($("#itemTypebondedNo") .val())){
			//alert("qq");
			spanShow.erroring("itemTypebondedNo");
			$("#itemTypebondedNo").focus();
			return false;
		}
		 return true;
	};
	
	$("#itemIdId").change(function(){
		alert("hello");
	});
}
