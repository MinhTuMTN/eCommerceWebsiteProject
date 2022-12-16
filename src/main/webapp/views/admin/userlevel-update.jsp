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

body > section.sproduct > div > div > div.row > form > div {
	padding: 1rem;
	font-size: 1.7rem
}
</style>
<div class="row" style="display: flex; flex: 0.9; margin-left: 2rem">
	<form style="width: 100%; padding: 1rem; font-size: 1.7rem"
		action='<c:url value="/admin/update-userlevel"/>' method="post">
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
					class="form-control" placeholder="User level name" name="name"
					id="name" value="${userLevel.name }" />
			</div>
			<div class="form-group">
				<label>Minimum point:</label> <input type="text"
					class="form-control" placeholder="Minimum point" name="minPoint"
					id="minPoint" value="${userLevel.minPoint }" />
			</div>
			<div class="form-group">
				<label>Discount:</label> <input type="text" class="form-control"
					placeholder="Discount" name="discount" id="discount"
					value="${userLevel.discount }" />
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
