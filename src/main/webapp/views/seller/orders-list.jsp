<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" />
<style>
#example_wrapper {
	width: 100% !important;
	font-size: 1.3rem;
}

#example>thead>tr>th {
	vertical-align: middle;
	text-align: center;
}

#example>tbody>tr>td {
	vertical-align: middle;
	text-align: center;
}

.page-item.active .page-link {
	z-index: 1;
	color: #fff;
	background-color: coral !important;
	border-color: coral !important;
}

#example>tbody>tr>td>a {
	text-decoration: none !important;
	color: gray;
}

#example>tbody>tr>td>a:hover {
	color: coral;
}

.my-container-orders {
	margin-top: 3rem;
	width: 100%;
	height: 5rem;
	font-size: 2rem;
	background-color: rgb(238, 235, 229);
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.my-container-orders span {
	flex: 0.2;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
}

.my-container-orders span.my-order-active::after {
	content: "";
	height: 0.5rem;
	width: 100%;
	background-color: coral;
	position: absolute;
	bottom: 0;
}

.my-container-orders span a {
	text-decoration: none;
	color: black;
}

.my-container-orders span a:hover {
	text-decoration: none;
	color: coral;
}

#example>tbody>tr>td:nth-child(5)>a>i {
	font-size: 1.8rem;
	margin-right: 1rem;
	color: coral;
}

.orders-count {
	display: inline-flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	width: 2.5rem;
	height: 2.5rem;
	border-radius: 50%;
	color: white;
	background-color: coral;
}
</style>
<!-- body starts -->
<div class="col">
	<div class="row">
		<!--Product in category starts-->
		<section class="list-cate" id=""
			style="padding-top: 0; padding-left: 0; padding-right: 0">
			<div class="box-container">
				<div class="xMDeox">
					<div style="padding: 1.875rem 0.625rem">
						<div class="Q5feZb">
							<h1 class="OomjNA">Quản lý đơn hàng</h1>
							<div class="my-container-orders">
								<span ${o1 ? 'class="my-order-active"' : '' }><a
									href="orders">Chờ xác nhận <div class="orders-count">${ordersCount }</div></a></span> <span
									${o2 ? 'class="my-order-active"' : '' }><a
									href="order-shipping">Đang giao hàng</a></span> <span
									${o3 ? 'class="my-order-active"' : '' }><a
									href="order-shipped">Đã giao</a></span> <span
									${o4 ? 'class="my-order-active"' : '' }><a
									href="order-refused">Từ chối</a></span>
							</div>
							<div class="+eqaLN">
								<table id="example" class="table table-striped"
									style="width: 100%">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Tên người mua</th>
											<th>Ngày tạo đơn</th>
											<th>Tổng giá trị</th>
											<th>Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="order" items="${orders }">
											<tr>
												<td>${order.orderId }</td>
												<td>${order.user.firstName } ${order.user.lastName }</td>
												<td><fmt:formatDate value="${order.createdAt }"
														pattern="dd/MM/yyy hh:mm:ss" /></td>
												<td><fmt:formatNumber value="${order.amountFromUser }"
														maxFractionDigits="2" type="number"></fmt:formatNumber> đ
												</td>
												<td><a
													href='<c:url value="/seller/order-items?orderId=${order.orderId }"></c:url>'
													title="Chi tiết"><i class="fas fa-info-circle"></i></a> <c:if
														test="${o1 }">
														<a
															href='<c:url value="/seller/accept?orderId=${order.orderId }"></c:url>'
															title="Giao hàng"><i class="fas fa-truck"></i></a>
														<a
															href='<c:url value="/seller/refuse?orderId=${order.orderId }"></c:url>'
															title="Từ chối"><i class="fas fa-times"></i></a>
													</c:if></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
		</section>
		<!--Product in category starts-->
	</div>
</div>
<!-- body ends -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
<script>
	$(document).ready(function() {
		$("#example").DataTable();
	});
</script>