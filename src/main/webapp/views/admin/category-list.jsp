<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<section class="home" id="home">
	<div class="content">

		<h3>
			<span>Quản lý loại sản phẩm</span>
		</h3>
		<p>Xem danh sách loại sản phẩm</p>
	</div>

</section>
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
					<li class="breadcrumb-item"><a
						href="<c:url value="/admin/categories"/>">Category list</a></li>
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
					<li class="nav-item list-group-item"><h3>
							<a class="nav-link" href="<c:url value="/admin/categories"/>">Categories
								management</a>
						</h3></li>
				</ul>

			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="container">
		<div class="row mt-2 md-2">
			<div class="col-md-6 float-right">
				<a class="button-81" role="button"
					href="<c:url value="/admin/add-category"/>">Add New Category</a>
			</div>
		</div>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>Category ID</th>
					<th>Image</th>
					<th>Name</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${categories}" var="category">
					<tr class="odd gradeX">
						<td>${category.categoryId }</td>
						<td><c:set value="${category.image}" var="imageUrl" /> <c:choose>
								<c:when test="${fn:substring(imageUrl, 0, 4) == 'http' }">
									<c:url value="${category.image}" var="categoryImgUrl"></c:url>

								</c:when>
								<c:otherwise>
									<c:url value="/image?fname=${category.image}&fileFolder=Categories"
										var="categoryImgUrl"></c:url>

								</c:otherwise>
							</c:choose> <img src="${categoryImgUrl}" width="100px"
							alt="${category.name}"></td>
						<td>${category.name}</td>
						<td><c:if test="${category.isDeleted == true}">
								<span>Deleted</span>
							</c:if> <c:if test="${category.isDeleted == false}">
								<span>Active</span>
							</c:if></td>
						<td><a
							href="<c:url value="/admin/category-detail?categoryId=${category.categoryId}"/>"
							class="button-81" role="button"><i class="fa fa-info"></i></a> <a
							href="<c:url value="/admin/update-category?categoryId=${category.categoryId}"/>"
							class="button-81" role="button"><i class="fa fa-edit"></i></a> <a
							href="<c:url value="/admin/delete-category?categoryId=${category.categoryId}"/>"
							class="button-81" role="button"><i class="fa fa-trash"></i></a></td>

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
							href='<c:url value='/admin/categories?filter=${filter }&page=${0 }'/>'
							tabindex="-1">First</a>
						</li>
						<c:forEach var="i" begin="${number-1 < 0 ? 0 : number-1 }"
							end="${number+2 }">
							<c:if test="${i > 0 && i < totalPages}">
								<li class="${i==number ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href="<c:url value='/admin/categories?filter=${filter }&page=${i }'/>">${i + 1 }</a>
								</li>
							</c:if>


						</c:forEach>
						<li
							class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
							<a class="page-link"
							href='<c:url value='/admin/categories?filter=${filter }&page=${totalPages }'/>'
							tabindex="-1">Last</a>
					</ul>
				</nav>
			</c:if>

		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/menuDropdown.js"></script>