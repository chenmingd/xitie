/*
 页面快捷方法
 */

//获取URL上参数
$.getUrlParam = function (name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}
//异步请求loading
$.showloading = {
    htmls : function(){//组织HTML
        var htmls  = '<div class="loading-bg"></div><div class="loading"><span></span></div>';
        $("body").append(htmls);
    },
    show : function(){
        var _this=this;
        _this.htmls();
        $(".loading-bg").css('display',"block");
        $(".loading").css('display',"block");
    },
    close : function(){
        $(".loading-bg").remove();
        $(".loading").remove();
    }
};
//操作状态提示
$.showstatus = function (str){
    var htmls  = '<div class="showtatus">'+ str +'</div>';
    $("body").append(htmls);
    $(".showtatus").css('display',"block");
    var zw = $(".showtatus").width();
    $(".showtatus").css("margin-left",-zw/2);
    setTimeout(function(){
        $(".showtatus").remove();
    }, 1000);
};
/*
 NAME:页面公共JS
 TIME:JZY by 2015.3.21
 */
$(function(){
    function tpl(){
        this.init = function(){
            var bar_len = $('.bar a').size();
            index();
            fuyan();
        };
        //首页
        function index(){
        	 var info = dd;
            // console.log('info',info);
             document.title=info.wedding_title;

             $('.share-imgURL img').attr('src',info.share_img);

             //结婚照片
             $('.wedding-photo').attr('src',info.wedding_img);
             //新郎新娘
             $('.groom_name').html(info.groom_name);
             $('.bride_name').html(info.bride_name);
             //喜宴时间
             $('.wedding-time').html(info.dt_name+': <span>'+info.dt_day+'</span>');
             //宴会地址
             $('.wedding-addr').html(info.address_name+': <span>'+info.hotel_name+'</span>');
             //致宾客
             $('.wedding-declarations').html(info.declarations);

             //相册
             album(info.album_img);
             //地址
             addre(info.lat,info.lng,info.wedding_title,info.hotel_name,info.hotel_detail);
             //音频
             audioFun(info.music);
             /*
            $.ajax({
                url: 'resources/data/data.json',
                type: 'post',
                dataType: 'json',
                beforeSend: function(){$.showloading.show();},
                success : function(data){

                        var info = dd;
                        console.log('info',info);
                        document.title=info.wedding_title;

                        $('.share-imgURL img').attr('src',info.share_img);

                        //结婚照片
                        $('.wedding-photo').attr('src',info.wedding_img);
                        //新郎新娘
                        $('.groom_name').html(info.groom_name);
                        $('.bride_name').html(info.bride_name);
                        //喜宴时间
                        $('.wedding-time').html(info.dt_name+': <span>'+info.dt_day+'</span>');
                        //宴会地址
                        $('.wedding-addr').html(info.address_name+': <span>'+info.hotel_name+'</span>');
                        //致宾客
                        $('.wedding-declarations').html(info.declarations);

                        //相册
                        album(info.album_img);
                        //地址
                        addre(info.lat,info.lng,info.wedding_title,info.hotel_name);
                        //音频
                        audioFun(info.music);


                },
                complete: function(){$.showloading.close();}
            });
            */
        };
        //相册
        function album(data){
            if($.isArray(data) && data.length > 0){
                var html ='',
                    len = data.length;
                $.each(data,function(index,item){
                    var s = index + 1;
                    html += '<li class="list-item">';
                    html += '<a href="'+ item['src'] +'" class="list-item">';
                    html += '<img class="page-img" src="'+ item['src'] +'" alt="'+s+'/'+len+'" />';
                    html += '</a></li>';
                });
                $('#Gallery').html(html).imagesLoaded(function() {
                    window.setTimeout(function(){
                        var options = {
                            autoResize: true,
                            container: $('#album-con'),
                            offset: 4,
                            itemWidth: 150
                        };
                        var handler = $('#Gallery li');
                        // Call the layout function.
                        handler.wookmark(options);
                    },66);
                });
                var PhotoSwipe = window.Code.PhotoSwipe;
                var options = {loop:false}, instance = PhotoSwipe.attach( window.document.querySelectorAll('#Gallery a'), options);
            }
        };
        //地址
        function addre(lat,lng,title,address,detail){
            var lat = lat,
                lng = lng,
                name = title,
                address = address,
                w=$(window).width(),
                h=$(window).height();
            /* $('#allmap').width(w);
             $('#allmap').height(h); */

            // 百度地图API功能
            var map = new BMap.Map("allmap");
            var point=new BMap.Point(lng, lat);
            map.centerAndZoom(point, 15);
            var marker1 = new BMap.Marker(point);  // 创建标注
            //创建信息窗口
            var opts={
                width : 200,     // 信息窗口宽度
                height: 120,     // 信息窗口高度
                title : address , // 信息窗口标题
                enableMessage:false,//设置允许信息窗发送短息
                //message:address
            };
            var infoWindow = new BMap.InfoWindow(detail+"<br/><a style='color:blue' href='http://map.baidu.com/mobile/webapp/search/search/qt=s&wd="+address+"/?third_party=uri_api'>一键导航</a>",opts);  // 创建信息窗口对象
            map.addOverlay(marker1);
            map.openInfoWindow(infoWindow,point); //开启信息窗口
        };
        //赴宴
        function fuyan(){
            $("#submit_join").on("click",function(){
                var guest_type = $('#guest_type').val(),
                    name = $("#join_name").val(),
                    mobile = $("#join_mobile").val(),
                    nums= parseInt($("#join_nums").val()),
                    benison= $("#join_benison").val(),
                    hascla = $(this).hasClass('del'),
                    status = false;

                if(name != '' && mobile != '' && !isNaN(nums) && parseInt(nums) > 0){
                    if(hascla){
                        status = false;
                        $.showstatus("您已经提交过信息！");
                    }else{
                        status = true;
                    }

                }else if(name == ""){
                    status = false;
                    $.showstatus("姓名不能为空！");
                }else if(mobile == ""){
                    status = false;
                    $.showstatus("电话不能为空！");
                }else if(isNaN(nums) || parseInt(nums) <= 0){
                    status = false;
                    $.showstatus("请填写赴宴人数！");
                }

                if(status){
                    $.ajax({
                        url: 'add',
                        type: 'post',
                        dataType: 'json',
                        data: {'name':name,'tel':mobile,'ps':nums,'note':benison,'type':guest_type},
                        beforeSend: function(){$.showloading.show();},
                        complete: function(){$.showloading.close();},
                        success : function(data){
                            if(data.ret==0){
                                $.showstatus("赴宴信息提交成功");
                                $("#submit_join").addClass('del');
                            }else{
                                $.showstatus(data.msg);
                            }
                        }
                    });
                }
            });
        };


        //音频加载
        function audioFun(src){

            if(src){
                var but = $("#audio_btn"),
                    audioObj = $("#media");
                audioObj.attr('src',src);

                but.addClass('video_exist');

                audioObj.bind('canplay', function(event) {
                    audioObj.get(0).play();
                    but.removeClass("off").addClass("play_yinfu");
                    $("#yinfu").addClass("rotate");
                });
                but.click(function() {
                    $(this).hasClass("off") ? ($(this).addClass("play_yinfu").removeClass("off"), $("#yinfu").addClass("rotate"), audioObj.get(0).play()) : ($(this).addClass("off").removeClass("play_yinfu"), $("#yinfu").removeClass("rotate"), audioObj.get(0).pause())
                })

            }else{
                $('#audio_btn').remove();
            }
        };
    };
    var t = new tpl();
    t.init();
});