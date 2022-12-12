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
body > section.sproduct > div > div > div.row > form > div > div:nth-child(5) > button {
	width: 12rem; 
	margin-right: 1rem;
}
</style>
<div class="row" style="display: flex; flex: 0.9; margin-left: 2rem">
	<form style="width: 100%"
		action='<c:url value="/admin/add-userlevel"/>' method="post">
		<div class="card" style="padding: 1rem; font-size: 1.7rem">
			<div class="card-header">
				<h2>Add new user level</h2>
			</div>
			<div class="form-group">
				<label>User level name:</label> <input type="text"
					class="form-control" placeholder="User level name" name="name"
					id="name" />
			</div>
			<div class="form-group">
				<label>Minimum point:</label> <input type="text"
					class="form-control" placeholder="Minimum point" name="minPoint"
					id="minPoint" />
			</div>
			<div class="form-group">
				<label>Discount:</label> <input type="text" class="form-control"
					placeholder="Discount" name="discount" id="discount" />
			</div>
			<div style="display: flex; justify-content: flex-start;">
				<button type="reset" class="btn-buy">Reset</button>
				<button type="submit" class="btn-buy"
					onclick="javascript:return YNConfirmation()">Add</button>
			</div>
		</div>



	</form>
</div>

<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>
