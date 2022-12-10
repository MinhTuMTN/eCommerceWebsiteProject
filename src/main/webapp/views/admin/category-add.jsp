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
<div class="container">
	<div class="row">
		<div class="col">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="<c:url value="/admin/home"/>">Home</a></li>
					<li class="breadcrumb-item"><a
						href="<c:url value="/admin/categories"/>">Category list</a></li>
					<c:if test="${category.categoryId == null}">
						<li class="breadcrumb-item"><a href="#">Add new category</a></li>
					</c:if>
					<c:if test="${category.categoryId != null}">
						<li class="breadcrumb-item"><a href="#">Update category</a></li>
					</c:if>
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
				<div class="row mt-6">
					<form action='<c:url value="/admin/add-category"/>' method="post"
						enctype="multipart/form-data">
						<div class="card">
							<div class="card-header">
								<h2>Add new category</h2>
							</div>
							<div class="form-group">
								<label>Category name:</label> <input type="text"
									class="form-control" placeholder="Category name" name="name" />
							</div>
							<div class="form-group">
								<label>Slug:</label> <input type="text" class="form-control"
									placeholder="Slug" name="slug" />
							</div>

						</div>
						<div class="form-group">
							<label>Image</label> <input type="file" name="image" />
						</div>
						<div class="card-footer text-muted">
							<button type="reset" class="btn btn-primary">Reset</button>
							<button type="submit" class="btn btn-default">Add</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>

