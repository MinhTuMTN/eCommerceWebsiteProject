<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- Product list starts  -->
<section class="list" id="">

	<h1 class="heading1">
		Our <span>products</span>
	</h1>
	<hr width="20%" height="10px">
	<p class="heading-product">Here you can check out our new products
		with fair price</p>

	<div class="box-container">
		<c:forEach items="${products }" var="p">
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
					href="<c:url value="/addToCart?productId=${p.productId }" />"
					class="btn">Add to cart</a>
			</div>
		</c:forEach>
	</div>

	<c:if test="${isSearch }">
		<c:if test="${totalPages > 0 }">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-end">
					<li class="${1==(number + 1) ? 'page-item active': 'page-item' }">
						<a class="page-link" href='<c:url value='/search-product?search-text=${searchText }&?page=${0 }'/>'
						tabindex="-1">First</a>
					</li>
					<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
						end="${number+2 }">
						<c:if test="${i > 0 && i < totalPages}">
							<li class="${i==number ? 'page-item active': 'page-item' }">
								<a class="page-link"
								href="<c:url value='/search-product?search-text=${searchText }&page=${i }'/>">${i + 1 }</a>
							</li>
						</c:if>
					</c:forEach>
					<li
						class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
						<a class="page-link"
						href='<c:url value='/search-product?search-text=${searchText }&?page=${totalPages }'/>'
						tabindex="-1">Last</a>
				</ul>
			</nav>
		</c:if>
	</c:if>
	<c:if test="${!isSearch }">
		<c:if test="${totalPages > 0 }">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-end">
					<li class="${1==(number + 1) ? 'page-item active': 'page-item' }">
						<a class="page-link" href='<c:url value='/products?page=${0 }'/>'
						tabindex="-1">First</a>
					</li>
					<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
						end="${number+2 }">
						<c:if test="${i > 0 && i < totalPages}">
							<li class="${i==number ? 'page-item active': 'page-item' }">
								<a class="page-link"
								href="<c:url value='/products?page=${i }'/>">${i + 1 }</a>
							</li>
						</c:if>
					</c:forEach>
					<li
						class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
						<a class="page-link"
						href='<c:url value='/products?page=${totalPages }'/>'
						tabindex="-1">Last</a>
				</ul>
			</nav>
		</c:if>
	</c:if>
</section>

<!-- Product list ends -->