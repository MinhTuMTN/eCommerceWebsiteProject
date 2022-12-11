<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.my-active, .my-active a {
	background-color: coral;
	color: white;
}

ul {
	list-style-type: none;
}

#nav_accordion>li>h3>a {
	color: black;
}

#nav_accordion>li>a>h3 {
	color: black;
}
</style>
<div class="col-12 col-sm-3">
	<div class="sidebar card bg-light mb-3">
		<div class="card-header text-white"
			style="background-color: black; font-size: 23px;">
			<i class="fa fa-list"></i> Menu
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
			<li class="nav-item list-group-item"><h3>
					<a class="nav-link" href="<c:url value="/admin/userlevels"/>">User
						Levels management</a>
				</h3></li>
			<li class="nav-item list-group-item"><h3>
					<a class="nav-link" href="<c:url value="/admin/storelevels"/>">Store
						Levels management</a>
				</h3></li>

			<li class="nav-item has-submenu list-group-item"><a
				class="nav-link" href="#">
					<h3>Stores management</h3>
			</a>
				<ul class="submenu collapse">
					<li><h4>
							<a class="nav-link"
								href="<c:url value="/admin/stores?filter=2"/>">All
								Stores</a>
						</h4></li>
					<li><h4>
							<a class="nav-link"
								href="<c:url value="/admin/stores?filter=1"/>">Licensed
								Stores</a>
						</h4></li>
					<li><h4>
							<a class="nav-link"
								href="<c:url value="/admin/stores?filter=0"/>">Banned
								Stores</a>
						</h4></li>
				</ul></li>
		</ul>

	</div>
</div>
<script
	src="${pageContext.request.contextPath}/views/js/menuDropdown.js"></script>