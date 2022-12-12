<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
table td, tr, th {
	font-size: 1.7rem;
}
body > section.sproduct > div > div > div.row > div > table > tbody > tr > th {
	width: 20%;
	text-align: left !important;
}
.row {
	flex: 0.9 !important;
}
</style>


<div class="row">
	<div class="container">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>Image</th>
					<th>Category ID</th>
					<th>Name</th>
					<th>Slug</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<tr class="odd gradeX">
					<td><c:set value="${category.image}" var="imageUrl" /> <c:choose>
							<c:when test="${fn:substring(imageUrl, 0, 4) == 'http' }">
								<c:url value="${category.image}" var="categoryImgUrl"></c:url>

							</c:when>
							<c:otherwise>
								<c:url
									value="/image?fname=${category.image}&fileFolder=Categories"
									var="categoryImgUrl"></c:url>

							</c:otherwise>
						</c:choose> <img src="${categoryImgUrl}" width="100px" alt="${category.name}"></td>
					<td>${category.categoryId }</td>
					<td>${category.name}</td>
					<td>${category.slug}</td>
					<td>${category.createdAt }</td>
					<td>${category.updatedAt }</td>
					<td><c:if test="${category.isDeleted == true}">
							<span>Deleted</span>
						</c:if> <c:if test="${category.isDeleted == false}">
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
