<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<style>
th {
	width: 17rem;
}

table {
	font-size: 1.7rem !important;
}
</style>
<div class="col">
	<div class="row">
		<div class="col-md-12" style="display: flex;flex-direction: column; justify-content: center;">
			<div style="display: flex; align-items: center; margin-bottom: 4rem; flex-direction: column;">
				<img width="200px" height="200px" style="border-radius: 50%; border: 2px solid coral;"
					src="https://bootdey.com/img/Content/avatar/avatar7.png">
				<div style="font-weight: bold; margin-top: 1rem; font-size: 1.7rem">User ID: ${user.userId }</div>
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th style="text-align: left !important;">First Name</th>
						<th style="text-align: left !important;">Last Name</th>
						<th style="text-align: left !important;">Address</th>
						<th style="text-align: left !important;">Created At</th>
						<th style="text-align: left !important;">Updated At</th>
						<th style="text-align: left !important;">E Wallet</th>
						<th style="text-align: left !important;">Email</th>
						<th style="text-align: left !important;">Phone</th>
						<th style="text-align: left !important;">Point</th>
						<th style="text-align: left !important;">Role</th>
						<th style="text-align: left !important;">Salt</th>
						<th style="text-align: left !important;">Slug</th>
						<th style="text-align: left !important;">User Level ID</th>
					</tr>
				</thead>
				<tbody>
					<tr class="odd gradeX">
						<td>${user.firstName }</td>
						<td>${user.lastName }</td>
						<td>${user.address }</td>
						<td>${user.createdAt }</td>
						<td>${user.updatedAt }</td>
						<td><fmt:formatNumber value="${user.e_wallet }"
								maxFractionDigits="2" type="number" /> đ</td>
						<td>${user.email }</td>
						<td>${user.phone }</td>
						<td>${user.point }</td>
						<td><c:if test="${user.role == 2}">
								<span>User</span>
							</c:if> <c:if test="${user.role == 1}">
								<span>Seller</span>
							</c:if> <c:if test="${user.role == 0}">
								<span>Admin</span>
							</c:if></td>
						<td>${user.salt }</td>
						<td>${user.slug }</td>
						<td>${user.userLevel.userLevelId }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<style>
</style>
<script type="text/javascript">
	$("table").each(function() {
		var $this = $(this);
		var newrows = [];
		$this.find("tr").each(function() {
			var i = 0;
			var e = true;
			$(this).find("td").each(function() {
				e = false;
				i++;
				if (newrows[i] === undefined) {
					newrows[i] = $("<tr></tr>");
				}
				newrows[i].append($(this));
			});
			if (e) {
				$(this).find("th").each(function() {
					i++;
					if (newrows[i] === undefined) {
						newrows[i] = $("<tr></tr>");
					}
					newrows[i].append($(this));
				});
			}
		});
		$this.find("tr").remove();
		$.each(newrows, function() {
			$this.append(this);
		});
	});
</script>
