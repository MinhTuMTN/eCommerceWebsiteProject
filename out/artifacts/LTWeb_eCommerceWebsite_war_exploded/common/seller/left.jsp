<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
.my-active, .my-active a {
	background-color: coral;
	color: white;
}
a {
	text-decoration: none;
	color: black;
}
li div.orders-count {
	display: inline-flex;
	font-weight: bold;
	justify-content: center;
	align-items: center;
	width: 2rem;
	height: 2rem;
	border-radius: 50%;
	background-color: coral;
	color: white;		
}
li div.orders-count-active {
	background-color: white;
	color: coral;
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
			<li class="list-group-item a-cate-detai ${fnProfile ? 'my-active': '' }"
				style="font-size: 15px; height: 4.25rem; padding-left: 3.5rem;"><a
				href='<c:url value="/seller/home" ></c:url>' >Thông
					tin cửa hàng</a></li>
			<li class="list-group-item ${fnOrders ? 'my-active': '' }"
				style="font-size: 15px; padding-left: 3.5rem;"><a
				href="<c:url value="/seller/orders" ></c:url>" class="a-cate-detai">Đơn
					hàng <div class="orders-count ${fnOrders? 'orders-count-active': '' }">${ordersCount }</div></a></li>
			<li class="list-group-item ${fnProducts ? 'my-active': '' }"
				style="font-size: 15px; padding-left: 3.5rem;"><a
				href="<c:url value="/seller/products" ></c:url>"
				class="a-cate-detai">Sản phẩm <div class="orders-count ${fnProducts? 'orders-count-active': '' }">${productsSoldOut }</div></a></li>
			<li class="list-group-item ${fnStatistic ? 'my-active': '' }"
				style="font-size: 15px; padding-left: 3.5rem;"><a
				href="<c:url value="/seller/statistics" ></c:url>" class="a-cate-detai">Thống
					kê</a></li>
		</ul>
	</div>
	<!--Danh mục profile ends-->
</div>