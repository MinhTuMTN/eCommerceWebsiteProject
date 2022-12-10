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

#example > tbody > tr > td{
	vertical-align: middle;
	text-align: center;
}
.page-item.active .page-link {
    z-index: 1;
    color: #fff;
    background-color: coral !important;
    border-color: coral !important;
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
							<h1 class="OomjNA">Quản lý sản phẩm</h1>
							<div class="HJ5nmd">
								<a href="add-product">
									<button class="btn-buy" style="height: 5rem">Thêm sản
										phẩm</button>
								</a>
							</div>
						</div>
						<div class="+eqaLN">
							<table id="example" class="table table-striped"
								style="width: 100%">
								<thead>
									<tr>
										<th>Mã sản phẩm</th>
										<th>Hình ảnh</th>
										<th>Tên sản phẩm</th>
										<th>Giá tiền</th>
										<th>Số lượng</th>
										<th>Đã bán</th>
										<th>Chỉnh sửa</th>
										<th>Ngừng bán</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="p" items="${products }">
										<tr>
											<td>${p.productId }</td>
											<td>
												<img alt="" src="${p.image }" width="100rem">
											</td>
											<td>${p.name }</td>
											<td><fmt:formatNumber value="${p.price }"
													maxFractionDigits="2" type="number"></fmt:formatNumber>đ</td>
											<td>${p.quantity }</td>
											<td>${p.sold }</td>
											<td>
												<a>Chỉnh sửa</a>
											</td>
											<td>
												<a>Ngừng bán</a>
											</td>
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

<script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
<script>
	$(document).ready(function() {
		$("#example").DataTable({
			lengthMenu : [ 5, 10, 20, 30, 50, 100 ]
		});
	});
</script>