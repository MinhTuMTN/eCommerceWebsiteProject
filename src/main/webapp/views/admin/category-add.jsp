<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="row mt-6">
	<form action='<c:url value="/admin/add-category"/>' method="post"
		enctype="multipart/form-data">
		<div class="card">
			<div class="card-header">
				<h2>Add new category</h2>
			</div>
			<div class="form-group">
				<label>Category name:</label> <input type="text"
					class="form-control" placeholder="Category name" name="name" id="name" />
			</div>

		</div>
		<div class="form-group">
			<label>Image</label> <input type="file" name="image" />
		</div>
		<div class="card-footer text-muted">
			<button type="reset" class="btn btn-primary">Reset</button>
			<button type="submit" class="btn btn-default" onclick="javascript:return YNConfirmation()">Add</button>
		</div>

	</form>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>
