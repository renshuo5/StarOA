
$(document).ready(function() {

		window.setInterval(function(){ shuaxin()}, "10000");
	
	//$("#ddd").click(function (){
	// 直接把onclick事件写在了JS中
	function shuaxin() {
		params="values="+$("#meg").val(); 
		$.ajax( {
			type : "POST",
			url : "persons/Rasmessage1/rasmessage_checkFanhui.action",
			data : params,
			dataType:"JSON",
			success : function(data){
				data = eval("(" + data + ")");
				if("1"==data.meString.replace(/^\s*/, "").replace(/\s*$/, "")){
					$("#tip").html("");
					
				}
				else if("0"==data.meString.replace(/^\s*/, "").replace(/\s*$/, "")){
					
					$("#tip")
					.css("color", "#ff6600")
					.html("<img  src='images/pic/unchecked.gif' class='img_align'></img> " + "您有新消息");
				}
			}
		});
		

	}

	$("#d2442").blur(function (){
		if($("#2").val()!=""){
		params="values="+$("#2").val();
		$.ajax( {
			type : "POST",
			url : "persons/ytrainplanAjax/ytrainplanAjax_ajax.action",
			data : params,
			dataType:"JSON",
			success : function(data){
				data = eval("(" + data + ")");
				if("0"==data.result.replace(/^\s*/, "").replace(/\s*$/, "")){
					
					$("#mesg")
					.css("color", "#ff6600")
					.html("<img  src='images/pic/checked.gif' class='img_align'></img> " );
					$("#year1").val("");
				}
				else{
					
					$("#mesg")
					.css("color", "#ff6600")
					.html("<img  src='images/pic/unchecked.gif' class='img_align'></img> " + "已经制定过");
					$("#year1").val("year1");
				}
			}
		});}
	
	});
	
	$("#d2443").blur(function (){
		if($("#3").val()!=""){
		params="values="+$("#3").val();
		$.ajax( {
			type : "POST",
			url : "persons/RecruitmentAjax/RecruitmentAjax_ajax.action",
			data : params,
			dataType:"JSON",
			success : function(data){
				data = eval("(" + data + ")");
				if("0"==data.result.replace(/^\s*/, "").replace(/\s*$/, "")){
					
					$("#mesg")
					.css("color", "#ff6600")
					.html("<img  src='images/pic/checked.gif' class='img_align'></img> " );
					$("#year1").val("");
				}
				else{
					
					$("#mesg")
					.css("color", "#ff6600")
					.html("<img  src='images/pic/unchecked.gif' class='img_align'></img> " + "已经制定过");
					$("#year1").val("year1");
				}
			}
		});}
	
	});
	
});