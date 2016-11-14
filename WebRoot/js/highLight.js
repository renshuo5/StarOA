// JavaScript Document
/**
 *	用于鼠标移过 ID为list的table的tr时 高亮
 *
 **/
//var goldBgColor;
$(document).ready(function(){
	$(".list tr").mouseover(function(){
		//goldBgColor = $(this).css("background-color");
		$(this).css("background-color","#CECECE");
	});
	$(".list tr").mouseout(function(){
		$(this).css("background-color","");
	});
});