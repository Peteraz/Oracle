<%@ page language="java" import="java.util.*" contentType="text/html;charaset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人资料</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
	<meta http-equiv="pragma" content="no-cache">                          <!--这几句meta作用是清除浏览器中的缓存,再次进入曾经访问过的页面时，浏览器必须从服务端下载最新的内容，达到刷新的效果。 -->
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">      <!--最后两句meta,做seo用 -->
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link href="favicon.ico" rel="shortcut icon"> 
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="js/plugins/layer/skin/layer.css" id="layui_layer_skinlayercss" rel="stylesheet">
  </head>
  
  <body>
    	<div class="row">
    		<div class="col-lg-4"></div>
    		<div class="col-lg-4">
	    		<h1>个人资料 </h1> 
    			<div class="form-group"><span class="control-span">用户编号：<label class="control-label">${user.id}</label></span></div>
    			<div class="form-group"><span>登录名：<label>${user.username}</label></span></div>
    			<div class="form-group"><span>登录密码：<label>********</label><a href="#" data-id="${user.id}" id="change_pw">&nbsp;修改</a></span></div>
    			<div class="form-group"><span>联系电话：<label>${user.phone}</label></span></div>
    			<div class="form-group"><span>用户类型：<label>${user.userType}</label></span></div>
    			<div class="form-group" ><span>用户学习进度：<label>${user.type}</label></span></div>
    		</div>
    		<div class="col-lg-4"></div>
    	</div>						
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/plugins/layer/layer.min.js"></script>
    <script src="js/content.min.js?v=1.0.0"></script>
    <script src="js/demo/layer-demo.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <script type="text/javascript">
    $("#change_pw").click(function(){
    	var uid = $(this).data("id");
    	parent.layer.prompt({title:"输入新密码"},function(val, index){
  			layer.msg("修改中");
  			$.post("user!changePw.action",{id:uid, npw:val},function(res){
  				res=="true"?layer.msg("修改成功"):layer.msg("修改失败");
 	 			parent.layer.close(index);
  				window.location.reload();
  			});
		 });
    })
                     
    </script>
  </body>
</html>
