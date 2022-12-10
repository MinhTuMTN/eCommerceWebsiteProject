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

.my-container-orders {
	margin-top: 3rem;
	width: 100%;
	height: 5rem;
	font-size: 1.7rem;
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
								<span ${o1 ? 'class="my-order-active"' : '' }><a href="">Chờ
										xác nhận</a></span> <span ${o2 ? 'class="my-order-active"' : '' }><a
									href="">Đang giao hàng</a></span> <span
									${o3 ? 'class="my-order-active"' : '' }><a href=""></a>Đã
									giao</a></span> <span ${o4 ? 'class="my-order-active"' : '' }><a
									href=""></a>Từ chối</a></span>
							</div>
							<div class="+eqaLN">
								<table id="example" class="table table-striped"
									style="width: 100%">
									<thead>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Garrett Winters</td>
											<td>Accountant</td>
											<td>Tokyo</td>
											<td>63</td>
											<td>2011-07-25</td>
											<td>$170,750</td>
										</tr>
										<tr>
											<td>Donna Snider</td>
											<td>Customer Support</td>
											<td>New York</td>
											<td>27</td>
											<td>2011-01-25</td>
											<td>$112,000</td>
										</tr>
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