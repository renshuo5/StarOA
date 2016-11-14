function getItemTypeStock(id)
{
	var result;
	params = "itemType.id=" + id;
	$.ajax( {
		type : "POST",
		url : "itemType/itemtypeverify/itemType_getStonum.action",
		data : params,
		dataType:"JSON",
		async: false,
		success : function(data){
			data = eval("(" + data + ")");
			result = data.result;
		}
	});
	return result;
}
//获得上批结存
function getLastSurplus(supsendmId,itemTypeId)
{
	var result;
	params = "itemType.id=" + itemTypeId+"&supsendmId="+supsendmId;
	$.ajax( {
		type : "POST",
		url : "itemType/itemtypeverify/itemType_getLastSurplus.action",
		data : params,
		dataType:"JSON",
		async: false,
		success : function(data){
			data = eval("(" + data + ")");
			result = data.result;
		}
	});
	alert("result = "+result);
	return result;
}
/*$(document).ready(function(){
	var itemTypeId = $("input[name='itemtypeid']").val();
	$(".stonum").val(getItemTypeStock(itemTypeId));
});*/