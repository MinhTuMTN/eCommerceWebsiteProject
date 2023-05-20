<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="col">
	<div class="row">
		<div class="col-md-12"
			style="display: flex; flex-direction: row-reverse;">
			<div style="margin-left: 2.5rem;">
				<c:if test="${fn:startsWith(product.image, 'http')}">
					<img width="300rem" height="300rem" src="${product.image }">
				</c:if>
				<c:if test="${!fn:startsWith(product.image, 'http')}">
					<img width="300rem" height="300rem"
						src="../image?fileFolder=Products&fname=${product.image }">
				</c:if>
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th style="text-align: left !important;">Product ID</th>
						<th style="text-align: left !important;">Name</th>
						<th style="text-align: left !important;">Description</th>
						<th style="text-align: left !important;">Created At</th>
						<th style="text-align: left !important;">Updated At</th>
						<th style="text-align: left !important;">Price</th>
						<th style="text-align: left !important;">Promotional Pricing</th>
						<th style="text-align: left !important;">Quantity</th>
						<th style="text-align: left !important;">Sold</th>
						<th style="text-align: left !important;">Rating</th>
						<th style="text-align: left !important;">Status</th>
						<th style="text-align: left !important;">Is Selling</th>
						<th style="text-align: left !important;">Slug</th>
						<th style="text-align: left !important;">Video</th>
						<th style="text-align: left !important;">Category ID</th>
						<th style="text-align: left !important;">Store ID</th>
					</tr>
				</thead>
				<tbody>
					<tr class="odd gradeX">
						<td>${product.productId }</td>
						<td>${product.name }</td>
						<td>${product.description }</td>
						<td>${product.createdAt }</td>
						<td>${product.updatedAt }</td>
						<td><fmt:formatNumber value="${product.price }"
								maxFractionDigits="2" type="number"></fmt:formatNumber> đ</td>
						<td>${product.prmotionalPrice }</td>
						<td>${product.quantity }</td>
						<td>${product.sold }</td>
						<td>${product.rating }</td>
						<td><c:if test="${product.isActive == true}">
								<span>Active</span>
							</c:if> <c:if test="${product.isActive == false}">
								<span>Inactive</span>
							</c:if></td>
						<td>${product.isSelling }</td>
						<td>${product.slug }</td>
						<td>${product.video }</td>
						<td>${product.category.categoryId }</td>
						<td>${product.store.storeId }</td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/views/js/menuDropdown.js"></script>


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