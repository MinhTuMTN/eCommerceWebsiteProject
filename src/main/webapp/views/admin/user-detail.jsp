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
		<div class="col-md-12">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>User ID</th>
						<th>Avatar</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Address</th>
						<th>Created At</th>
						<th>Updated At</th>
						<th>E Wallet</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Point</th>
						<th>Role</th>
						<th>Salt</th>
						<th>Slug</th>
						<th>User Level ID</th>
					</tr>
				</thead>
				<tbody>
					<tr class="odd gradeX">
						<td>${user.userId }</td>
						<td>
							<%-- <c:url
								value="/image?fname=video/${item.poster!=null?item.poster:'uploads/abc.jpg'}"
								var="imgUrl"></c:url> --%> <img width="50px" height="50px"
							src="https://bootdey.com/img/Content/avatar/avatar7.png">
						</td>
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
