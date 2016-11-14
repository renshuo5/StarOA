// JavaScript Document
//用于在table中，令ID为list，使得奇偶行异色
$(document).ready(function(){
		$(".list tr:odd").addClass("oddRow");
		$(".list tr:even").addClass("evenRow");
});