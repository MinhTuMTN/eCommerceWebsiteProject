<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
.row {
	flex: 0.9 !important;
	font-size: 1.7rem !important;
}
body > section.sproduct > div > div > div.row > div > table > tbody > tr > th {
	text-align: left !important;
	width: 20% !important;
}
</style>

<div class="row">
	<div class="container">
		<table class="table manage-candidates-top mb-0">
			<thead>
				<tr>
					<th>User Level ID</th>
					<th>Name</th>
					<th>Discount</th>
					<th>Minium Point</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Status</th>
					
				</tr>
			</thead>
			<tbody>
					<tr class="odd gradeX">
						<td>${userLevel.userLevelId }</td>
						
						<td>${userLevel.name}</td>
						<td>${userLevel.discount}</td>
						<td>${userLevel.minPoint}</td>
						<td>${userLevel.createdAt}</td>
						<td>${userLevel.updatedAt}</td>
						
						<td><c:if test="${userLevel.isDeleted == true}">
								<span>Deleted</span>
							</c:if> <c:if test="${userLevel.isDeleted == false}">
								<span>Active</span>
							</c:if></td>
					</tr>
			</tbody>
		</table>
		
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
