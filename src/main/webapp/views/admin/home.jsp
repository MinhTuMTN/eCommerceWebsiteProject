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
<div class="container">
	<div class="row">
		<div class="col">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="<c:url value="/admin/home"/>">Home</a></li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-12 col-sm-3">
			<div class="card bg-light mb-3">
				<div class="card-header bg-primary text-white text-uppercase">
					<h3>
						<i class="fa fa-list"></i> Menu
					</h3>
				</div>
				<ul class="list-group category_block">
					<li class="list-group-item"><h4>
							<a href="<c:url value="/admin/users"/>">Users management</a>
						</h4></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- Hêt thông báo -->
<%-- <section class="categories" id="categories">
	<a href="<c:url value="/admin/users"/>"><h1>Quản lý người dùng</h1></a>
</section>
 --%>

