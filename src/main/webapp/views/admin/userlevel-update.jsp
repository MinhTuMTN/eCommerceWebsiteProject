<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="row mt-6">
	<form action='<c:url value="/admin/update-userlevel"/>' method="post">
		<div class="card">
			<div class="card-header">
				<h2>Update user level</h2>
			</div>
			<div class="form-group">
				<label>User level ID:</label> <input readonly="readonly" type="text"
					class="form-control" placeholder="User level ID" name="userLevelId"
					value="${userLevel.userLevelId}" />
			</div>
			<div class="form-group">
				<label>User level name:</label> <input type="text"
					class="form-control" placeholder="User level name" name="name" id="name" value="${userLevel.name }" />
			</div>
			<div class="form-group">
				<label>Minimum point:</label> <input type="text"
					class="form-control" placeholder="Minimum point" name="minPoint" id="minPoint" value="${userLevel.minPoint }" />
			</div>
			<div class="form-group">
				<label>Discount:</label> <input type="text"
					class="form-control" placeholder="Discount" name="discount" id="discount" value="${userLevel.discount }" />
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
