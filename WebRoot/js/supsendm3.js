$(document).ready(function(){
	$(".confirmLabel").hide();
	var cons = $("input[name='controllerunitInfos']");
	var frontDate = $("#d244_0");
	var backDate = $("#d244_2_0");
	var dptName = $("#supsendm3dptName");
	var confirmBtns = $("input[name='confirmBtns']");
	var allConfirmBtn = $("#allConfirm");
	showTime(frontDate,backDate);
	showConInfos(cons);
	selectWorkshop(dptName);
	eachConfirm(confirmBtns);
	
	/*for(var i=0;i<confirmBtns.length;i++)
	{
		$(confirmBtns[i]).click(function(){
			alert("hello");
		});
	}
	*/
	/*
	 * var cons = $("input[name='cons']");
	for(var i=0;i<cons.length;i++)
	{
		var con = $(cons[i]);
		var select = con.next("select");
		var options = select.children("option");
		for(var j=0;j<options.length;j++)
		{
			var option = $(options[j]);
			if(option.val()==con.val())
			option.attr("selected","selected");
		}
	}
	 */
	/*
	 * //要货数量
	var needNum = $("#needNum").val();
	var itemTypeIds = $("input[name='itemTypeIds']");
	//控制器信息
	var controllerunitInfos = $("input[name='controllerunitInfos']");
	//单机
	var singlesets = $("input[name='singlesets']");
	//须发数量
	var needNums = $("input[name='needNums']");
	//实发数量
	var pracNums = $("input[name='pracNums']");
	for(var i=0;i<itemTypeIds.length;i++)
	{
		var itemType = $(itemTypeIds[i]);
		//如果该行的itemType有选
		if(itemType.val()!=undefined&&itemType.val()!=""){
			$(needNums[i]).val(needNum);
		}
	}
	 */
	function showTime(frontDate,backDate)
	{
		if(backDate.val()!=undefined&&backDate.val()!="")
		{
			var strings = backDate.val().split("-");
			frontDate.val(strings[0]+"年"+strings[1]+"月"+strings[2]+"日");
		}
	}
	function showConInfos(cons)
	{
		for(var i=0;i<cons.length;i++)
		{
			var con = $(cons[i]);
			var input = con.next("input");
			var result;
			switch (con.val()) {
			case "parallelport": result = "并口";break;
			case "parportU": result = "并口+U";break;
			case "serialoparport": result = "并口|串口";break;
			case "serialaparport": result = "并口+串口";break;
			case "parportethpot": result = "并口+网口";break;
			case "ip090k": result = "IP090K（并口）";break;
			case "ip690k": result = "IP690K（并口）";break;
			}
			input.val(result);
		}
	}
	function selectWorkshop(dptName)
	{
		var select = dptName.next("select");
		var options = select.children("option");
		for(var i=0;i<options.length;i++)
		{
			var option = $(options[i]);
			if(option.val()==dptName.val())
			{
				option.attr("selected","selected");
			}
		}
	}
	function eachConfirm(confirmBtns)
	{
		confirmBtns.each(function(){
			var btn = $(this);
			btn.click(function(){
				var label = btn.next("label");
				btn.hide();
				label.show();
				label.next("input").val(1);
			});
		});
	}
	allConfirmBtn.click(function(){
		confirmBtns.each(function(){
			var btn = $(this);
			var label = btn.next("label");
			btn.hide();
			label.show();
			label.next("input").val(1);
		});
	});
});
