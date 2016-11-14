$(document).ready(function(){

    
    
    
	
    
    var navs = $("input[id*='nav']:not([id*='menu'])");
    var menus = $("input[id*='menu']:not([id*='item'])");
    var items = $("input[id*='item']:not([id*='resource'])");
    var resources = $("input[id*='resource']");
    
    function getChildren(obj){
    
        obj.each(function(j){
            var child = children.eq(j);
            if (nav.attr("checked") == true) {
                child.attr("checked", "checked");
            }
            else {
                child.removeAttr("checked");
            }
        });
    }
    
    navs.each(function(i){
        var nav = navs.eq(i);
        nav.change(function(){
            var thisId = $(this).attr("id");
            var children = $("input[id*='" + nav.attr("id") + "'][id!='" + nav.attr("id") + "']");
            children.each(function(j){
                var child = children.eq(j);
                if (nav.attr("checked") == true) {
                    child.attr("checked", "checked");
                }
                else {
                    child.removeAttr("checked");
                }
            });
        });
    });
    
    menus.each(function(i){
        var menu = menus.eq(i);
        menu.change(function(j){
            var thisId = $(this).attr("id");
            var children = $("input[id*='" + menu.attr("id") + "'][id!='" + menu.attr("id") + "']");
            children.each(function(j){
                var child = children.eq(j);
                if (menu.attr("checked") == true) {
                    child.attr("checked", "checked");
                    var parentNav = $("input[id='" + thisId.substring(0, thisId.indexOf("menu")) + "']");
                    parentNav.attr("checked", "checked");
                }
                else {
                    child.removeAttr("checked");
                    var parent = $("input[id='" + thisId.substring(0, thisId.indexOf("menu")) + "']");
                    doNode(parent);
                }
            });
        });
        
    });
    
    items.each(function(i){
        var item = items.eq(i);
        item.change(function(j){
            var thisId = $(this).attr("id");
            var children = $("input[id*='" + item.attr("id") + "'][id!='" + item.attr("id") + "']");
            children.each(function(j){
                var child = children.eq(j);
                if (item.attr("checked") == true) {
                    var parentMenu = $("input[id='" + thisId.substring(0, thisId.indexOf("item")) + "']");
                    var parentNav = $("input[id='" + thisId.substring(0, thisId.indexOf("menu")) + "']");
                    parentMenu.attr("checked", "checked");
                    parentNav.attr("checked", "checked");
                    child.attr("checked", "checked");
                }
                else {
                    child.removeAttr("checked");
                    var parent = $("input[id='" + thisId.substring(0, thisId.indexOf("item")) + "']");
                    doNode(parent);
                }
            });
        });
    });
    
    resources.each(function(i){
        var resource = resources.eq(i);
        resource.change(function(){
            var thisId = $(this).attr("id");
            var parentItem = $("input[id='" + thisId.substring(0, thisId.indexOf("resource")) + "']");
            var parentMenu = $("input[id='" + thisId.substring(0, thisId.indexOf("item")) + "']");
            var parentNav = $("input[id='" + thisId.substring(0, thisId.indexOf("menu")) + "']");
            if ($(this).attr("checked") == true) {
                parentItem.attr("checked", "checked");
                parentMenu.attr("checked", "checked");
                parentNav.attr("checked", "checked");
            }
            else {
                doNode(parentItem);
            }
        });
    });
    
    function doNode(node){
        var thisId = node.attr("id");
        var children = $("input[id*='" + thisId + "'][id!=" + thisId + "]");
        var isAllUnchecked = true;
        children.each(function(i){
            if (children.eq(i).attr("checked") == true) {
                isAllUnchecked = false;
            }
        });
        if (isAllUnchecked) {
            node.removeAttr("checked");
        }
        var isExistMenu = thisId.indexOf("menu") >= 0;
        if (isExistMenu) {
            var type = "";
            if (thisId.indexOf("item") >= 0) {
                type = "item";
            }
            else 
                if (thisId.indexOf("menu") >= 0) {
                    type = "menu";
                }
            var parent = $("input[id='" + thisId.substring(0, thisId.indexOf(type)) + "']");
            doNode(parent);
        }
        //		alert("type = "+type);
        //		alert("thisId.indexOf(type) = "+thisId.indexOf(type));
        //		alert("thisId.substring(0,thisId.indexOf(type)) = "+thisId.substring(0,thisId.indexOf(type)));
        //		alert("input[id='"+thisId.substring(0,thisId.indexOf(type))+"']");
    }
    
    
});
