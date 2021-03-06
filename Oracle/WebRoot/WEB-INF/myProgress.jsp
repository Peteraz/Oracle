<%@ page language="java" import="java.util.*"
	contentType="text/html;charaset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>我的进阶状态</title>

<link rel="stylesheet" href="css/style.css" />
<style type="text/css">
h2.top_title {
	border-bottom: none;
	background: none;
	text-align: center;
	line-height: 32px;
	font-size: 20px
}

h2.top_title span {
	font-size: 12px;
	color: #666;
	font-weight: 500
}
</style>
</head>

<body>
	<h2 class="top_title">
		<a>我的进阶状态</a>
	</h2>
	<section id="cd-timeline" class="cd-container">
		<%-- 		<c:forEach items="${myProgress}" var="item" varStatus="status">
			<div class="cd-timeline-block">
				<c:if test="${item.isPass==1}">
					<div class="cd-timeline-img cd-picture">
						<img src="img/cd-icon-picture.svg" alt="Picture">
					</div>
					<div class="cd-timeline-content">
						<h2>${item.category}</h2>
						<p>这里关于该阶段的文字描述</p>
						<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
						<span class="cd-date">${item.createTime}</span>
					</div>
				</c:if>
				<c:if test="${item.isPass==0}">
					<div class="cd-timeline-img cd-movie">
						<img src="img/cd-icon-movie.svg" alt="Picture">
					</div>
					<div class="cd-timeline-content">
						<h2>${item.category}</h2>
						<p>这里关于该阶段的文字描述</p>
						<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
						<span class="cd-date">未达成</span>
					</div>
				</c:if>
			</div>-
	</c:forEach> --%>

		<!-- level 1 s-->
		<div class="cd-timeline-block">
			<c:if test="${myProgress[0].isPass==1}">
				<div class="cd-timeline-img cd-picture">
					<img src="img/cd-icon-picture.svg" alt="Picture">
				</div>
				<div class="cd-timeline-content">
					<h2>${myProgress[0].category}</h2>
					<p>基础</p>
					<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
					<span class="cd-date">${myProgress[0].createTime}</span>
				</div>
			</c:if>
			<c:if test="${myProgress[0]==null}">
				<div class="cd-timeline-img cd-movie">
					<img src="img/cd-icon-movie.svg" alt="Picture">
				</div>
				<div class="cd-timeline-content">
					<h2>Level 1</h2>
					<p>基础</p>
					<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
					<span class="cd-date">未达成</span>
				</div>
			</c:if>
		</div>
		
		<!-- level 1 e-->
		<!-- level 2 s-->
		<div class="cd-timeline-block">
			<c:if test="${myProgress[1].isPass==1}">
				<div class="cd-timeline-img cd-picture">
					<img src="img/cd-icon-picture.svg" alt="Picture">
				</div>
				<div class="cd-timeline-content">
					<h2>${myProgress[1].category}</h2>
					<p>体系结构</p>
					<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
					<span class="cd-date">${myProgress[1].createTime}</span>
				</div>
			</c:if>
			<c:if test="${myProgress[1]==null}">
				<div class="cd-timeline-img cd-movie">
					<img src="img/cd-icon-movie.svg" alt="Picture">
				</div>
				<div class="cd-timeline-content">
					<h2>Level 2</h2>
					<p>体系结构</p>
					<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
					<span class="cd-date">未达成</span>
				</div>
			</c:if>
		</div>
		
		<!-- level 2 e-->
		<!-- level 3 s-->
		<div class="cd-timeline-block">
			<c:if test="${myProgress[2].isPass==1}">
				<div class="cd-timeline-img cd-picture">
					<img src="img/cd-icon-picture.svg" alt="Picture">
				</div>
				<div class="cd-timeline-content">
					<h2>${myProgress[2].category}</h2>
					<p>管理</p>
					<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
					<span class="cd-date">${myProgress[2].createTime}</span>
				</div>
			</c:if>
			<c:if test="${myProgress[2]==null}">
				<div class="cd-timeline-img cd-movie">
					<img src="img/cd-icon-movie.svg" alt="Picture">
				</div>
				<div class="cd-timeline-content">
					<h2>Level 3</h2>
					<p>管理</p>
					<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
					<span class="cd-date">未达成</span>
				</div>
			</c:if>
		</div>
		
		<!-- level 3 e-->
		<!-- level 4 s-->
		<div class="cd-timeline-block">
			<c:if test="${myProgress[3].isPass==1}">
				<div class="cd-timeline-img cd-picture">
					<img src="img/cd-icon-picture.svg" alt="Picture">
				</div>
				<div class="cd-timeline-content">
					<h2>${myProgress[3].category}</h2>
					<p>应用开发</p>
					<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
					<span class="cd-date">${myProgress[3].createTime}</span>
				</div>
			</c:if>
			<c:if test="${myProgress[3]==null}">
				<div class="cd-timeline-img cd-movie">
					<img src="img/cd-icon-movie.svg" alt="Picture">
				</div>
				<div class="cd-timeline-content">
					<h2>Level 4</h2>
					<p>应用开发</p>
					<!-- <a href="http://www.helloweba.com/view-blog-285.html" class="cd-read-more" target="_blank">阅读全文</a> -->
					<span class="cd-date">未达成</span>
				</div>
			</c:if>
		</div>
		
		<!-- level 4 e-->
	</section>
</body>
</html>