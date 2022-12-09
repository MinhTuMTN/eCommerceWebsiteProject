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
					<th>Order ID</th>
					<th>User ID</th>
					<th>Store ID</th>
					<th>Delivery ID</th>
					<th>Address</th>
					<th>Phone</th>
					<th>Amount From Store</th>
					<th>Amount From User</th>
					<th>Amount To GD</th>
					<th>Amount To Store</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Paid</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<tr class="odd gradeX">
					<td>${order.orderId }</td>
					<td>${order.user.userId }</td>
					<td>${order.store.storeId }</td>
					<td>${order.delivery.deliveryId }</td>
					<td>${order.address }</td>
					<td>${order.phone }</td>
					<td>${order.amountFromStore }</td>
					<td>${order.amountFromUser }</td>
					<td>${order.amountToGD }</td>
					<td>${order.amountToStore }</td>
					<td>${order.createdAt }</td>
					<td>${order.updatedAt }</td>
					<td><c:if test="${order.isPaidBefore == false}">
							<span>Not paid</span>
						</c:if> <c:if test="${order.isPaidBefore == true}">
							<span>Paid</span>
						</c:if></td>
					<td><c:if test="${order.status == 0}">
							<span>Not processed</span>
						</c:if> <c:if test="${order.status == 1}">
							<span>Processing</span>
						</c:if> <c:if test="${order.status == 2}">
							<span>Shipped</span>
						</c:if> <c:if test="${order.status == 3}">
							<span>Delivered</span>
						</c:if> <c:if test="${order.status == 4}">
							<span>Cancelled</span>
						</c:if></td>

				</tr>
			</tbody>
		</table>

	</div>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/menuDropdown.js"></script>