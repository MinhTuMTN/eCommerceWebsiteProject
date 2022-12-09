<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<section class="home" id="home">
	<div class="content">

		<h3>
			<span>Quản lý sản phẩm</span>
		</h3>
		<p>Xem danh sách sản phẩm</p>
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
						href="<c:url value="/admin/products"/>">Product list</a></li>
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
<div class="row">
	<div class="container">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>Product ID</th>
					<th>Image</th>
					<th>Name</th>
					<th>Description</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Price</th>
					<th>Promotional Pricing</th>
					<th>Quantity</th>
					<th>Rating</th>
					<th>Sold</th>
					<th>Status</th>
					<th>Is Selling</th>
					<th>Slug</th>
					<th>Video</th>
					<th>Category ID</th>
					<th>Store ID</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products}" var="product">
					<tr class="odd gradeX">
						<td>${product.productId }</td>
						<td><img width="50px" height="50px" src="${product.image }">
						</td>
						<td>${product.name }</td>
						<td>${product.description }</td>
						<td>${product.createdAt }</td>
						<td>${product.updatedAt }</td>
						<td>${product.price }</td>
						<td>${product.prmotionalPrice }</td>
						<td>${product.quantity }</td>
						<td>${product.rating }</td>
						<td>${product.sold }</td>
						<td><c:if test="${product.isActive == true}">
								<span>Active</span>
							</c:if> <c:if test="${product.isActive == false}">
								<span>Inactive</span>
							</c:if></td>
						<td>${product.isSelling }</td>
						<td>${product.slug }</td>
						<td>${product.video }</td>
						<td>${product.category.categoryId }</td>
						<td>${product.store.storeId }</td>
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
							href='<c:url value='/admin/products?filter=${filter }&page=${0 }'/>' tabindex="-1">First</a>
						</li>
						<c:forEach var="i" begin="${number-1 < 0 ? 0 : number-1 }"
							end="${number+2 }">
							<c:if test="${i > 0 && i < totalPages}">
								<li class="${i==number ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href="<c:url value='/admin/products?filter=${filter }&page=${i }'/>">${i + 1 }</a>
								</li>
							</c:if>


						</c:forEach>
						<li
							class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
							<a class="page-link"
							href='<c:url value='/admin/products?filter=${filter }&page=${totalPages }'/>'
							tabindex="-1">Last</a>
					</ul>
				</nav>
			</c:if>

		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/menuDropdown.js"></script>