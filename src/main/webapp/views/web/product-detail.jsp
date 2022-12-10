<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- product detail starts -->
<section class="sproduct">
	<div class="box-container pb-2">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a
					href="<c:url value="/categories" />">Categories</a></li>
				<li class="breadcrumb-item active" aria-current="page"><a
					href="<c:url value="/categories?categoryId=${product.category.categoryId }" />">${product.category.name}</a></li>
			</ol>
		</nav>
	</div>
	<div class="box-container">
		<div class="row">
			<div class="col-lg-5 col-md-12 col-12">
				<c:if test="${fn:startsWith(product.image, 'http')}">
					<img class="img-product" src="${product.image }" alt="">
				</c:if>
				<c:if test="${!fn:startsWith(product.image, 'http')}">
					<img class="img-product"
						src="image?fileFolder=Products&fname=${product.image }" alt="">
				</c:if>
			</div>

			<div class="col-lg-6 col-md-12 col-12">
				<h3 class="py-4 heading-product-detail">${product.name }</h3>
				<h2 class="price">
					<fmt:formatNumber type="number" maxFractionDigits="2"
						value="${product.price}" />
					đ
				</h2>
				<span style="font-size: 20px; padding-right: 25px;">Quantity
					:</span> <input type="number" value="1" min="1" id="quantity">

				<h2 class="mt-5 mb-2" style="font: size 30px;">Product Details</h2>
				<span style="font-size: 12px;">${product.description }</span> <br>
				<button class="btn-buy" onclick="addToCart()">Add To Cart</button>

			</div>
		</div>
	</div>
	<div class="box-container pt-10">
		<div class="shop-inf">
			<div class="mxBadu">
				<a class="CrEFt7"
					href="<c:url value="store?storeId=${product.store.storeId }" />">
					<div class="shopee-avatar _92jwbD">
					<c:if test="${fn:startsWith(product.store.avatar, 'http')}">
						<img class="ava__img" src="${product.store.avatar }"
							alt="Shop ava img">
					</c:if>	
					<c:if test="${!fn:startsWith(product.store.avatar, 'http')}">
						<img class="ava__img" src="image?fileFolder=Stores&fname=${product.store.avatar }"
							alt="Shop ava img">
					</c:if>		
					</div>
					<div class="jxOoP6">
						<div class="bpQZ1 Z8rK9d">Yêu thích</div>
					</div>
				</a>
				<div class="auohmy">
					<a href="<c:url value="store?storeId=${product.store.storeId }" />"
						style="text-decoration: none">
						<div class="FbKovn">${product.store.name }</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Other product starts-->
<section class="list" id="" style="padding-top: 0;">

	<h1 class="heading" style="text-transform: capitalize;">
		Some other <span>products</span>
	</h1>

	<div class="box-container">
		<c:forEach var="p" items="${otherProducts }">
			<div class="box">
				<c:if test="${fn:startsWith(p.image, 'http')}">
					<img src="${p.image }" alt="">
				</c:if>
				<c:if test="${!fn:startsWith(p.image, 'http')}">
					<img src="image?fileFolder=Products&fname=${p.image }" alt="">
				</c:if>
				<a
					href="<c:url value="/product-details?productId=${p.productId }"/>"><h3>${p.name }</h3></a>
				<p>${p.description }</p>
				<strong><fmt:formatNumber type="number"
						maxFractionDigits="2" value="${p.price}" />đ</strong> <br> <a
					href="<c:url value="/addToCart?productId=${p.productId }"/>"
					class="btn">Add to cart</a>
			</div>
		</c:forEach>
	</div>

</section>
<!-- Other product ends-->
<c:url value="/addToCart?productId=${product.productId }"
	var="addToCartURL"></c:url>
<script type="text/javascript">
	function addToCart() {
		<c:set var="myVal" value="${addToCartURL}"/>
		var quantity = document.getElementById("quantity").value;
		window.location.href = '${myVal}' + '&quantity=' + quantity;
	}
</script>