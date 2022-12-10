<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
input {
	width: 100%;
	height: 4rem;
	padding: 1rem;
	border-radius: 10px;
	text-transform: none;
}

div label{
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
		<h1 style="margin-bottom: 30px">Đăng ký</h1>
		<form action="" method="post" style="text-transform: none !important; font-size: 1.7rem">
			<div>
				<label >First name:</label> <input
				 type="text" style="text-transform: none;font-size: 1.7rem;" name="firstName"
					required="required"> <br>
			</div>

			<div>
				<label >Last name:</label> <input
					type="text" style="text-transform: none;font-size: 1.7rem;" name="lastName"
					required="required"> <br>
			</div>

			<div>
				<label >Address:</label> <input
					type="text" style="text-transform: none;font-size: 1.7rem;" name="address" required="required">
				<br>
			</div>

			<div>
				<label >Email:</label> <input
					type="email" name="email" style="text-transform: none;font-size: 1.7rem;" required="required"> <br>
			</div>

			<div>
				<label >Phone:</label> <input 
					type="text" name="phone" style="text-transform: none;font-size: 1.7rem;" required="required" pattern="[0][789][0-9]{8}"> <br>
			</div>

			<div>
				<label >Password:</label> <input
					 type="password" style="text-transform: none;font-size: 1.7rem;" name="password"
					required="required"> <br>
			</div>


			<button type="submit" class="btn-buy  mb-3">Register</button>
		</form>
	</div>
</section>