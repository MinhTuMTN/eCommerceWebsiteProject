<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="row mt-6">
	<form action='<c:url value="/admin/add-style"/>' method="post">
		<div class="card">
			<div class="card-header">
				<h2>Add new style</h2>
			</div>
			<div class="form-group">
				<label>Style name:</label> <input type="text" class="form-control"
					placeholder="Style name" name="name" id="name" />
			</div>
			<div class="form-group">
				<label for="categoryId">Category:</label> <select
					class="form-seclect" name="categoryId" aria-label="categoryId"
					id="categoryId">
					<c:forEach items="${categories }" var="category">
						<option value="${category.categoryId }">${category.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="card-footer text-muted">
			<button type="reset" class="btn btn-primary">Reset</button>
			<button type="submit" class="btn btn-default"
				onclick="javascript:return YNConfirmation()">Add</button>
		</div>

	</form>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>
