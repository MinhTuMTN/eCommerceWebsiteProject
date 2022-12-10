<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="col">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Image</th>
						<th>Name</th>
						<th>Description</th>
						<th>Created At</th>
						<th>Updated At</th>
						<th>Price</th>
						<th>Promotional Pricing</th>
						<th>Quantity</th>
						<th>Sold</th>
						<th>Rating</th>
						<th>Status</th>
						<th>Is Selling</th>
						<th>Slug</th>
						<th>Video</th>
						<th>Category ID</th>
						<th>Store ID</th>
					</tr>
				</thead>
				<tbody>
					<tr class="odd gradeX">
						<td>${product.productId }</td>
						<td><img width="50px" height="50px" src="${product.image }">
						</td>
						<td>${product.name }</td>
						<td>${product.description }</td>
						<td>${product.createdAt }</td>
						<td>${product.updatedAt }</td>
						<td>${product.price }</td>
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