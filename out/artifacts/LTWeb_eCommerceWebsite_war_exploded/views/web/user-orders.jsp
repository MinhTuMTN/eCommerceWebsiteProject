<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
body > section.srecharge > div.orders-nav > div {
	position: relative;
}
body > section.srecharge > div.orders-nav > div.active-rybH:before {
	content: "";
	display: block;
	width: 100%;
	height: 0.5rem;
	background-color: coral;
	position: absolute;
	bottom: -1rem;
}
</style>
<section class="srecharge" style="width: 90%; padding: 3rem; margin: 5%">
	<h1 style="margin-bottom: 1rem">Đơn hàng của tôi</h1>
	<div class="orders-nav" style="margin-bottom: 1.5rem; background-color: white">
		<div class="${o1 ? 'active-rybH': '' }">
			<a href="orders-processing" class="${o1 ? 'active': '' }">Chờ xác nhận</a>
		</div>
		<div class="${o2 ? 'active-rybH': '' }">
			<a href="orders-shipping" class="${o2 ? 'active': '' }">Đang giao</a>
		</div>
		<div class="${o3 ? 'active-rybH': '' }">
			<a href="orders-shipped" class="${o3 ? 'active': '' }">Đã giao</a>
		</div>
		<div class="${o4 ? 'active-rybH': '' }">
			<a href="orders-refused" class="${o4 ? 'active': '' }">Bị từ chối</a>
		</div>
	</div>

	
	<table id="example" class="table table-striped table-bordered"
		style="width: 100%">
		<thead style="display: none;">
			<tr>
				<th>Đơn hàng</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="o" items="${orders }">
				<tr>
					<td>
						<div class="order-details" style="margin-bottom: 1.5rem">
							<div class="shop-info">
								<div>
									<c:if test="${fn:startsWith(o.store.avatar, 'http')}">
										<img src="${o.store.avatar }" alt="" width="30rem">
									</c:if>
									<c:if test="${!fn:startsWith(o.store.avatar, 'http')}">
										<img src="image?fileFolder=Stores&fname=${o.store.avatar }"
											width="30rem">
									</c:if>
									<strong>${o.store.name }</strong>
									<div>
										<i class="fas fa-store"></i> <a
											href="store?storeId=${o.store.storeId }">Xem Shop</a>
									</div>
								</div>
								<div>
									<strong>Đặt ngày: <fmt:formatDate
											value="${o.createdAt }" pattern="dd/MM/yyyy" />
									</strong>
								</div>
							</div>
							<hr>
							<c:forEach var="oi" items="${o.orderItems }">
								<div class="order-items">
									<div class="order-items-image">
										<c:if test="${fn:startsWith(oi.product.image, 'http')}">
											<img src="${oi.product.image }" alt="" width="100rem">
										</c:if>
										<c:if test="${!fn:startsWith(oi.product.image, 'http')}">
											<img
												src="image?fileFolder=Products&fname=${oi.product.image }"
												width="100rem">
										</c:if>
									</div>
									<div class="order-items-details">
										<div class="name-count">
											<strong style="margin: 0; font-size: 1.7rem;">${oi.product.name }</strong>
											<span>Số lượng: ${oi.count }</span>
										</div>
										<span class="price"><fmt:formatNumber
												value="${oi.product.price * oi.count}" type="number" /> đ</span>
									</div>
								</div>
							</c:forEach>
						</div>
						<hr style="background-color: rgb(160, 120, 120); height: 0.5px;">
						<div
							style="display: flex; justify-content: flex-end; padding-right: 2rem;">
							Thành tiền: <strong><fmt:formatNumber
									value="${o.amountFromUser}" type="number" /> đ</strong>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
<script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>