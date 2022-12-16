<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
.form-group {
	margin: 1rem 0rem;
}

body>section.sproduct>div>div>div.row>form>div.card>div>input {
	width: 70%;
}

body>section.sproduct>div>div>div.row>form>div>div:nth-child(5)>button {
	width: 12rem !important;
	margin-right: 1rem !important;
}

body>section.sproduct>div>div>div.row>form>div {
	padding: 1rem;
	font-size: 1.7rem
}

body>section.sproduct>div>div>div.row>form {
	width: 100%;
	padding: 1rem;
	font-size: 1.7rem;
}
</style>

<div class="row" style="display: flex; flex: 0.9; margin-left: 2rem">
	<form action='<c:url value="/admin/update-storelevel"/>' method="post">
		<div class="card">
			<div class="card-header">
				<h2>Update store level</h2>
			</div>
			<div class="form-group">
				<label>Store level ID:</label> <input readonly="readonly"
					type="text" class="form-control" placeholder="Store level ID"
					name="storeLevelId" value="${storeLevel.storeLevelId}" />
			</div>
			<div class="form-group">
				<label>Store level name:</label> <input type="text"
					class="form-control" placeholder="Store level name" name="name"
					id="name" value="${storeLevel.name }" />
			</div>
			<div class="form-group">
				<label>Minimum point:</label> <input type="text"
					class="form-control" placeholder="Minimum point" name="minPoint"
					id="minPoint" value="${storeLevel.minPoint }" />
			</div>
			<div class="form-group">
				<label>Discount:</label> <input type="text" class="form-control"
					placeholder="Discount" name="discount" id="discount"
					value="${storeLevel.discount }" />
			</div>
			<div style="display: flex; justify-content: flex-start;">
				<button type="reset" class="btn-buy"
					style="background-color: #cf4036">Reset</button>
				<button type="submit" class="btn-buy"
					onclick="javascript:return YNConfirmation()">Update</button>
			</div>
		</div>
	</form>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>
