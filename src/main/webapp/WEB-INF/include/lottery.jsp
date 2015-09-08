<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<input type="hidden" id="awardId" value="">
<!--一等奖-->
<div class="BomboxBg1">
    <img src="resources/images/bg.png" alt="背景" width="100%" height="100%"/>
    <div class="Bombox">
        <div class="Bombox1">
            <img src="resources/images/1dengjiang1.png" alt="奖项" width="100%"/>
        </div>
        <div class="Bombox2">
            <img src="resources/images/1dengjiang2.png" alt="奖项" width="100%"/>
            <div class="BomboxInt">
                <p>姓名:</p>
                <input type="text" id="name1"/>
            </div>
        </div>
        <div class="Bombox3">
            <img src="resources/images/1dengjiang3.png" alt="奖项" width="100%"/>
            <div class="BomboxInt">
                <p>手机号:</p>
                <input type="tel" id="phone1"/>
            </div>
        </div>
        <div class="Bombox4">
            <img src="resources/images/1dengjiang4.png" alt="奖项" width="100%"/>
            <div class="BomboxInt">
                <p>地址:</p>
                <input type="text" id="address1"/>
            </div>
            <div id="Bombox4But1" class="Bombox4But" style="width: 10.75rem;left: 35%;bottom: 23%">
                <img src="resources/images/dwtj.png" alt="点我提交" width="100%"/>
            </div>
            <div class="BomboxP">
            	<p>TIPS:每人每天三次机会</p>
            </div>
        </div>
    </div>
</div>
<!--二等奖-->
<div class="BomboxBg2">
    <img src="resources/images/bg.png" alt="背景" width="100%"/>
    <div class="Bombox">
        <div class="Bombox1">
            <img src="resources/images/2dengjiang1.png" alt="奖项" width="100%"/>
        </div>
        <div class="Bombox2">
            <img src="resources/images/2dengjiang2.png" alt="奖项" width="100%" style="z-index: 1"/>
            <div class="BomboxInt">
                <p>姓名:</p>
                <input type="text" id="name2"/>
            </div>
        </div>
        <div class="Bombox3">
            <img src="resources/images/2dengjiang3.png" alt="奖项" width="100%"/>
            <div class="BomboxInt">
                <p>手机号:</p>
                <input type="tel" id="phone2"/>
            </div>
        </div>
        <div class="Bombox4">
            <img src="resources/images/2dengjiang4.png" alt="奖项" width="100%"/>
            <div id="Bombox4But2" class="Bombox4But">
                <img src="resources/images/dwtj.png" alt="点我提交" width="100%"/>
            </div>
            <div class="BomboxP">
                <p>TIPS:每人每天三次机会</p>
            </div>
        </div>
    </div>
</div>
<!-- 三等奖-->
<div id="BomboxBg3" class="BomboxBg3">
    <img src="resources/images/bg.png" alt="背景" width="100%"/>
    <div class="Bombox">
        <div class="Bombox1">
            <img src="resources/images/3dengjiang1.png" alt="奖项" width="100%"/>
        </div>
        <div class="Bombox2">
            <img src="resources/images/3dengjiang2.png" alt="奖项" width="100%"/>
            <div id="Bombox2But2" class="Bombox2But2">
                <img src="resources/images/dwlq.png" alt="点我领取" width="100%"/>
            </div>
            <div class="BomboxP">
                <p>TIPS:每人每天三次机会</p>
            </div>
        </div>
    </div>
</div>
<!-- 没中奖-->
<div id="BomboxBg4" class="BomboxBg4">
    <img src="resources/images/bg.png" alt="背景" width="100%"/>
    <div class="Bombox">
       <img alt="未中奖" src="resources/images/no_award.png" width="90%" style="margin:0 auto;" id="no_award">
    </div>
</div>

<div class="Share">
    <img src="resources/images/fenxiang2.jpg" alt="分享" width="100%"/>
</div>
<script>
    $(function() {
    	
    	function luckDraw(){
    		$(".LuckDraw").unbind("click")
    		$.ajax({
				type: "GET",
				url: "lottery/award",
				dataType: "json",
				success: function(data) {
					$(".LuckDraw").bind("click",luckDraw)
					var type = data.type;
					if (type == "1") {
						$("#awardId").val(data.id);
						$(".BomboxBg1").show();
					} else if (type == "2") {
						$("#awardId").val(data.id);
						$(".BomboxBg2").show();
					} else if (type == "3") {
						$("#awardId").val(data.id);
						$(".BomboxBg3").show();
					} else if (type == "10") {
						alert("每人每天三次抽奖机会！");
					} else {
						//alert("很遗憾您本次没有中奖，请重新来过！");
						$(".BomboxBg4").show();
					}
					
					var userLotteryCount = data.userLotteryCount;
					if (userLotteryCount >= 3) {
						$(".LuckDraw").unbind("click");
						$(".LuckDraw").attr("src", "resources/images/pub/gg.png").removeClass("LuckDraw");
					}
				},
				error: function(data) {
					$(".LuckDraw").bind("click",luckDraw)
					alert("请求错误！");
				}
			});  
    	}
    	$(".LuckDraw").bind("click",luckDraw)
    	/*
    	$(".LuckDraw").bind("click", function() {
			$.ajax({
				type: "GET",
				url: "lottery/award",
				dataType: "json",
				success: function(data) {
					var type = data.type;
					if (type == "1") {
						$("#awardId").val(data.id);
						$(".BomboxBg1").show();
					} else if (type == "2") {
						$("#awardId").val(data.id);
						$(".BomboxBg2").show();
					} else if (type == "3") {
						$("#awardId").val(data.id);
						$(".BomboxBg3").show();
					} else if (type == "10") {
						alert("每人每天三次抽奖机会！");
					} else {
						//alert("很遗憾您本次没有中奖，请重新来过！");
						$(".BomboxBg4").show();
					}
					
					var userLotteryCount = data.userLotteryCount;
					if (userLotteryCount >= 3) {
						$(".LuckDraw").unbind("click");
						$(".LuckDraw").attr("src", "resources/images/pub/gg.png").removeClass("LuckDraw");
					}
				},
				error: function(data) {
					alert("请求错误！");
				}
			});        
    	});
    	*/
    	$("#no_award").bind("click", function() {
    		$(".BomboxBg4").hide();
    	});
    	$("#Bombox4But1").bind("click", function() {
    		var name = $.trim($("#name1").val());
    		if (name == "") {
    			alert("姓名不能为空");
    			return;
    		}
    		var phone = $.trim($("#phone1").val());
    		if (phone == "") {
    			alert("电话不能为空");
    			return;
    		}
    		var address = $.trim($("#address1").val());
    		if (address == "") {
    			alert("地址不能为空");
    			return;
    		}
    		var user = {"name": name, "address": address, "phone": phone};
    		$.ajax({
				type: "GET",
				url: "lottery/getAward",
				data: {"id": $("#awardId").val(),"name": name, "address": address, "phone": phone},
				dataType: "json",
				success: function(data) {
					alert("领取成功");
					$(".BomboxBg1").hide();
				},
				error: function(data) {
					alert("领取失败！");
					$(".BomboxBg1").hide();
				}
			});  
    	});
    	$("#Bombox4But2").bind("click", function() {
    		var name = $.trim($("#name2").val());
    		if (name == "") {
    			alert("姓名不能为空");
    			return;
    		}
    		var phone = $.trim($("#phone2").val());
    		if (phone == "") {
    			alert("电话不能为空");
    			return;
    		}
    		var user = {"name": name, "phone": phone};
    		$.ajax({
				type: "GET",
				url: "lottery/getAward",
				data: {"id": $("#awardId").val(), "name": name, "phone": phone},
				dataType: "json",
				success: function(data) {
					alert("领取成功");
					$(".BomboxBg2").hide();
				},
				error: function(data) {
					alert("领取失败！");
					$(".BomboxBg2").hide();
				}
			});  
    	});
        
        dzb1('.FotS_f','.Share')
        function dzb1(a,b,c){
            $(a).click(function(){
                $(b).show()
            })
        }
        dzb2('.Share','.Share')
        function dzb2(a,b,c){
            $(a).click(function(){
                $(b).hide()
            })
        }
    })
</script>