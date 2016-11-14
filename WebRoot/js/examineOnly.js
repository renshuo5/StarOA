// JavaScript Document

$(document).ready(function() {

	examineEffect();

	// dom对象
		function examineEffect() {
			$(".examine").each(function(i, vi) {
				var flag = 0;
				var statusValue = $(vi).find("input[name=status]").val();
				$(vi).find("a").each(function(j, vj) {
					if (statusValue.charAt(j) == 1) {
						$(vj).addClass("examineGreen").focus(function() {
							this.blur();
							
							
				}).click(function() {
							return false;
						}).attr("onclick","").attr("title","已审核");
					} else if (statusValue.charAt(j) == 0) {
						if(flag==0){
							$(vj).addClass("examineRed").attr("title","待审核");
							flag=1;
						}else{
							$(vj).addClass("examineGray").focus(function() {
								this.blur();
								
							}).click(function() {
								return false;
							}).attr("title","等待上一步骤").attr("onclick","");
						}
					}
				});
			});
		}
	})
	