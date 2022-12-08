<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="index.html">Simple Ecommerce</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end"
			id="navbarsExampleDefault">
			<ul class="navbar-nav m-auto">
				<li class="nav-item active"><c:url value="/home" var="linkHome"></c:url>
					<a class="nav-link" href="${linkHome}">Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Categories</a>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
							<c:forEach items="${listCategoryHeader }" var="cate">
								<c:url value="/category/category-detail?id=${cate.cateid }" var="cateURL"></c:url>
								<a class="dropdown-item" href="${cateURL }">${cate.catename }</a>
							</c:forEach>
						</div>
				</li>
				
				<c:url value="/products" var="linkProduct"></c:url>
				<li class="nav-item"><a class="nav-link" href="${linkProduct }">Product</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="product.html">Cart</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
				</li>
			</ul>

			<form class="form-inline my-2 my-lg-0">
				<div class="input-group input-group-sm">
					<input type="text" class="form-control" placeholder="Search...">
					<div class="input-group-append">
						<button type="button" class="btn btn-secondary btn-number">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
				<a class="btn btn-success btn-sm ml-3" href="cart.html"> <i
					class="fa fa-shopping-cart"></i> Cart <span
					class="badge badge-light">3</span>
				</a>
				<c:url value="/dang-nhap" var="loginURL"></c:url>
				<a class="nav-link" href="${loginURL }">Login</a>
			</form>
		</div>
	</div>
</nav>