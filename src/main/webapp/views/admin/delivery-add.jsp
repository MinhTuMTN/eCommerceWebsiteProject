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
	<form action='<c:url value="/admin/add-delivery"/>' method="post">
		<div class="card">
			<div class="card-header">
				<h2>Add new delivery unit</h2>
			</div>
			<div class="form-group">
				<label>Delivery unit name:</label> <input type="text"
					class="form-control" placeholder="Delivery unit name" name="name"
					id="name" />
			</div>
			<div class="form-group">
				<label>Price:</label> <input type="text" class="form-control"
					placeholder="Price" name="price" id="price" />
			</div>
			<div class="form-group">
				<label>Description:</label> <input type="text" class="form-control"
					placeholder="Description" name="description" id="description" />
			</div>
			<div style="display: flex; justify-content: flex-start;">
				<button type="reset" class="btn-buy"
					style="background-color: #cf4036">Reset</button>
				<button type="submit" class="btn-buy"
					onclick="javascript:return YNConfirmation()">Add</button>
			</div>
		</div>
	</form>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>
