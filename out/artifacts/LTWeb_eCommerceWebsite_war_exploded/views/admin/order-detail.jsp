<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
.row {
	flex: 0.9 !important;
	font-size: 1.7rem !important;
}

body>section.sproduct>div>div>div.row>div>table>tbody>tr>th {
	text-align: left !important;
	width: 20% !important;
}
body > section.sproduct > div > div > div.col > div > div > table > tbody > tr > th {
	width: 20% !important;
}
</style>
<div class="col">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Order ID</th>
						<th>User ID</th>
						<th>Store ID</th>
						<th>Delivery ID</th>
						<th>Address</th>
						<th>Phone</th>
						<th>Amount From Store</th>
						<th>Amount From User</th>
						<th>Amount To GD</th>
						<th>Amount To Store</th>
						<th>Created At</th>
						<th>Updated At</th>
						<th>Paid</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr class="odd gradeX">
						<td>${order.orderId }</td>
						<td>${order.user.userId }</td>
						<td>${order.store.storeId }</td>
						<td>${order.delivery.deliveryId }</td>
						<td>${order.address }</td>
						<td>${order.phone }</td>
						<td>${order.amountFromStore }</td>
						<td><fmt:formatNumber value="${order.amountFromUser }" maxFractionDigits="2" type="number"></fmt:formatNumber> đ</td>
						<td>${order.amountToGD }</td>
						<td>${order.amountToStore }</td>
						<td>${order.createdAt }</td>
						<td>${order.updatedAt }</td>
						<td><c:if test="${order.isPaidBefore == false}">
								<span>Not paid</span>
							</c:if> <c:if test="${order.isPaidBefore == true}">
								<span>Paid</span>
							</c:if></td>
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

					</tr>
				</tbody>
			</table>
			<c:if test="${order.status == 2}">
				<a
					href="<c:url value="/admin/update-status?orderId=${order.orderId }"/>"
					class="btn-buy btn-sm"
					onclick="javascript:return YNConfirmation()">Cập nhật trạng
					thái đơn hàng</a>
			</c:if>
		</div>
	</div>
</div>


<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>
	
<script type="text/javascript">
	$("table").each(function() {
		var $this = $(this);
		var newrows = [];
		$this.find("tr").each(function() {
			var i = 0;
			var e = true;
			$(this).find("td").each(function() {
				e = false;
				i++;
				if (newrows[i] === undefined) {
					newrows[i] = $("<tr></tr>");
				}
				newrows[i].append($(this));
			});
			if (e) {
				$(this).find("th").each(function() {
					i++;
					if (newrows[i] === undefined) {
						newrows[i] = $("<tr></tr>");
					}
					newrows[i].append($(this));
				});
			}
		});
		$this.find("tr").remove();
		$.each(newrows, function() {
			$this.append(this);
		});
	});
</script>