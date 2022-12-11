<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="col">
	<div class="row">
		<div class="container">
			<%-- <div class="row mt-2 md-2">
			<div class="col-md-6 float-right">
				<a class="button-81" role="button"
					href="<c:url value="/admin/add-commission"/>">Add New Commission</a>
			</div>
		</div> --%>
			<h3>Total: ${totalOrders} orders</h3>
			<h3>Total: ${totalProducts} products</h3>
			<%-- <a
			href="<c:url value="/admin/statistics"/>"
			class="button-81" role="button"> <i class="fa fa-line-chart"></i>Show statistics</a> --%>
		</div>
	</div>


	<div class="row">
		<div class="col-md-12">
			<div class="card-header">
				<h2>Top 3 Newest Orders</h2>
			</div>
			<table class="table table-striped table-bordered table-hover">
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

		<div class="col-md-12">
			<div class="card-header">
				<h2>Top 3 Most Sold Products</h2>
			</div>
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
							<td><a
								href="<c:url value="/admin/product-detail?productId=${product.productId }"/>"
								class="button-81" role="button"><i class="fa fa-info"></i>
									Read more</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<a
		href="<c:url value="/admin/statistic-revenue?storeId=${storeId }&chart=0"/>"
		class="button-81" role="button">Pie Chart</a> <a
		href="<c:url value="/admin/statistic-revenue?storeId=${storeId }&chart=1"/>"
		class="button-81" role="button">Bar Chart</a>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
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
</div>