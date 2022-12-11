<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="row mt-6">
	<form action='<c:url value="/admin/update-category"/>' method="post"
		enctype="multipart/form-data">
		<div class="card">
			<div class="card-header">
				<h2>Update category</h2>
			</div>
			<div class="form-group">
				<label>Category ID:</label> <input readonly="readonly" type="text"
					class="form-control" placeholder="Category ID" name="categoryId"
					value="${category.categoryId}" />
			</div>
			<label>Category name:</label> <input type="text" class="form-control"
				placeholder="Category name" name="name" value="${category.name}" />
		</div>

		<div class="form-group">
			<c:url value="/image?fname=${category.image }&fileFolder=Categories"
				var="imageUrl"></c:url>
			<label>Image:</label> <img class="img-responsive" width="100px"
				src="${imageUrl}" alt=""> <input type="file" name="image"
				value="${imageUrl}" />
		</div>
		<div class="card-footer text-muted">
			<button type="reset" class="btn btn-primary">Reset</button>
			<button type="submit" class="btn btn-default" onclick="javascript:return YNConfirmation()">Update</button>
		</div>

	</form>
</div>
<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>