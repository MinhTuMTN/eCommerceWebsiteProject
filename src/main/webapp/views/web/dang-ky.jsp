<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="row justify-content-center" style="margin-top: 9rem">
	<div style="font-size: 1.7rem" class="col-6">
		<form action="" method="post" class="mb-3">
			<div>
				<label class="form-label">First name:</label> <input
					class="form-control" type="text" name="firstName"
					required="required"> <br>
			</div>

			<div>
				<label class="form-label">Last name:</label> <input
					class="form-control" type="text" name="lastName"
					required="required"> <br>
			</div>

			<div>
				<label class="form-label">Address:</label> <input
					class="form-control" type="text" name="address" required="required">
				<br>
			</div>

			<div>
				<label class="form-label">Email:</label> <input class="form-control"
					type="email" name="email" required="required"> <br>
			</div>

			<div>
				<label class="form-label">Phone:</label> <input class="form-control"
					type="text" name="phone" required="required"> <br>
			</div>

			<div>
				<label class="form-label">Password:</label> <input
					class="form-control" type="text" name="password"
					required="required"> <br>
			</div>


			<button type="submit" class="btn btn-primary mb-3">Register</button>
		</form>
	</div>
</div>