<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<section class="home" id="home">
	<div class="content">

		<h3>
			<span>Quản lý đơn hàng</span>
		</h3>
		<p>Xem thông tin đơn hàng</p>
	</div>

</section>
<div class="container">
	<div class="row">
		<div class="col">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="<c:url value="/admin/home"/>">Home</a></li>
					<li class="breadcrumb-item"><a
						href="<c:url value="/admin/orders"/>">Order list</a></li>
					<li class="breadcrumb-item"><a
						href="<c:url value="/admin/order-detail?orderId=${order.orderId}"/>">${order.orderId}</a></li>
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
									<a class="nav-link"
										href="<c:url value="/admin/products?filter=2"/>">All
										Products</a>
								</h4></li>
							<li><h4>
									<a class="nav-link"
										href="<c:url value="/admin/products?filter=1"/>">Active
										Products</a>
								</h4></li>
							<li><h4>
									<a class="nav-link"
										href="<c:url value="/admin/products?filter=0"/>">Inactive
										Products</a>
								</h4></li>
						</ul></li>
					<li class="nav-item has-submenu list-group-item"><a
						class="nav-link" href="#">
							<h3>Orders management</h3>
					</a>
						<ul class="submenu collapse">
							<li><h4>
									<a class="nav-link"
										href="<c:url value="/admin/orders?filter=1"/>">All Orders</a>
								</h4></li>
							<li><h4>
									<a class="nav-link"
										href="<c:url value="/admin/orders?filter=0"/>">Shipped
										Orders</a>
								</h4></li>
						</ul></li>
				</ul>

			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="container">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>Category ID</th>
					<th>Image</th>
					<th>Name</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<tr class="odd gradeX">
					<td>${category.categoryId }</td>
					<td><c:set value="${category.image}" var="imageUrl" /> <c:choose>
							<c:when test="${fn:substring(imageUrl, 0, 4) == 'http' }">
								<c:url value="${category.image}" var="categoryImgUrl"></c:url>

							</c:when>
							<c:otherwise>
								<c:url
									value="/image?fname=${category.image}&fileFolder=Categories"
									var="categoryImgUrl"></c:url>

							</c:otherwise>
						</c:choose> <img src="${categoryImgUrl}" width="100px" alt="${category.name}"></td>
					<td>${category.name}</td>
					<td>${category.createdAt }</td>
					<td>${category.updatedAt }</td>
					<td><c:if test="${category.isDeleted == true}">
							<span>Deleted</span>
						</c:if> <c:if test="${category.isDeleted == false}">
							<span>Active</span>
						</c:if></td>

				</tr>
			</tbody>
		</table>
	</div>
</div>


<script
	src="${pageContext.request.contextPath}/views/js/menuDropdown.js"></script>
<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>