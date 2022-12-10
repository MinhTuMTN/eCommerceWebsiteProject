<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="row mt-6">
	<form action='<c:url value="/admin/update-delivery"/>' method="post">
		<div class="card">
			<div class="card-header">
				<h2>Update delivery unit</h2>
			</div>
			<div class="form-group">
				<label>Delivery unit ID:</label> <input readonly="readonly" type="text"
					class="form-control" placeholder="Delivery unit ID" name="deliveryId"
					value="${delivery.deliveryId}" />
			</div>
			<div class="form-group">
				<label>Delivery name:</label> <input type="text"
					class="form-control" placeholder="Delivery name" name="name" id="name" value="${delivery.name }" />
			</div>
			<div class="form-group">
				<label>Price:</label> <input type="text"
					class="form-control" placeholder="Price" name="price" id="price" value="${delivery.price }" />
			</div>
			<div class="form-group">
				<label>Description:</label> <input type="text"
					class="form-control" placeholder="Description:" name="description" id="description" value="${delivery.description }" />
			</div>
		</div>
		
		<div class="card-footer text-muted">
			<button type="reset" class="btn btn-primary">Reset</button>
			<button type="submit" class="btn btn-default" onclick="javascript:return YNConfirmation()">Update</button>
		</div>

	</form>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>
