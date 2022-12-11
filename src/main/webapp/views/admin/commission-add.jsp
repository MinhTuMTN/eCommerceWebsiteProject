<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="row mt-6">
	<form action='<c:url value="/admin/add-commission"/>' method="post">
		<div class="card">
			<div class="card-header">
				<h2>Add new commission</h2>
			</div>
			<div class="form-group">
				<label>Commission name:</label> <input type="text"
					class="form-control" placeholder="Commission name" name="name" id="name" />
			</div>
			<div class="form-group">
				<label>Cost:</label> <input type="text"
					class="form-control" placeholder="Cost" name="cost" id="cost" />
			</div>
			<div class="form-group">
				<label>Description:</label> <input type="text"
					class="form-control" placeholder="Description" name="description" id="description" />
			</div>
		</div>
		
		<div class="card-footer text-muted">
			<button type="reset" class="btn btn-primary">Reset</button>
			<button type="submit" class="btn btn-default" onclick="javascript:return YNConfirmation()">Add</button>
		</div>

	</form>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>