<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="row mt-6">
	<form action='<c:url value="/admin/update-storelevel"/>' method="post">
		<div class="card">
			<div class="card-header">
				<h2>Update store level</h2>
			</div>
			<div class="form-group">
				<label>Store level ID:</label> <input readonly="readonly" type="text"
					class="form-control" placeholder="Store level ID" name="storeLevelId"
					value="${storeLevel.storeLevelId}" />
			</div>
			<div class="form-group">
				<label>Store level name:</label> <input type="text"
					class="form-control" placeholder="Store level name" name="name" id="name" value="${storeLevel.name }" />
			</div>
			<div class="form-group">
				<label>Minimum point:</label> <input type="text"
					class="form-control" placeholder="Minimum point" name="minPoint" id="minPoint" value="${storeLevel.minPoint }" />
			</div>
			<div class="form-group">
				<label>Discount:</label> <input type="text"
					class="form-control" placeholder="Discount" name="discount" id="discount" value="${storeLevel.discount }" />
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
