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
			<div class="sidebar card bg-light mb-3">
				<div class="card-header bg-primary text-white text-uppercase">
					<h2>
						<i class="fa fa-list"></i> Menu
					</h2>
				</div>
				<ul class="list-group category_block" id="nav_accordion">
					<li class="nav-item list-group-item"><h3>
							<a class="nav-link" href="<c:url value="/admin/users"/>">Users
								management</a>
						</h3></li>
					<li class="nav-item has-submenu list-group-item"><a
						class="nav-link" href="#">
							<h3>Products management</h3>
					</a>
						<ul class="submenu collapse">
							<li><h4>
									<a class="nav-link" href="<c:url value="/admin/products?filter=2"/>">All Products</a>
								</h4></li>
							<li><h4>
									<a class="nav-link" href="<c:url value="/admin/products?filter=1"/>">Active Products</a>
								</h4></li>
							<li><h4><a class="nav-link" href="<c:url value="/admin/products?filter=0"/>">Inactive Products</a></h4></li>
						</ul></li>
				</ul>

			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/views/js/menuDropdown.js"></script>

