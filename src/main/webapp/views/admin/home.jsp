<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<section class="home" id="home">
	<div class="content">
		<h5>NEW ARRAIVALS</h5>
		<h3>
			<span>Best Price</span> This Year
		</h3>
		<p>
			Lorem ipsum dolor sit amet consectetur adipisicing elit.<br />
			Aliquam libero nostrum veniam facere tempore nisi.
		</p>
		<a href="#" class="btn">Buy now</a>
	</div>
</section>
<!-- Hiển thông báo -->
<c:if test="${message != null}">
	<div class="alert alert-primary" role="alert">
		<i>${message}</i>
	</div>
</c:if>
<!-- Hêt thông báo -->
<section class="categories" id="categories">
	<a href="<c:url value="/admin/users"/>"><h1>Quản lý người dùng</h1></a>
</section>


