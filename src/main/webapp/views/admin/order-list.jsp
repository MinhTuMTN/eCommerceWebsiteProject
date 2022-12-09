<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<section class="home" id="home">
	<div class="content">

		<h3>
			<span>Quản lý đơn hàng</span>
		</h3>
		<p>Xem danh sách đơn hàng</p>
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
										href="<c:url value="/admin/orders?filter=0"/>">Shipped Orders</a>
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
					<th>Address</th>
					<th>Phone</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders}" var="order">
					<tr class="odd gradeX">
						<td>${order.orderId }</td>
						<td>${order.user.userId }</td>
						<td>${order.address }</td>
						<td>${order.phone }</td>
						<td><c:if test="${order.status == 0}">
								<span>Not processed</span>
							</c:if> <c:if test="${order.status == 1}">
								<span>Processing</span>
							</c:if>
							<c:if test="${order.status == 2}">
								<span>Shipped</span>
							</c:if>
							<c:if test="${order.status == 3}">
								<span>Delivered</span>
							</c:if>
							<c:if test="${order.status == 4}">
								<span>Cancelled</span>
							</c:if></td>
						<td><a
							href="<c:url value="/admin/order-detail?orderId=${order.orderId }"/>">Read more</a></td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center mt-3 mt-sm-3">

			<c:if test="${totalPages > 0 }">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-end mb-0">
						<li class="${1==(number + 1) ? 'page-item active': 'page-item' }">
							<a class="page-link"
							href='<c:url value='/admin/orders?filter=${filter }&page=${0 }'/>'
							tabindex="-1">First</a>
						</li>
						<c:forEach var="i" begin="${number-1 < 0 ? 0 : number-1 }"
							end="${number+2 }">
							<c:if test="${i > 0 && i < totalPages}">
								<li class="${i==number ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href="<c:url value='/admin/orders?filter=${filter }&page=${i }'/>">${i + 1 }</a>
								</li>
							</c:if>


						</c:forEach>
						<li
							class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
							<a class="page-link"
							href='<c:url value='/admin/orders?filter=${filter }&page=${totalPages }'/>'
							tabindex="-1">Last</a>
					</ul>
				</nav>
			</c:if>

		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/menuDropdown.js"></script>