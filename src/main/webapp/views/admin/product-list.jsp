<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="col">
	<div class="row">
		<div class="col-md-12">
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
						<th>Is Selling</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="product">
						<tr class="odd gradeX">
							<td>${product.productId }</td>
							<td><img width="50px" height="50px" src="${product.image }">
							</td>
							<td><a
								href="<c:url value="/admin/product-detail?productId=${product.productId }"/>">${product.name }</a></td>
							<td>${product.description }</td>
							<td>${product.price }</td>
							<td>${product.prmotionalPrice }</td>
							<td>${product.quantity }</td>
							<td>${product.sold }</td>
							<td>${product.rating }</td>
							<td><c:if test="${product.isActive == true}">
									<span>Active</span>
								</c:if> <c:if test="${product.isActive == false}">
									<span>Inactive</span>
								</c:if></td>
							<td>${product.isSelling }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="text-center mt-3 mt-sm-3">

				<c:if test="${totalPages > 0 }">
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-end mb-0">
							<li class="${1==(number + 1) ? 'page-item active': 'page-item' }">
								<a class="page-link"
								href='<c:url value='/admin/products?filter=${filter }&page=${0 }'/>'
								tabindex="-1">First</a>
							</li>
							<c:forEach var="i" begin="${number-1 < 0 ? 0 : number-1 }"
								end="${number+2 }">
								<c:if test="${i > 0 && i < totalPages}">
									<li class="${i==number ? 'page-item active': 'page-item' }">
										<a class="page-link"
										href="<c:url value='/admin/products?filter=${filter }&page=${i }'/>">${i + 1 }</a>
									</li>
								</c:if>


							</c:forEach>
							<li
								class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
								<a class="page-link"
								href='<c:url value='/admin/products?filter=${filter }&page=${totalPages }'/>'
								tabindex="-1">Last</a>
						</ul>
					</nav>
				</c:if>

			</div>
		</div>
	</div>
</div>
