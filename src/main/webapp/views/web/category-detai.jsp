<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- home section starts  -->

<section class="home" id="home">
	<div class="content">
		<h5>NEW ARRAIVALS</h5>
		<h3>
			<span>${category.name }</span>
		</h3>
		<p>
			Lorem ipsum dolor sit amet consectetur adipisicing elit.<br>
			Aliquam libero nostrum veniam facere tempore nisi. Lorem ipsum dolor
			sit, amet consectetur adipisicing elit.
		</p>
	</div>

</section>

<!-- home section ends -->

<!-- category detail starts -->
<section class="sproduct" style="padding-top: 5rem;">
	<div class="box-container pb-2">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="home">Home</a></li>
				<li class="breadcrumb-item"><a href="categories">Categories</a></li>
				<li class="breadcrumb-item active" aria-current="page">${category.name }</li>
			</ol>
		</nav>
	</div>
	<div class="box-container w-10">
		<div class="row">
			<div class="col-12 col-sm-3">
				<!--Danh mục category starts-->
				<div class="card bg-light mb-1">
					<div class="card-header text-white text-uppercase"
						style="background-color: black; font-size: 18px;">
						<i class="fa fa-list"></i> Categories
					</div>
					<ul class="list-group category_block">
						<c:forEach var="c" items="${categories }">
							<c:url value="/categories?categoryId=${c.categoryId }"
								var="urlCategory"></c:url>
							<c:if test="${c.categoryId == category.categoryId }">
								<li class="list-group-item"
									style="background-color: coral; color: white; font-size: 1.7rem; height: 4.25rem;"><a
									href="${urlCategory }" class="a-cate-detai">${c.name }</a></li>
							</c:if>
							<c:if test="${c.categoryId != category.categoryId }">
								<li class="list-group-item" style="font-size: 1.7rem;"><a
									href="${urlCategory }" class="a-cate-detai">${c.name }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<!--Danh mục category ends-->

				<div class="card bg-light mb-3 mt-5">
					<div class="card-header text-white text-uppercase"
						style="background-color: black; font-size: 18px;">Last
						product</div>
					<div class="card-body" style="background-color: white;">
						<img class="img-last-product" src="${topProduct.image }"
							alt="Card image cap">


						<h5 class="heading1" style="font-size: 2rem;">
							<a
								href="<c:url value="product-details?productId=${topProduct.productId }" />">${topProduct.name}</a>
						</h5>
						<p class="card-text" style="font-size: 1.2rem;">${topProduct.description }</p>
						<p class="bloc_left_price price" style="text-align: center;">
							<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${topProduct.price}" />
							đ
						</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<!--Product in category starts-->
					<section class="list-cate" id=""
						style="padding-top: 0; padding-left: 2rem; padding-right: 2rem;">
						<div class="box-container"
							style="grid-template-columns: auto auto auto">
							<c:forEach var="p" items="${products }">
								<c:url value="/product-details?productId=${p.productId }"
									var="URLProduct"></c:url>
								<div class="box">
									<img src="${p.image }" alt=""> <a href="${URLProduct }"><h3>${p.name }</h3></a>
									<p>${p.description }</p>
									<strong><fmt:formatNumber type="number"
											maxFractionDigits="2" value="${p.price}" />đ</strong>
									<c:url value="/addToCart?productId=${p.productId }"
										var="addCartURL"></c:url>
									<a href="${addCartURL }" class="btn">Add to cart</a>
								</div>
							</c:forEach>
						</div>
					</section>
					<!--Phân trang starts-->
					<c:if test="${totalPages > 0 }">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-end">
								<li class="page-item"><a class="page-link"
									style="${0 ==(number) ? 'background-color: coral; color:white;': '' }; font-size: 1.7rem;"
									href='<c:url value='/categories?categoryId=${category.categoryId }&page=0'/>'
									tabindex="-1">First</a></li>
								<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
									end="${number+2 }">
									<c:if test="${i > 0 && i < totalPages}">
										<li class="page-item"><a class="page-link"
											style="${i ==(number) ? 'background-color: coral; color:white;': '' }; font-size: 1.7rem;"
											href="<c:url value='/categories?categoryId=${category.categoryId }&page=${i }'/>">${i + 1 }</a>
										</li>
									</c:if>
								</c:forEach>
								<li class="page-item"><a class="page-link"
									style="${totalPages ==(number) ? 'background-color: coral; color:white;': '' }; font-size: 1.7rem;"
									href='<c:url value='/categories?categoryId=${category.categoryId }&page=${totalPages }'/>'
									tabindex="-1">Last</a>
							</ul>
						</nav>
					</c:if>

				</div>
			</div>
		</div>
	</div>
</section>

<!-- category detail ends -->