// JavaScript Document
//用于在table中，令ID为list，使得奇偶行异色
$(document).ready(function(){
		$(".addTable td:even").addClass("textRight");
		$(".addTable td:odd").addClass("textLeft");
});