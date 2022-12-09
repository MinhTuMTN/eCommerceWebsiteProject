<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!-- home section starts  -->
<!-- Hiển thông báo -->
<c:if test="${message != null}">
	<div class="alert alert-primary" role="alert">
		<i>${message}</i>
	</div>
</c:if>
<!-- Hêt thông báo -->
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

<!-- home section ends -->

<section class="categories" id="categories">
	<div class="container">
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
								src="./views/images/5f3df7c16d4f3a9b4e09f6044dd2c3c8.png"
								alt="First slide" />
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="./views/images/755ff398b5dc1b7696ae95b04260bd01.jpeg"
								alt="Second slide" />
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="./views/images/Shopee-25.2-Sale-cuoi-thang-don-luong-ve.jpg"
								alt="Third slide" />
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
					<div class="card-header bg-success text-white text-uppercase"
						style="font-size: 1.7rem">
						<i class="fa fa-heart"></i> Top product
					</div>
					<img class="img-fluid border-0"
						src="${topProduct.image }"
						alt="Card image cap" />
					<div class="card-body">
						<h4 class="card-title text-center">
							<a href="" title="View Product">${topProduct.name }</a>
						</h4>
						<div class="row">
							<div class="col text-center">
								<strong class="price-top"><fmt:formatNumber
										type="number" maxFractionDigits="2"
										value="${topProduct.price}" />đ</strong><br>
							
								<a href='<c:url value="/add-to-cart?productId=${topProduct.productId }"/>' class="btn">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>

<!-- last product starts  -->
<section class="categories" id="categories">
	<h1 class="heading" style="text-transform: capitalize;">
		<span>last</span> products
	</h1>

	<div class="box-container">
		<c:forEach items="${lastProducts }" var="p">
			<div class="box">
				<img src="${p.image }" alt="" /> <a href=""><h3>${p.name }</h3></a>
				<p>${p.description }</p>
				<strong><fmt:formatNumber type="number"
						maxFractionDigits="2" value="${p.price}" />đ</strong> 
						<br>
						<a
					href="<c:url value="/add-to-cart?productId=${p.productId }"/>"
					class="btn">Add to cart</a>
			</div>
		</c:forEach>
	</div>
</section>

<!--  last product ends -->

<!-- last product starts  -->
<section class="categories" id="categories">
	<h1 class="heading" style="text-transform: capitalize;">
		<span>best</span> products
	</h1>

	<div class="box-container">
		<c:forEach items="${bestProducts }" var="p">
			<div class="box">
				<img src="${p.image }" alt="" /> <a href=""><h3>${p.name }</h3></a>
				<p>${p.description }</p>
				<strong><fmt:formatNumber type="number"
						maxFractionDigits="2" value="${p.price}" />đ</strong> <br><a
					href="<c:url value="/add-to-cart?productId=${p.productId }"/>"
					class="btn">Add to cart</a>
			</div>
		</c:forEach>
	</div>
</section>

<!--  last product ends -->
