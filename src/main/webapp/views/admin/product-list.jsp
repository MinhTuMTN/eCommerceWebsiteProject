<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<style>
.search {
	right: 0rem;
	width: 25rem;
	height: 4rem;
	background: #fff;
	border-radius: 0.5rem;
	display: flex;
	align-items: center;
	box-shadow: var(- -box-shadow);
}
body > section.sproduct > div > div > div.col > div > div > table > tbody > tr> td:nth-child(11) > a:nth-child(1) {
	margin-bottom: 1rem;
}
</style>
<div class="col">
	<div class="row">
		<div class="col-md-12">

			<form action="<c:url value="/admin/search-products"/>" style="margin-bottom: 1rem">
				<div class="input-group">
					<input type="search" class="form-control rounded"
						placeholder="Search" aria-label="Search"
						aria-describedby="search-addon" value="${searchText }"
						name="search-text" />
					<button type="submit" class="button-81">Search</button>
				</div>
			</form>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Image</th>
						<th>Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Promotional Pricing</th>
						<th>Quantity</th>
						<th>Sold</th>
						<th>Rating</th>
						<th>Status</th>
						<th>Active</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="product">
						<tr class="odd gradeX">
							<td>${product.productId }</td>
							<td><c:if test="${fn:startsWith(product.image, 'http')}">
									<img width="200rem" height="200rem" src="${product.image }">
								</c:if> <c:if test="${!fn:startsWith(product.image, 'http')}">
									<img width="200rem" height="200rem"
										src="../image?fileFolder=Products&fname=${product.image }">
								</c:if></td>
							<td><a
								href="<c:url value="/admin/product-detail?productId=${product.productId }"/>">${product.name }</a></td>
							<td>${product.description }</td>
							<td style="width: 10rem"><fmt:formatNumber type="number"
									maxFractionDigits="2" value="${product.price }" /> đ</td>
							<td>${product.prmotionalPrice }</td>
							<td>${product.quantity }</td>
							<td>${product.sold }</td>
							<td>${product.rating }</td>
							<td><c:if test="${product.isActive == true}">
									<span>Active</span>
								</c:if> <c:if test="${product.isActive == false}">
									<span>Inactive</span>
								</c:if></td>
							<td style="text-align: center;"><a
								href="<c:url value="/admin/product-detail?productId=${product.productId}"/>"
								class="button-81" role="button"><i class="fa fa-info"></i></a> <c:if
									test="${product.isActive == false}">
									<a
										href="<c:url value="/admin/restore-product?productId=${product.productId}"/>"
										class="button-81" role="button"
										onclick="javascript:return YNConfirmation()"><i
										class="fa fa-refresh"></i></a>
								</c:if> <c:if test="${product.isActive == true}">
									<a
										href="<c:url value="/admin/delete-product?productId=${product.productId}"/>"
										class="button-81" role="button"
										onclick="javascript:return YNConfirmation()"> <i
										class="fa fa-trash"></i></a>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="text-center mt-3 mt-sm-3">

				<c:if test="${isSearch }">
					<c:if test="${totalPages > 0 }">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-end">
								<li
									class="${1==(number + 1) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/search-products?search-text=${searchText }&?page=${0 }'/>'
									tabindex="-1">First</a>
								</li>
								<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
									end="${number+2 }">
									<c:if test="${i > 0 && i < totalPages}">
										<li class="${i==number ? 'page-item active': 'page-item' }">
											<a class="page-link"
											href="<c:url value='/admin/search-products?search-text=${searchText }&page=${i }'/>">${i + 1 }</a>
										</li>
									</c:if>
								</c:forEach>
								<li
									class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/search-products?search-text=${searchText }&?page=${totalPages }'/>'
									tabindex="-1">Last</a>
							</ul>
						</nav>
					</c:if>
				</c:if>
				<c:if test="${!isSearch }">
					<c:if test="${totalPages > 0 }">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-end">
								<li
									class="${1==(number + 1) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/products?page=${0 }'/>' tabindex="-1">First</a>
								</li>
								<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
									end="${number+2 }">
									<c:if test="${i > 0 && i < totalPages}">
										<li class="${i==number ? 'page-item active': 'page-item' }">
											<a class="page-link"
											href="<c:url value='/admin/products?page=${i }'/>">${i + 1 }</a>
										</li>
									</c:if>
								</c:forEach>
								<li
									class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/products?page=${totalPages }'/>'
									tabindex="-1">Last</a>
							</ul>
						</nav>
					</c:if>
				</c:if>

			</div>
		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>