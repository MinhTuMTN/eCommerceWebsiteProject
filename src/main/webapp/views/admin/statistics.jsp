<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
td i {
	font-size: 1.8rem !important;
}
</style>
<style>
.wewgfjqc a {
	font-size: 1.7rem !important;
	padding: 1rem 2rem !important;
	margin-right: 1.3rem !important;
}
</style>

<div class="row" style="flex: 1; font-size: 1.7rem !important;">
	<div class="container" style="width: 100%">
		<div class="row mt-2 md-2">
			<h2>Top 3 người dùng thanh toán nhiều nhất</h2>
			<hr style="width: 100%;">
			<div
				style="display: flex; font-size: 1.5rem; justify-content: space-between; width: 100%;">
			</div>
			<div style="flex: 0.7; line-height: 6rem;"></div>


			<table class="table table-striped table-bordered table-hover"
				style="width: 100%">
				<thead>
					<tr style="height: 100%; vertical-align: top; overflow: auto">
						<th>User ID</th>
						<th>Avatar</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${top3Users}" var="user">
						<tr class="odd gradeX" style="height: 100px;">
							<td>${user.userId }</td>
							<td><c:if test="${fn:startsWith(product.image, 'http')}">
									<img width="200rem" height="200rem" src="${user.avatar }">
								</c:if> <c:if test="${!fn:startsWith(product.image, 'http')}">
									<img width="200rem" height="200rem"
										src="../image?fileFolder=Products&fname=${user.avatar }">
								</c:if></td>
							<td><a
								href="<c:url value="/admin/user-detail?userId=${user.userId }"/>">${user.firstName }
									${user.lastName }</a></td>
							<td>${user.phone }</td>
							<td style="text-transform: none;">${user.email }</td>
							<td style="text-align: center"><a role="button"
								class="btn-buy btn-sm"
								href="<c:url value="/admin/user-detail?userId=${user.userId }"/>">
									<i class="far fa-eye"> Read More</i>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<div class="row mt-2 md-2">
			<h2>Biểu đồ 10 người dùng thanh toán nhiều nhất</h2>
			<hr style="width: 100%;">
			<div
				style="display: flex; font-size: 1.5rem; justify-content: space-between; width: 100%;">
			</div>
			<div style="flex: 0.7; line-height: 6rem;"></div>
			<div style="margin: 1.5rem 0rem;" class="wewgfjqc">
				<a href="<c:url value="/admin/statistics?chart=0"/>"
					class="button-81" role="button">Pie Chart</a> <a
					href="<c:url value="/admin/statistics?chart=1"/>" class="button-81"
					role="button">Bar Chart</a>
			</div>
			<div id="chartContainer" style="height: 300px; width: 100%;"></div>
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
       text: "Top 10 User's Amount Pie Chart"       
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
		text:"Top 10 User's Amount Bar Chart"
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
