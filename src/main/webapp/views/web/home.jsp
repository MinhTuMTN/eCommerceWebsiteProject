<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<section class="jumbotron text-center">
	<div class="container">
		<h1 class="jumbotron-heading">E-COMMERCE BOOTSTRAP THEME</h1>
		<p class="lead text-muted mb-0">Simple theme for e-commerce buid
			with Bootstrap 4.0.0. Pages available : home, category, product, cart
			& contact</p>
	</div>
</section>
<div class="container">
	<!-- Hiển thông báo -->
	<c:if test="${message != null}">
		<div class="alert alert-primary" role="alert">
			<i>${message}</i>
		</div>
	</c:if>
	<!-- Hêt thông báo -->
	<div class="row">
		<div class="col">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="https://dummyimage.com/855x365/55595c/fff" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://dummyimage.com/855x365/a30ca3/fff"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://dummyimage.com/855x365/1443ff/fff" alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="col-12 col-md-3">
			<div class="card">
				<div class="card-header bg-success text-white text-uppercase">
					<i class="fa fa-heart"></i> Top product
				</div>

				<c:set var="imgURL" value="${topProduct.images }" />

				<c:if test="${fn:startsWith(imgURL, 'http')}">
					<img class="img-fluid border-0" src="${topProduct.images }"
						alt="Card image cap">
				</c:if>

				<c:if test="${!fn:startsWith(imgURL, 'http')}">
					<c:url value="/image?fname=${topProduct.images }"
						var="topProductImage"></c:url>
					<img class="img-fluid border-0" src="${topProductImage}"
						alt="Card image cap">
				</c:if>


				<div class="card-body">
					<h4 class="card-title text-center">
						<c:url value="/product/detail?id=${topProduct.productid }"
							var="topProductURL"></c:url>
						<a href="${topProductURL }" title="View Product">${topProduct.productname }</a>
					</h4>
					<div class="row">
						<div class="col">
							<p class="btn btn-danger btn-block">${topProduct.price }$</p>
						</div>
						<div class="col">
							<a href="product.html" class="btn btn-success btn-block">View</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="container mt-3">
	<div class="row">
		<div class="col-sm">
			<div class="card">
				<div class="card-header bg-primary text-white text-uppercase">
					<i class="fa fa-star"></i> Last products
				</div>
				<div class="card-body">
					<div class="row">
						<c:forEach items="${lastProducts}" var="product">
							<div class="col-sm">
								<div class="card">
									<c:set var="imgURL" value="${product.images }" />

									<c:if test="${fn:startsWith(imgURL, 'http')}">
										<img class="img-fluid border-0" src="${product.images }"
											alt="Card image cap">
									</c:if>

									<c:if test="${!fn:startsWith(imgURL, 'http')}">
										<c:url value="/image?fname=${product.images }"
											var="lastProductImage"></c:url>
										<img class="img-fluid border-0" src="${lastProductImage}"
											alt="Card image cap">
									</c:if>

									<div class="card-body">
										<h4 class="card-title">
											<c:url value="/product/detail?id=${product.productid }"
												var="lastProductURL"></c:url>
											<a href="${lastProductURL }" title="View Product">${product.productname}</a>
										</h4>
										<p class="card-text">${product.description }</p>
										<div class="row">
											<div class="col">
												<p class="btn btn-danger btn-block">${product.price }$</p>
											</div>
											<div class="col">
												<a href="cart.html" class="btn btn-success btn-block">Add
													to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="container mt-3 mb-4">
	<div class="row">
		<div class="col-sm">
			<div class="card">
				<div class="card-header bg-primary text-white text-uppercase">
					<i class="fa fa-trophy"></i> Best products
				</div>
				<div class="card-body">
					<div class="row">
						<c:forEach items="${bestProducts}" var="product">
							<div class="col-sm">
								<div class="card">
									<c:set var="imgURL" value="${product.images }" />

									<c:if test="${fn:startsWith(imgURL, 'http')}">
										<img class="card-img-top" src="${product.images }"
											alt="Card image cap">
									</c:if>

									<c:if test="${!fn:startsWith(imgURL, 'http')}">
										<c:url value="/image?fname=${product.images }"
											var="lastProductImage"></c:url>
										<img class="card-img-top" src="${lastProductImage}"
											alt="Card image cap">
									</c:if>

									<div class="card-body">
										<h4 class="card-title">
											<c:url value="/product/detail?id=${product.productid }"
												var="bestProductURL"></c:url>
											<a href="${bestProductURL }" title="View Product">${product.productname }</a>
										</h4>
										<p class="card-text">${product.description }</p>
										<div class="row">
											<div class="col">
												<p class="btn btn-danger btn-block">${product.price }$</p>
											</div>
											<div class="col">
												<a href="cart.html" class="btn btn-success btn-block">Add
													to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>