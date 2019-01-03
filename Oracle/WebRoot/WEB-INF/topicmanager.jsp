<%@ page language="java" import="java.util.*"
	contentType="text/html;charaset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'usermanager.jsp' starting page</title>

<title>Oracle 做题平台</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<!--这几句meta作用是清除浏览器中的缓存,再次进入曾经访问过的页面时，浏览器必须从服务端下载最新的内容，达到刷新的效果。 -->
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<!--最后两句meta,做seo用 -->
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="favicon.ico" rel="shortcut icon">
<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

<!-- Data Tables -->
<link href="css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<link href="css/animate.min.css" rel="stylesheet">
<link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
<style>
.close-btn {
	width: 20px;
	height: 20px;
	font-size: 18px;
	text-align: center;
	position: absolute;
	right: 0px;
	background: #584a4a;
	border-radius: 6px;
	color: #fff;
	cursor: pointer;
}

.close-btn:focus,.close-btn:hover {
	color: #dad4d1;
	text-decoration: underline;
}
</style>
</head>

<body class="gray-bg">



	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>题库</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i> </a> <a
								class="close-link"> <i class="fa fa-times"></i> </a>
						</div>
					</div>
					<div class="ibox-content">
						<a class="btn btn-primary btn-outline" onclick="Insert()">添加</a> <a
							class="btn btn-primary btn-outline" onclick="InsertMore()">批量添加</a>
						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>题目</th>
									<th>选项A</th>
									<th>选项B</th>
									<th>选项C</th>
									<th>选项D</th>
									<th>选项E</th>
									<th>答案</th>
									<th>题目类型</th>
									<th>题目分类</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${oracles}" var="item" varStatus="status">
									<tr id='oc_${item.id}' class="gradeA">
										<td>${item.question}</td>
										<td>${item.a}</td>
										<td>${item.b}</td>
										<td>${item.c}</td>
										<td>${item.d}</td>
										<td>${item.e}</td>
										<td>${item.answer}</td>
										<td>${item.type}</td>
										<td>${item.category}</td>
										<td width="10%">
											<center>
												<a class="btn btn-success btn-outline delbtn"
													href="javascript:;" data-id="${item.id}">删除</a> 
													
													<a
													class="btn btn-warning btn-outline editbtn"
													href="javascript:;"
													data-id="${item.id}" data-q="${item.question}" data-a="${item.a}"
													data-b="${item.b}" data-c="${item.c}" data-d="${item.d}"
													data-e="${item.e}" data-answer="${item.answer}"
													data-type="${item.type}" data-ca="${item.category}"
													>修改</a>
											</center></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- add  start-->
	<div id="dlg"
		style=" width: 600px;position: fixed;left: 83px;top: 25px;display:none;"
		closed="true" buttons="#dlg-buttons">
		<a class="close-btn">X</a>
		<form id="fm" method="post" action="oracle!add.action"
			style="margin: 0;padding: 20px 50px; background: #eee; border-radius: 10px;">
			<div
				style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">新增题目</div>
			<div style="margin-bottom:10px">
				<label>题目:</label>
				<textarea type="text" name="entity.question" id="question"
					required="true" style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案A:</label>
				<textarea type="text" name="entity.a" id="a" required="true"
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案B:</label>
				<textarea type="text" name="entity.b" id="b" required="true"
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案C:</label>
				<textarea type="text" name="entity.c" id="c" required="true"
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案D:</label>
				<textarea type="text" name="entity.d" id="d" required="true"
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案E:</label>
				<textarea type="text" name="entity.e" id="e" 
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案:</label> <input type="text" name="entity.answer"
					id="answer" required="true" style="width:100%"></input>
			</div>
			<div style="margin-bottom:10px">
				<label>题目类型:</label> <input type="text" name="entity.type" id="type"
					required="true" style="width:100%"></input>
			</div>
			<div style="margin-bottom:10px">
				<label>题目分类:</label> <input type="text" name="entity.category"
					id="category" required="true" style="width:100%"></input>
			</div>
			<input type="hidden" id="uid" /> <input type="submit" value="保存">
		</form>
	</div>
	<!-- add  end-->
	<!-- edit  start-->
	<div id="dlg_edit"
		style=" width: 600px;position: fixed;left: 83px;top: 25px;display:none;"
		closed="true" buttons="#dlg-buttons">
		<a class="close-btn">X</a>
		<form id="fm_edit" method="post" action="oracle!edit.action"
			style="margin: 0;padding: 20px 50px; background: #eee; border-radius: 10px;">
			<div
				style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">新增题目</div>
			<div style="margin-bottom:10px">
				<label>题目:</label>
				<textarea type="text" name="entity.question" id="question"
					required="true" style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案A:</label>
				<textarea type="text" name="entity.a" id="a" required="true"
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案B:</label>
				<textarea type="text" name="entity.b" id="b" required="true"
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案C:</label>
				<textarea type="text" name="entity.c" id="c" required="true"
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案D:</label>
				<textarea type="text" name="entity.d" id="d" required="true"
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案E:</label>
				<textarea type="text" name="entity.e" id="e"
					style="width:100%"></textarea>
			</div>
			<div style="margin-bottom:10px">
				<label>答案:</label> <input type="text" name="entity.answer"
					id="answer" required="true" style="width:100%"></input>
			</div>
			<div style="margin-bottom:10px">
				<label>题目类型:</label> <input type="text" name="entity.type" id="type"
					required="true" style="width:100%"></input>
			</div>
			<div style="margin-bottom:10px">
				<label>题目分类:</label> <input type="text" name="entity.category"
					id="category" required="true" style="width:100%"></input>
			</div>
			<input type="hidden" name="entity.id" id="id"/> <input type="submit" value="保存">
		</form>
	</div>
	<!-- edit  end-->
	<!-- addmore start-->
	<div id="dlg_addmore"
		style=" width: 350px;position: fixed;left: 83px;top: 25px;display:none;"
		closed="true" buttons="#dlg-buttons">
		<a class="close-btn">X</a>
		<form name="uploadForm" method="POST" enctype="multipart/form-data"
			action="oracle!addByExcel.action"
			style="margin: 0;padding: 20px 50px; background: #eee; border-radius: 10px;height:200px">
			选择excle文件 ：<input type="file" name="qExcel" /> <br> <input
				type="submit" name="submit" value="提交"> <br> <input
				type="reset" name="reset" value="重置">
		</form>
	</div>
	<!-- addmore end -->
	<!-- delete start -->
	<div id="del" style="display:none">
		<form id="del_fm" method="post" action="oracle!del.action">
			<input name="entity.id" id="del_id" value="" />
		</form>
	</div>
	<!-- delete end -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/plugins/jeditable/jquery.jeditable.js"></script>
	<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script src="js/content.min.js?v=1.0.0"></script>
	<script>
        $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("http://www.zi-han.net/theme/example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
   		//删除按钮
        $(".delbtn").click(function(){
        	$("#del_id").val(this.dataset.id);
        	$("#del_fm").submit();
        });
        //添加按钮
        function Insert(){
            $('#dlg').show();	                            
        } 
       	//批量添加按钮
        function InsertMore(){
            $('#dlg_addmore').show();	                            
        } 
        //close btn
        $(".close-btn").click(function(){
        	$(this).parent().hide();
        });
        //修改
        $(".editbtn").click(function(){
        	$edform = $("#fm_edit");
        	$edform.find("#question").val($(this).data("q"));
        	$edform.find("#a").val($(this).data("a"));
        	$edform.find("#b").val($(this).data("b"));
        	$edform.find("#c").val($(this).data("c"));
        	$edform.find("#d").val($(this).data("d"));
        	$edform.find("#e").val($(this).data("e"));
        	$edform.find("#answer").val($(this).data("answer"));
        	$edform.find("#type").val($(this).data("type"));
        	$edform.find("#category").val($(this).data("ca"));
        	$edform.find("#id").val($(this).data("id"));
        	$("#dlg_edit").show();
        	
        });
    </script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>

