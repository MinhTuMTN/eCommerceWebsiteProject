<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<style>
input {
	width: 100%;
	height: 4rem;
	padding: 1rem;
	border-radius: 10px;
	text-transform: none;
}

label{
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
		<h1>Đổi mật khẩu</h1>
		<form action="<c:url value="/change-password" />" method="POST"
			style="text-transform: none !important; font-size: 1.7rem">
			<label for="">Mật khẩu cũ:</label><br /> <input type="password"
				name="oldPassword" required /><br /> <label for="">Mật
				khẩu mới:</label><br /> <input type="password" name="newPassword" required
				id="newPassword" oninput="check_pass()" /><br /> <label
				for="">Nhập lại mật khẩu mới:</label><br /> <input type="password"
				name="reNewPassword" required id="reNewPassword"
				oninput="check_pass()" /><br />
			<label style="font-size: 1.3rem; color: red; font-style: italic" id="message">Mật khẩu không khớp</label><br/>
			<button class="btn-buy" type="submit" id="submit">
				Đổi mật khẩu</button>
		</form>
	</div>
</section>
<script>
	document.getElementById("message").style.visibility = "hidden";
	function check_pass() {
		if (document.getElementById("newPassword").value == document
				.getElementById("reNewPassword").value) {
			document.getElementById("submit").disabled = false;
			document.getElementById("message").style.visibility = "hidden";
		} else {
			document.getElementById("submit").disabled = true;
			document.getElementById("message").style.visibility = "visible";
		}
	}
</script>