<%@ page language="java" import="java.util.*" contentType="text/html;charaset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>测试详情</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
	<meta http-equiv="pragma" content="no-cache">                          <!--这几句meta作用是清除浏览器中的缓存,再次进入曾经访问过的页面时，浏览器必须从服务端下载最新的内容，达到刷新的效果。 -->
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">      <!--最后两句meta,做seo用 -->
	<meta http-equiv="description" content="This is my page">
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">

  </head>
  
  <body>
    	<div class="row">
    		<div class="col-lg-4"></div>
    		<div class="col-lg-4" style="margin:5px">
	    		<h3>测试详情 </h3> 
	    		<div>
	    			<span>类型：<label style="color:#f3970a">${answer.testType}&nbsp</label></span>
	    			<br>
	    			<span>分数：<label style="color:red">${answer.mark}&nbsp</label></span>
	    			<br>
	    			<span>答题时间：<label>${answer.testTime}</label></span>
	    			<c:forEach items="${tDetail}" var="item" varStatus="status">
	    				<div>
	    					<p><label style="color:blue">题目${item.id}：</label>${item.question}</p>
	    					<p><label>A：</label>${item.a}</p>
	    					<p><label>B：</label>${item.b}</p>
	    					<p><label>C：</label>${item.c}</p>
	    					<p><label>D：</label>${item.d}</p>
	    					<c:if test="${!(empty item.e)}">
		    					<p><label>E：</label>${item.e}</p>
	    					</c:if>
	    					<p><span>正确答案：<label style="color:green">${item.answer}</label></span><span>&nbsp;&nbsp;我的选择：<label style="color:blue">${item.myAnswer}</label></span> 
	    					<c:if test="${'正确' eq item.status}">
	    						<span>&nbsp;&nbsp;<label style="color:green">${item.status}</label></span>
	    					</c:if>
	    					<c:if test="${'错误' eq item.status}">
	    						<span>&nbsp;&nbsp;结果：<label style="color:red">${item.status}</label></span>
	    					</c:if>
	    					</p>
	    				</div>
	    			</c:forEach>
	    			
	    		</div>
    		</div>
    		<div class="col-lg-4"></div>
    	</div>						
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
  </body>
</html>
