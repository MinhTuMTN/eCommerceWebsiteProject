<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post" class="mb-3">
		<div>
			<label class="form-label">First name:</label> <input class="form-control" type="text"
				name="firstName" required="required"> <br>
		</div>

		<div>
			<label class="form-label">Last name:</label> <input class="form-control" type="text"
				name="lastName" required="required"> <br>
		</div>

		<div>
			<label class="form-label">Address:</label> <input class="form-control" type="text"
				name="address" required="required"> <br>
		</div>

		<div>
			<label class="form-label">Email:</label> <input class="form-control" type="email"
				name="email" required="required"> <br>
		</div>

		<div>
			<label class="form-label">Phone:</label> <input class="form-control" type="text"
				name="phone" required="required"> <br>
		</div>

		<div>
			<label class="form-label">Password:</label> <input class="form-control" type="text"
				name="password" required="required"> <br>
		</div>


		<button type="submit" class="btn btn-primary mb-3">Register</button>
	</form>
</body>
</html>