<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
input {
	width: 80%;
	height: 4rem;
	padding: 1rem;
	border-radius: 10px;
	text-transform: none;
}

.change-password {
	width: 100vw;
	display: flex;
	justify-content: center;
	margin-top: 10rem;
	margin-bottom: 5rem;
}
</style>
<section class="change-password">
	<div style="width: 50%">
		<h1>Change Information</h1>
		<form action=""
			style="text-transform: none !important; font-size: 1.7rem"
			method="post">
			<label for="">First name:</label><br /> <input type="text"
				name="firstName" required value="${user.firstName }" /><br /> <label
				for="">Last name:</label><br /> <input type="text" name="lastName"
				required id="newPassword" value="${user.lastName }" /><br /> <label
				for="" >Phone number:</label><br /> <input type="text" name="phone" pattern="[0][789][0-9]{8}"
				required id="reNewPassword" value="${user.phone }" /><br /> <label
				for="" style="text-transform: none">Email address:</label><br /> <input
				type="email" name="email" required id="reNewPassword"
				value="${user.email }" /><br /> <label for="">Address:</label><br />
			<input type="text" name="address" style="text-transform: none"
				required id="reNewPassword" value="${user.address }" /><br />
			<button class="btn-buy" type="submit" id="submit">
				Change</button>
		</form>
	</div>
</section>