<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
.wewgfjqc a {
	font-size: 1.7rem !important;
	padding: 1rem 2rem !important;
	margin-right: 1.3rem !important;
}
</style>

<div class="row" style="flex: 1; font-size: 1.7rem !important;">
	<div class="container" style="width: 100%">
		<div class="card-header">
			<h2>Tổng số lượng đơn hàng và sản phẩm</h2>
			<hr style="width: 100%;">
			<div
				style="display: flex; font-size: 1.5rem; justify-content: space-between; width: 100%;">
			</div>
			<div style="flex: 0.7; line-height: 6rem;"></div>

			<h3>Total: ${totalOrders} orders</h3>
			<h3>Total: ${totalProducts} products</h3>
		</div>

		<div class="card-header">
			<h2>Top 3 Newest Orders</h2>
			<hr style="width: 100%;">
			<div
				style="display: flex; font-size: 1.5rem; justify-content: space-between; width: 100%;">
			</div>
			<div style="flex: 0.7; line-height: 6rem;"></div>

			<table class="table table-striped table-bordered table-hover"
				style="width: 100%">
				<thead>
					<tr>
						<th>Order ID</th>
						<th>User ID</th>
						<th>Address</th>
						<th>Phone</th>
						<th>Status</th>

						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${top3Orders}" var="order">
						<tr class="odd gradeX">
							<td>${order.orderId }</td>
							<td>${order.user.userId }</td>
							<td>${order.address }</td>
							<td>${order.phone }</td>
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
							<td><a
								href="<c:url value="/admin/order-detail?orderId=${order.orderId }"/>"
								class="button-81" role="button"><i class="fa fa-info"></i>
									Read more</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="card-header">
			<h2>Top 3 Most Sold Products</h2>
			<hr style="width: 100%;">
			<div
				style="display: flex; font-size: 1.5rem; justify-content: space-between; width: 100%;">
			</div>
			<div style="flex: 0.7; line-height: 6rem;"></div>


			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Image</th>
						<th>Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Sold</th>
						<th>Rating</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${top3SoldProducts}" var="product">
						<tr class="odd gradeX">
							<td>${product.productId }</td>
							<td><c:set value="${product.image}" var="imageUrl" /> <c:choose>
									<c:when test="${fn:substring(imageUrl, 0, 4) == 'http' }">
										<c:url value="${product.image}" var="productImageUrl"></c:url>

									</c:when>
									<c:otherwise>
										<c:url
											value="/image?fname=${product.image}&fileFolder=Products"
											var="productImageUrl"></c:url>

									</c:otherwise>
								</c:choose> <img src="${productImageUrl}" width="100px"
								alt="${product.slug}"></td>
							<td>${product.name}</td>
							<td>${product.price }VNĐ</td>
							<td>${product.quantity }</td>
							<td>${product.sold }</td>
							<td>${product.rating }</td>
							<td><c:if test="${product.isActive == true}">
									<span>Active</span>
								</c:if> <c:if test="${product.isActive == false}">
									<span>Inactive</span>
								</c:if></td>
							<td style="text-align: center"><a role="button"
								class="btn-buy btn-sm"
								href="<c:url value="/admin/product-detail?productId=${product.productId }"/>">
									<i class="far fa-eye"> Read More</i>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row mt-2 md-2">
				<h2>Biểu đồ số lượng sản phẩm đã bán</h2>
				<hr style="width: 100%;">
				<div
					style="display: flex; font-size: 1.5rem; justify-content: space-between; width: 100%;">
				</div>
				<div style="flex: 0.7; line-height: 6rem;"></div>
				<div style="margin: 1.5rem 0rem;" class="wewgfjqc">
					<a
						href="<c:url value="/admin/statistic-revenue?storeId=${storeId }&chart=0"/>"
						class="button-81" role="button">Pie Chart</a> <a
						href="<c:url value="/admin/statistic-revenue?storeId=${storeId }&chart=1"/>"
						class="button-81" role="button">Bar Chart</a>
				</div>
				<div id="chartContainer" style="height: 300px; width: 100%;"></div>
			</div>
		</div>
	</div>
</div>
<c:if test="${chart == 0 }">
	<script type="text/javascript">
	window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {
      zoomEnabled: true,      
      animationEnabled: true,
      title:{
       text: "Products Sold Pie Chart"       
     },

     data: [
     {        
      type: "pie",
      toolTipContent: "{y} - #percent %",
      indexLabel: "{name}",
      showInLegend: true,
      legendText: "{name}",
      dataPoints: ${json }
    }
    ]
  });

    chart.render();
  }
  </script>
</c:if>
<c:if test="${chart == 1 }">
	<script>
window.onload = function () {
	
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	zoomEnabled: true,
	title:{
		text:"Products Sold Bar Chart"
	},
	axisX:{
		interval: 1
	},
	axisY2:{
		interlacedColor: "rgba(1,77,101,.2)",
		gridColor: "rgba(1,77,101,.1)",
		title: "Number of Sold Products"
	},
	data: [{
		type: "bar",
		axisYType: "secondary",
		color: "#014D65",
		dataPoints: ${json }
	}]
});
chart.render();

}
</script>
</c:if>
<script type="text/javascript"
	src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>