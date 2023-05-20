<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<style>
body {
	margin-top: 20px;
	background: #eee;
	font-size: 1.7rem;
}

.ui-w-40 {
	width: 40px !important;
	height: auto;
}

.card {
	box-shadow: 0 1px 15px 1px rgba(52, 40, 104, .08);
}

.ui-product-color {
	display: inline-block;
	overflow: hidden;
	margin: .144em;
	width: .875rem;
	height: .875rem;
	border-radius: 10rem;
	-webkit-box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;
	box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;
	vertical-align: middle;
}
</style>

<section style="padding-top: 10rem; padding-bottom: 7rem;">
	<div class="box-container pb-2">
		<!-- Shopping cart table -->
		<div class="card">
			<div class="card-header">
				<h2 style="font-size: 2.3rem">Shopping Cart</h2>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered m-0">
						<thead>
							<tr>
								<!-- Set columns width -->
								<th class="text-center py-3 px-4" style="min-width: 400px;">Product
									Name &amp; Details</th>
								<th class="text-right py-3 px-4" style="width: 100px;">Price</th>
								<th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
								<th class="text-right py-3 px-4" style="width: 100px;">Total</th>
								<th class="text-center align-middle py-3 px-0"
									style="width: 40px;"><a href="#"
									class="shop-tooltip float-none text-light" title=""
									data-original-title="Clear cart"><i
										class="ino ion-md-trash"></i></a></th>
								<th class="text-center align-middle py-3 px-0"
									style="width: 40px;"><a href="#"
									class="shop-tooltip float-none text-light" title=""
									data-original-title="Clear cart"><i
										class="ino ion-md-trash"></i></a></th>
							</tr>
						</thead>
						<tbody>
							<c:set var="total" value="${0}"></c:set>
							<c:forEach items="${cartItems }" var="c">
							<c:url
											value="/removeCart?productId=${c.product.productId }"
											var="URLRemove"></c:url>
								<c:set var="total" value="${total + c.product.price * c.count}"></c:set><tr>
								<form action="" method="post">
								<input hidden="hidden" name="productId"
										value="${c.product.productId }">
								<td class="p-4">
										<div class="media align-items-center">
										<c:if test="${fn:startsWith(c.product.image, 'http')}">
											<img src="${c.product.image }"
												class="d-block ui-w-40 ui-bordered mr-4" alt="">
										</c:if>
										<c:if test="${!fn:startsWith(c.product.image, 'http')}">
											<img src="image?fileFolder=Products&fname=${c.product.image }"
												class="d-block ui-w-40 ui-bordered mr-4" alt="">
										</c:if>
											<div class="media-body">
												<c:url
													value="/product-details?productId=${c.product.productId }"
													var="URLDetails"></c:url>
												<a href="${URLDetails}" class="d-block text-dark">${c.product.name }</a>
												<small> <span class="text-muted">Category:</span> <span>&nbsp;
														${c.product.category.name } &nbsp;</span>
												</small>
											</div>
										</div>
									</td>
									<td class="text-right font-weight-semibold align-middle p-4"><fmt:formatNumber
											type="number" maxFractionDigits="2"
											value="${c.product.price}" />đ</td>
									<td class="align-middle p-4"><input type="number"
										style="font-size: 1.5rem;" name="quantityU"
										class="form-control text-center" min=0 value="${c.count }"></td>
									<td class="text-right font-weight-semibold align-middle p-4"><fmt:formatNumber
											type="number" maxFractionDigits="2"
											value="${c.product.price * c.count}" />đ</td>
									<td class="text-center align-middle px-0">
										<button type="submit"
											class="shop-tooltip close float-none text-success">
											<i class="fas fa-pencil-alt"></i>
										</button>
									</td>
									<td class="text-center align-middle px-0"><a
									href='${URLRemove }'
									class="shop-tooltip close float-none text-danger" title=""
									data-original-title="Remove">×</a></td>	
								</form>
								</tr>	
								
									
									
									
									
									
								
								
								
							</c:forEach>

						</tbody>
					</table>
				</div>
				<!-- / Shopping cart table -->

				<div
					class="d-flex flex-wrap justify-content-between align-items-center pb-4">
					<div class="mt-4">
						<label class="text-muted font-weight-normal">Promocode</label> <input
							type="text" placeholder="ABC" class="form-control">
					</div>
					<div class="d-flex">
						<div class="text-right mt-4 mr-5">
							<label class="text-muted font-weight-normal m-0">Discount</label>
							<div class="text-large">
								<strong>0đ</strong>
							</div>
						</div>
						<div class="text-right mt-4">
							<label class="text-muted font-weight-normal m-0">Total
								price</label>
							<div class="text-large">
								<strong><fmt:formatNumber type="number"
										maxFractionDigits="2" value="${total}" />đ</strong>
							</div>
						</div>
					</div>
				</div>

				<div class="float-right">
					<a href="<c:url value="/products"/>">
						<button type="button" class="btn-buy">Back to shopping</button>
					</a> <a href="<c:url value="/payment"/>">
						<button type="button" class="btn-buy"
							style="background-color: #428a7a">Checkout</button>
					</a>
				</div>

			</div>
		</div>
	</div>
</section>