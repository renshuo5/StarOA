$(document).ready(function(){

    var nav_value = $("#nav").children("select");
    var menu_value = $("#menu").children("select");
    var item_value = $("#menuitem");
    var submit_on = $("input[type='submit']");
    var menuresource = $("input[id='menuresource']");
    var unmenuresource = $("input[id='unmenuresource']");
    
    /*
     * 提交时判断是否为菜单级资源
     */
    submit_on.click(function(){
    
        if (unmenuresource.attr("checked") == false &&menuresource.attr("checked")==false) {
        
            alert("请判断资源是否为菜单级的资源");
		  
            return false;
        }
        else {
            if (unmenuresource.attr("checked") == true) {
                if (nav_value.val() == '' || menu_value.val() == '' || item_value.val() == '') {
                    alert("请选择菜单级别");
                    
                    return false;
                                                                                                     
                }
            }
            
        }
        
        
        
        return true;
        
    });
    nav_value.change(function(){
    
        if (nav_value.val() == null) {
        
            return false;
        }
        else {
            $.ajax({
                type: "POST",
                async: false,
                url: "security/resourceAjax/resource_domenuAjax",
                data: "menunavid=" + nav_value.val(),
                dataType: "JSON",
                success: function(data){
                    data = eval("(" + data + ")");
                    if (data.menus.length != 0) {
                        $(".menuwhile").remove();
                        $(".itemmenuwhile").remove();
                        var menu = $("#menu");
                        for (var i = 0; i < data.menus.length; i++) {
                            menu.children("select").eq(0).append("<option class='menuwhile' value='" + data.menus[i].id + "'>" + data.menus[i].content + "</option>");
                        }
                    }
                    if (data.menus.length == 0) {
                        $(".menuwhile").remove();
                        $(".itemmenuwhile").remove();
                    }
                    
                }
                
            });
            
        }
        
        
    });
    
    menu_value.change(function(){
    
        if (menu_value.val() == null) {
            return false;
        }
        else {
        
            $.ajax({
                type: "POST",
                async: false,
                url: "security/resourceAjax/resource_doitemmenuAjax",
                data: "itemmenumenuid=" + menu_value.val(),
                dataType: "JSON",
                success: function(data){
                    data = eval("(" + data + ")");
                    if (data.itemMenus.length != 0) {
                        $(".itemmenuwhile").remove();
                        for (var i = 0; i < data.itemMenus.length; i++) {
                            $("#menuitem").append("<option class='itemmenuwhile' value='" + data.itemMenus[i].id + "'>" + data.itemMenus[i].content + "</option>");
                        }
                        
                    }
                    if (data.itemMenus.length == 0) {
                        $(".itemmenuwhile").remove();
                    }
                    
                }
                
            })
            
        }
        
    });
    
});


