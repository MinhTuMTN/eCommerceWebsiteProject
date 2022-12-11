<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="col">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped table-bordered table-hover"
				style="width: 100%">
				<thead>
					<tr>
						<th>Order ID</th>
						<th>User ID</th>
						<th>User Name</th>
						<th>Address</th>
						<th>Phone</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orders}" var="order">
						<tr class="odd gradeX">
							<td>${order.orderId }</td>
							<td>${order.user.userId }</td>
							<td>${order.user.firstName } ${order.user.lastName }</td>
							<td>${order.user.address }</td>
							<td>${order.user.phone }</td>
							<td><c:if test="${order.status == 0}">
									<span>Not processed</span>
								</c:if> <c:if test="${order.status == 1}">
									<span>Processing</span>
								</c:if> <c:if test="${order.status == 2}">
									<span>Shipped</span>
								</c:if> <c:if test="${order.status == 3}">
									<span>Delivered</span>
								</c:if> <c:if test="${order.status == 4}">
									<span>Cancelled</span>
								</c:if></td>
							<td style="text-align: center;"><a class="btn-buy" style="font-size: 1.5rem; margin: 0"
								href="<c:url value="/admin/order-detail?orderId=${order.orderId }"/>">Read
									more</a></td>

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
								href='<c:url value='/admin/orders?filter=${filter }&page=${0 }'/>'
								tabindex="-1">First</a>
							</li>
							<c:forEach var="i" begin="${number-1 < 0 ? 0 : number-1 }"
								end="${number+2 }">
								<c:if test="${i > 0 && i < totalPages}">
									<li class="${i==number ? 'page-item active': 'page-item' }">
										<a class="page-link"
										href="<c:url value='/admin/orders?filter=${filter }&page=${i }'/>">${i + 1 }</a>
									</li>
								</c:if>


							</c:forEach>
							<li
								class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
								<a class="page-link"
								href='<c:url value='/admin/orders?filter=${filter }&page=${totalPages }'/>'
								tabindex="-1">Last</a>
						</ul>
					</nav>
				</c:if>

			</div>
		</div>
	</div>
</div>
