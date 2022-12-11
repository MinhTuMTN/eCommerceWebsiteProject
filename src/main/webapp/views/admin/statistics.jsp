<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="col">
	<div class="row">
		<div class="col-md-12">
			<div class="card-header">
				<h2>Top 3 Users With Most Amount</h2>
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>User ID</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${top3Users}" var="user">
						<tr class="odd gradeX">
							<td>${user.userId }</td>
							<td><a
								href="<c:url value="/admin/user-detail?userId=${user.userId }"/>">${user.firstName }
									${user.lastName }</a></td>
							<td>${user.phone }</td>
							<td style="text-transform: none;">${user.email }</td>
							<td style="text-align: center"><a
								href="<c:url value="/admin/user-detail?userId=${user.userId }"/>"
								class="button-81" role="button"><i class="fa fa-info"></i>
									Read more</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<style>
	.wewgfjqc a{
		font-size: 1.7rem !important;
		padding: 1rem 2rem !important;
		margin-right: 1.3rem !important;
	}
	</style>
	<div style="margin: 1.5rem 0rem;" class="wewgfjqc">
		<a href="<c:url value="/admin/statistics?chart=0"/>" class="button-81"
			role="button">Pie Chart</a> <a
			href="<c:url value="/admin/statistics?chart=1"/>" class="button-81"
			role="button">Bar Chart</a>
	</div>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
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
</div>
