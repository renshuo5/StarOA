// JavaScript Document

$(document).ready(function() {

	examineEffect();

	// dom对象
		function examineEffect() {
			$(".examine").each(function(i, vi) {
				var statusValue = $(vi).find("input[name=status]").val();
				$(vi).find("a").each(function(j, vj) {
					if (statusValue.charAt(j) == 1) {
						$(vj).addClass("examineGreen").focus(function() {
							this.blur();
						}).click(function() {
							return false;
						}).find("span").attr("title","已审核");
					} else if (statusValue.charAt(j) == 0) {
						$(vj).addClass("examineRed").find("span").attr("title","未审核");
					}
				});
			});
		}
	})
