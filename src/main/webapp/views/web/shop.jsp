<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<section class="sproduct" style="padding-bottom: 2rem;">
	<div class="box-container pt-10" style="">

		<div class="shop-inf"
			style="display: flex; flex-direction: column; height: auto; position: relative; padding-bottom: 15rem;">
			<div style="width: 100%; border-radius: 0; height: 35rem">
				<c:if test="${fn:startsWith(store.cover, 'http')}">
					<img src="${store.cover }" alt="Shop ava img"
						style="width: 100%; height: 35rem">
				</c:if>
				<c:if test="${!fn:startsWith(store.cover, 'http')}">
					<img style="width: 100%; height: 35rem"
						src="image?fileFolder=Stores&fname=${store.cover }"
						alt="Shop ava img" />
				</c:if>
			</div>
			<div class="mxBadu"
				style="position: absolute; bottom: 2rem; display: flex; flex-direction: row; align-items: center; width: 100%">

				<div class="shopee-avatar _92jwbD" style="width: 20rem; height: 20rem; margin-right: 2rem ">
					<c:if test="${fn:startsWith(store.avatar, 'http')}">
						<img class="ava__img" src="${store.avatar }" alt="Shop ava img"
							style="width: 20rem; height: 20rem;">
					</c:if>
					<c:if test="${!fn:startsWith(store.avatar, 'http')}">
						<img class="ava__img" style="width: 20rem; height: 20rem;"
							src="image?fileFolder=Stores&fname=${store.avatar }"
							alt="Shop ava img" />
					</c:if>
				</div>

				<div class="auohmy">
					<a href="">
						<div class="FbKovn">${store.name }</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="list" id="" style="padding-top: 0%">
	<p class="heading-product"
		style="padding-bottom: 0%; margin-bottom: 0%">
		<i class="fa fa-shopping-bag"></i> Sản phẩm của shop
	</p>

	<div class="box-container"
		style="padding-top: 2rem; padding-bottom: 2rem;">
		<c:forEach var="p" items="${products }">
			<div class="box">
				<c:if test="${fn:startsWith(p.image, 'http')}">
					<img src="${p.image }" alt="Card image cap" />
				</c:if>
				<c:if test="${!fn:startsWith(topProduct.image, 'http')}">
					<img src="image?fileFolder=Products&fname=${p.image }"
						alt="Card image cap" />
				</c:if>
				<a
					href="<c:url value="/product-details?productId=${p.productId}" />"><h3>${p.name }</h3></a>
				<p>${p.description }</p>
				<strong><fmt:formatNumber type="number"
						maxFractionDigits="2" value="${p.price}" /> đ</strong> <br> <a
					href='<c:url value="/addToCart?productId=${p.productId }"/>'
					class="btn">Add to cart</a>
			</div>
		</c:forEach>
	</div>
</section>

<!--Phân trang starts-->
<section class="sproduct" style="padding-top: 2rem;">
	<c:if test="${totalPages > 0 }">
		<nav aria-label="...">
			<ul class="pagination mt-1">
				<li class="page-item"><a class="page-link"
					style="${0 ==(number) ? 'background-color: coral; color:white;': '' }; font-size: 1.7rem;"
					href='<c:url value='/store?storeId=${category.categoryId }&page=0'/>'
					tabindex="-1">First</a></li>
				<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
					end="${number+2 }">
					<c:if test="${i > 0 && i < totalPages}">
						<li class="page-item"><a class="page-link"
							style="${i ==(number) ? 'background-color: coral; color:white;': '' }; font-size: 1.7rem;"
							href="<c:url value='/store?storeId=${category.categoryId }&page=${i }'/>">${i + 1 }</a>
						</li>
					</c:if>
				</c:forEach>
				<li class="page-item"><a class="page-link"
					style="${totalPages ==(number) ? 'background-color: coral; color:white;': '' }; font-size: 1.7rem;"
					href='<c:url value='/store?storeId=${category.categoryId }&page=${totalPages }'/>'
					tabindex="-1">Last</a>
			</ul>
		</nav>
	</c:if>
</section>