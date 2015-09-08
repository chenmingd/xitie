(function($){
   
    var $loading=$('<div style="width: 100%;height: 100%;position: fixed;left:0;top:0;background-color: rgba(0,0,0,.4);z-index:10000;">'+
					'<img src="resources/images/load.gif" style="display: block;position: absolute;left: 50%;top: 32%;margin-left: -30px;">'+
				 '</div>');
    $.showLoading=function(){
    	$('body').append($loading);
    }
    $.removeLoading=function(){
    	$loading.remove();
    }
    
})(jQuery)