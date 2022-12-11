<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="row">
	<div class="container">
		<div class="row mt-2 md-2">
			<div class="col-md-6 float-right">
				<a class="button-81" role="button"
					href="<c:url value="/admin/add-style"/>">Add New Style</a>
			</div>
		</div>
		<table class="table manage-candidates-top mb-0">
			<thead>
				<tr>
					<th>Style ID</th>
					<th>Name</th>
					<th>Category ID</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${styles}" var="style">
					<tr class="odd gradeX">
						<td>${style.styleId }</td>

						<td>${style.name}</td>
						<td>${style.category.categoryId}</td>
						<td><c:if test="${style.isDeleted == true}">
								<span>Deleted</span>
							</c:if> <c:if test="${style.isDeleted == false}">
								<span>Active</span>
							</c:if></td>
						<td><a
							href="<c:url value="/admin/style-detail?styleId=${style.styleId}"/>"
							class="button-81" role="button"><i class="fa fa-info"></i></a> <a
							href="<c:url value="/admin/update-style?styleId=${style.styleId}"/>"
							class="button-81" role="button"><i class="fa fa-edit"></i></a> <c:if
								test="${style.isDeleted == true}">
								<a
									href="<c:url value="/admin/restore-style?styleId=${style.styleId}"/>"
									class="button-81" role="button"
									onclick="javascript:return YNConfirmation()"><i
									class="fa fa-refresh"></i></a>
							</c:if> <c:if test="${style.isDeleted == false}">
								<a
									href="<c:url value="/admin/delete-style?styleId=${style.styleId}"/>"
									class="button-81" role="button"
									onclick="javascript:return YNConfirmation()"> <i
									class="fa fa-trash"></i></a>
							</c:if></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center mt-3 mt-sm-3">

			<c:if test="${totalPages > 0 }">
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-end mb-0">
						<li class="${1==(number + 1) ? 'page-item active': 'page-item' }">
							<a class="page-link"
							href='<c:url value='/admin/styles?filter=${filter }&page=${0 }'/>'
							tabindex="-1">First</a>
						</li>
						<c:forEach var="i" begin="${number-1 < 0 ? 0 : number-1 }"
							end="${number+2 }">
							<c:if test="${i > 0 && i < totalPages}">
								<li class="${i==number ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href="<c:url value='/admin/styles?filter=${filter }&page=${i }'/>">${i + 1 }</a>
								</li>
							</c:if>


						</c:forEach>
						<li
							class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
							<a class="page-link"
							href='<c:url value='/admin/styles?filter=${filter }&page=${totalPages }'/>'
							tabindex="-1">Last</a>
					</ul>
				</nav>
			</c:if>

		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>