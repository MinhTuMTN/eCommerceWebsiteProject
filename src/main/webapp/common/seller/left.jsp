<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
.my-active, .my-active a {
	background-color: coral;
	color: white;
}
</style>
<div class="col-12 col-sm-3">
	<!--Danh mục profile starts-->
	<div class="card bg-light mb-1">
		<div class="card-header text-white"
			style="background-color: black; font-size: 23px;">
			<i class="fa fa-user"></i> Quản lý shop
		</div>
		<ul class="list-group category_block">
			<li class="list-group-item a-cate-detai my-active"
				style="font-size: 15px; height: 4.25rem; padding-left: 3.5rem;"><a
				href='<c:url value="/seller/home" ></c:url>' >Thông
					tin cửa hàng</a></li>
			<li class="list-group-item"
				style="font-size: 15px; padding-left: 3.5rem;"><a
				href="<c:url value="/seller/orders" ></c:url>" class="a-cate-detai">Đơn
					hàng</a></li>
			<li class="list-group-item"
				style="font-size: 15px; padding-left: 3.5rem;"><a
				href="<c:url value="/seller/products" ></c:url>"
				class="a-cate-detai">Sản phẩm</a></li>
			<li class="list-group-item"
				style="font-size: 15px; padding-left: 3.5rem;"><a
				href="<c:url value="/seller/statics" ></c:url>" class="a-cate-detai">Thống
					kê</a></li>
		</ul>
	</div>
	<!--Danh mục profile ends-->
</div>