(function(){
	
	
	var referrer =document.referrer;
	if(!referrer){referrer="";}else{referrer=encodeURIComponent(referrer);}
    function FSHMLog(url,type,callbak){
        var search=window.location.search.substr(1);
        var img=new Image();
        if(search && search.length>0){
        	img.src=url+"/hm.gif?type="+type+"&"+search+"&referrer="+referrer+"&tt="+new Date().getTime();
        }else{
        	img.src=url+"/hm.gif?type="+type+"&"+search+"&referrer="+referrer+"&tt="+new Date().getTime()+"&query="+encodeURIComponent(search);
        }
        img.onload=function(){
            img=null;
            if(callbak)callbak();
        }
    }
    window.FSHM={};
    window.FSHM.log=FSHMLog;
})()