
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
.close-btn:focus, .close-btn:hover {
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
						<h5>用户</h5>

						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i> <!-- 收起 表单 -->
							</a> <a class="close-link"> <!-- 关闭 表单 --> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content">
						<a class="btn btn-primary btn-outline" onclick="Insert()">添加</a>
						<table
							class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>用户名</th>
									<th>密码</th>
									<th>电话</th>
									<th>用户类型</th>
									<th>用户学习进度</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${users}" var="item" varStatus="status">
									<tr id='us_${item.id}'>
										<td>${item.username}</td>
										<td>${item.password}</td>
										<td>${item.phone}</td>
										<td>${item.userType}</td>
										<td>${item.type}</td>
										<td width="10%">
											<center>
												<a class="btn btn-success btn-outline delbtn"
													href="javascript:;" data-id="${item.id}">删除</a>
												<a class="btn btn-warning btn-outline editbtn"
													href="javascript:;" data-name="${item.username}"
													data-pw="${item.password}" data-ph="${item.phone}"
													data-utype="${item.userType}" data-type="${item.type}"
													data-id="${item.id}">修改</a>
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
	<div id="dlg"
		style=" width: 400px;position: fixed;left: 483px;top: 225px;display:none;"
		closed="true" buttons="#dlg-buttons">
		<a class="close-btn">X</a>
		<form id="fm" method="post" action="user!add.action"
			style="margin: 0;padding: 20px 50px; background: #eee; border-radius: 10px;">
			<div
				style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息</div>
			<div style="margin-bottom:10px">
				<label>账号:</label> <input type="text" name="entity.username"
					id="username" required="true" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<label>密码:</label> <input type="text" name="entity.password"
					id="password" required="true" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<label>电话:</label> <input type="text" name="entity.phone" id="phone"
					required="true" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<label>用户类型:</label> <input type="text" name="entity.userType"
					id="usertype" required="true" style="width:100%">
			</div>
			<input type="hidden" id="uid" /> <input type="submit" value="保存">
		</form>
	</div>

	<div id="del" style="display:none">
		<form id="del_fm" method="post" action="user!del.action">
			<input name="entity.id" id="del_id" value="" />
		</form>
	</div>

	<div id="editdlg"
		style=" width: 400px;position: fixed;left: 483px;top: 225px;display:none;"
		closed="true" buttons="#dlg-buttons">
		<a class="close-btn">X</a>
		<form id="editfm" method="post" action="user!edit.action"
			style="margin: 0;padding: 20px 50px; background: #eee; border-radius: 10px;">
			<div
				style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">用户信息</div>
			<div style="margin-bottom:10px">
				<label>账号:</label> <input type="text" name="entity.username"
					id="username" required="true" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<label>密码:</label> <input type="text" name="entity.password"
					id="password" required="true" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<label>电话:</label> <input type="text" name="entity.phone" id="phone"
					required="true" style="width:100%">
			</div>
			<div style="margin-bottom:10px">
				<label>用户类型:</label> <input type="text" name="entity.userType"
					id="usertype" required="true" style="width:100%">
			</div>
			<input type="hidden" name="entity.type" id="type" /> <input
				type="hidden" name="entity.id" id="id" /> <input type="submit"
				value="保存">
		</form>
	</div>
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/jquery-ui-1.10.4.min.js"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/plugins/jeditable/jquery.jeditable.js"></script>
	<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script src="js/content.min.js?v=1.0.0"></script>
	<script src="js/plugins/layer/layer.min.js"></script>
	<script>
        $(document).ready(function(){$(".dataTables-example").dataTable();var oTable=$("#editable").dataTable();oTable.$("td").editable("http://www.zi-han.net/theme/example_ajax.php",{"callback":function(sValue,y){var aPos=oTable.fnGetPosition(this);oTable.fnUpdate(sValue,aPos[0],aPos[1])},"submitdata":function(value,settings){return{"row_id":this.parentNode.getAttribute("id"),"column":oTable.fnGetPosition(this)[2]}},"width":"90%","height":"100%"})});function fnClickAddRow(){$("#editable").dataTable().fnAddData(["Custom row","New row","New row","New row","New row"])};
        //添加按钮
        function Insert(){
              $('#dlg').show();	                            
        } 
		//删除按钮
        $(".delbtn").click(function(){
        	$("#del_id").val(this.dataset.id);
        	$("#del_fm").submit();
        });
        $(".editbtn").click(function(){
        	var editfm = $("#editfm");
        	editfm.find("#username").val(this.dataset.name);
        	editfm.find("#password").val(this.dataset.pw);
        	editfm.find("#phone").val(this.dataset.ph);
        	editfm.find("#usertype").val(this.dataset.utype);
        	editfm.find("#type").val(this.dataset.type);
        	editfm.find("#id").val(this.dataset.id);
        	$("#editdlg").show();
        	//$("#del_fm").submit();
        });
        //close btn
        $(".close-btn").click(function(){
        	$(this).parent().hide();
        });
    </script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

</body>
</html>
