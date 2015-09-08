<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String zhanweipath = request.getContextPath(); 
 	String zhanweibasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+zhanweipath+"/"; 
%>
<!-- 提交上位-->
        <div class="SubUp">
            <img src="resources/images/bg2.png" alt="背景" width="100%"/>
            <div class="SubUp0">
                <div class="SubUp1">
                    <img src="resources/images/tj2.png" alt="提交上位" width="100%"/>
                </div>
                <form id="form" action="zwSubmit" method="post">
                <div class="SubUp2">
                    <img src="resources/images/tj3.png" alt="提交上位" width="100%"/>
                    <div class="SubUp2Int">
                        <p>请输入昵称</p>
                        <input type="text" maxlength="4" name="name" required="required" id="name"/>
                    </div>
                </div>
                <div class="SubUp3">
	                    <img src="resources/images/tj4.png" alt="提交上位" width="100%"/>
	                    <div class="SubUp3Check">
	                        <p>请选择性别</p>
	                        <div class="SubUp3Check1">
	                            <div class="SubUp3Check2">
	                                <label for="radio_user01">
	                                    <input type="radio" name="sex" id="radio_user01" value="m">
	                                </label>
	                                <div class="SubUp3Check2M">
	                                    <img src="resources/images/man.png" alt="男" width="80%"/>
	                                </div>
	                            </div>
	                            <div class="SubUp3Check3">
	                                <label for="radio_user02">
	                                    <input type="radio" name="sex" id="radio_user02" value="w" checked="checked">
	                                </label>
	                                <div class="SubUp3Check3M">
	                                    <img src="resources/images/women.png" alt="女" width="80%"/>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                </div>
               </form>
                <div class="SubUp4">
                    <img src="resources/images/tj8.png" alt="提交上位" width="100%" class='UpBut'/>
                </div>
                <div class="SubUp5">
                    <img src="resources/images/tj6.png" alt="提交上位" width="100%"/>
                </div>
                <div class="SubUp6">
                    <img src="resources/images/tj7.png" alt="提交上位" width="100%"/>
                </div>
            </div>
        </div>
        
        <script>
        $(function(){
            $('.FotS_r').click(function(){
                //window.location.href='index.html';
                 $('.SubUp').show()
                window.FSHM.log('<%=zhanweibasePath%>',8);
            })
            $('.FotS2').click(function(){
	            $('.SubUp').show()
	            window.FSHM.log('<%=zhanweibasePath%>',7); /**男女版我要上头条*/
	        })
            $('.UpBut').click(function(){
                //window.location.href='index2.html';
                var name=$("#name").val();
                if($.trim(name)==""){
                	alert("昵称不能为空");
                	return;
                }
                $('.UpBut').unbind("click");
                var callbak=function(){
                	$("#form").submit();
                }
                window.FSHM.log("<%=zhanweibasePath%>",9,callbak);
            });
        })
        </script>