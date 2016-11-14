// JavaScript Document

	var areaCount=1;
	//记录实际表格行数
	var rowCount=1;
$(document).ready(function() {
	//删除模板html
	//表格行模板
	if($("#tb tr").length-2>0){
    			rowCount = $("#tb tr").length-1;
    			areaCount = $("#tb tr").length-1;
    		
            //隐藏模板tr
            $("#tb tr").eq(1).hide();
            
            $("#BtDel").click(function() {
                $("#tb tr:gt(2)").each(function() {
                    if ($(this).find("#CK").get(0).checked == true) {
                        $(this).remove();
                    }
                });
                i = 0;
                $("#tb tr:gt(2)").each(function() {
                    $(this).find("td").get(0).innerHTML = ++i;
                });
                $("#CKA").attr("checked", false);
            });
            $("#CKA").click(function() {
                $("#tb tr:gt(2)").each(function() {
                    $(this).find("#CK").get(0).checked = $("#CKA").get(0).checked;
                });
            });
        }
});



var addRowTemplete= "";
$(function(){
        //首先取出需要克隆的模板，模板行<tr>id为rowTemplete_0
	addRowTemplete=  $("#rowTemplete_0").html();
});

//增加行
function addBatchRow(obj){
	var templete = $("<tr id='rowTemplete_"+areaCount+"'></tr>");//这里的$相当于构造出一个<tr id='rowTemplete_"+areaCount+"'></tr>

	//递增序号，替换掉tr或者td中存在[0]、_0或者(0)防止id相同,这么设计主要是为了后台取值时方便
	templete = templete.append(addRowTemplete.replace(/\[0\]/g,"["+areaCount+"]").replace(/_0/g,"_"+areaCount).replace(/=0/g,"="+areaCount).
	replace("processStat(\"0\")","processStat("+areaCount+")"));
	
	//找到最后一条存在的行,在其后拼接一行
	
/*	for(var i=areaCount-1;i>=0;i--){
		if($("#rowTemplete_"+i).length>0){ 
			$("#rowTemplete_"+i).after(templete.append(delRowTemplete));
		break;
		}
	}
	*/
	$(obj).parents("tr").after(templete);
	//计数加一
	areaCount++; rowCount++;
	return false;
}

//删除行
function deleteBatchRow(obj){
	if(rowCount>1) {
	$(obj).parents("tr").remove(); 
	rowCount--;
	} else alert("至少保留一行");//如果全部删除了，那么也就没有办法再添加行了，模板行也被删了呀
	return false;
}
//删除行
function deleteBatchRow1(obj,row1){
	if(row1>1) {
	$(obj).parents("tr").remove(); 
	row1--;
	} else alert("至少保留一行");//如果全部删除了，那么也就没有办法再添加行了，模板行也被删了呀
	return false;
}
//删除行
function deleteBatchRow2(obj){
	if(rowCount>0) {
	$(obj).parents("tr").remove(); 
	rowCount--;
	}//如果全部删除了，那么也就没有办法再添加行了，模板行也被删了呀
	return false;
}
//取得条数
function getAreaCount(){
return rowCount;
}
