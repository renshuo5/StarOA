
$(document).ready(function(){
	
	var submit_button=$("input[type='submit']");
	var cnum=$(".cnum");

	
	/**
	 * 校验编号是否冲突
	 */
	
	var isExist;//判断编号是否被使用
	
	   function ajaxdo(obj){
		   
		   $.ajax({
			   type: "POST",
			   url: "produce/produceschdulajax/produceschdul_ajaxDo",
			   data: "cnum="+obj.val(),
			   async: false,
			   dataType : "JSON",
			   success: function(data){
			   data = eval("(" + data + ")");
			      if("yes" == data.result.replace(/^\s*/, "").replace(/\s*$/,""))
			      {
			    	  //存在
			    	  isExist="yes"
			    	  $(".cnum").focus();
			    	  
			      }
			      if("no" == data.result.replace(/^\s*/, "").replace(/\s*$/,""))
			      {
			    	  //不存在
			    	  isExist="no"
                    
			      }
			    
			   }
			});
		   
	   };
	   
	   $(".cnum").blur(
			   function(){
				  
				   ajaxdo(cnum);
	          	 if(isExist=="no"){
	          		 $(".test1").remove();
	          		 $(".test2").remove();

	          		 
	        	    $(".cnum").after("<span style='color: blue; font-size: 12px;' class='test1'>该编号可以使用</span>");
	    	        return true;
			 
	    	       } 
	          if(isExist=="yes"){
	    		  $(".test1").remove();
          		  $(".test2").remove();
	    	      $(".cnum").after("<span style='color: #FF0000; font-size: 12px;' class='test2'>该编号已被使用</span>");
	    	      $(".cnum").focus();
	    	      return false;
		    }
	   
			   } );
	
	
	
	
	function isEmpty(obj){
		if(obj.val()==""){
		 return false;	
		}
		return true;
		
	};
	
	function isNum(obj){
		var reg=new RegExp(/^[0-9]*$/);
		if(reg.test(obj.val())){
		  return true;	
		}
		return false;
	}
	$(".checkNum_zjm").blur(

	function() {
	
		if(!isNum($(".checkNum_zjm"))){
			//alert("数量必须为整数");
			$(".test").remove();
			$(".checkNum_zjm").after("<span style='color: #FF0000; font-size: 12px;' class='test'>数量必须为整数</span>");
			return false;
		}
		if(isNum($(".checkNum_zjm"))){
			$(".test").remove();
		}

		return true;

	});
	
	/**
	 * 提交时校验是否为通过
	 */
	submit_button.click(
	  function(){
		  if(!isEmpty($(".checkNum_zjm"))){
			  
		      alert("数量不能为空");
		      $(".checkNum_zjm").focus();
		      return false;
		  }
		  if(isEmpty($(".checkNum_zjm"))){
			    
			  if(!isNum($(".checkNum_zjm"))){
				  alert("数量必须为整数");
				  $(".checkNum_zjm").focus();
					return false;
			  }
		  }
		  ajaxdo(cnum);
		  if(!isEmpty($(".cnum"))){
			alert("编号不能为空");  
			 $(".cnum").focus();
			return false;
			  
		  }
		  if(isEmpty($(".cnum")))
		  {
		  if(isExist=="yes"){
			  $(".test1").remove();
      		  $(".test2").remove();
    	      $(".cnum").after("<span style='color: #FF0000; font-size: 12px;' class='test2'>该编号已被使用</span>");
    	      alert("编号已被使用请重新输入");
    	      $(".cnum").focus();
    	      return false;
		   }
		  }
		 
		  return true;
	 
	  }
	
	)
		
	
})