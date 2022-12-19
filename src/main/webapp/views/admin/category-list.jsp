<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
td i {
	font-size: 1.8rem !important;
}
</style>

<div class="row" style="flex: 1; font-size: 1.7rem !important;">
	<div class="container" style="width: 100%">
		<div class="row mt-2 md-2">
			<div class="col-md-6 float-right">
				<a class="btn-buy" style="font-size: 1.3rem; margin-bottom: 1.5rem;"
					role="button" href="<c:url value="/admin/add-category"/>">Add
					New Category</a>
			</div>
		</div>
		<form action="<c:url value="/admin/search-categories"/>">
			<div class="input-group">
				<input type="search" class="form-control rounded"
					placeholder="Search" aria-label="Search"
					aria-describedby="search-addon" value="${searchText }"
					name="search-text" />
				<button type="submit" class="button-81">Search</button>
			</div>
		</form>
		<table class="table table-striped table-bordered table-hover"
			style="width: 100%">
			<thead>
				<tr>
					<th>Category ID</th>
					<th>Image</th>
					<th>Name</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${categories}" var="category">
					<tr class="odd gradeX">
						<td>${category.categoryId }</td>
						<td style="text-align: center;"><c:set
								value="${category.image}" var="imageUrl" /> <c:choose>
								<c:when test="${fn:substring(imageUrl, 0, 4) == 'http' }">
									<c:url value="${category.image}" var="categoryImgUrl"></c:url>

								</c:when>
								<c:otherwise>
									<c:url
										value="/image?fname=${category.image}&fileFolder=Categories"
										var="categoryImgUrl"></c:url>

								</c:otherwise>
							</c:choose> <img src="${categoryImgUrl}" width="100px"
							alt="${category.name}"></td>
						<td>${category.name}</td>
						<td><c:if test="${category.isDeleted == true}">
								<span>Deleted</span>
							</c:if> <c:if test="${category.isDeleted == false}">
								<span>Active</span>
							</c:if></td>
						<td style="text-align: center;"><a
							href="<c:url value="/admin/category-detail?categoryId=${category.categoryId}"/>"
							class="button-81" role="button"><i class="fa fa-info"></i></a> <a
							href="<c:url value="/admin/update-category?categoryId=${category.categoryId}"/>"
							class="button-81" role="button"><i class="fa fa-edit"></i></a> <c:if
								test="${category.isDeleted == true}">
								<a
									href="<c:url value="/admin/restore-category?categoryId=${category.categoryId}"/>"
									class="button-81" role="button"
									onclick="javascript:return YNConfirmation()"><i
									class="fa fa-refresh"></i></a>
							</c:if></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center mt-3 mt-sm-3">

			<c:if test="${isSearch }">
					<c:if test="${totalPages > 0 }">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-end">
								<li
									class="${1==(number + 1) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/search-categories?search-text=${searchText }&?page=${0 }'/>'
									tabindex="-1">First</a>
								</li>
								<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
									end="${number+2 }">
									<c:if test="${i > 0 && i < totalPages}">
										<li class="${i==number ? 'page-item active': 'page-item' }">
											<a class="page-link"
											href="<c:url value='/admin/search-categories?search-text=${searchText }&page=${i }'/>">${i + 1 }</a>
										</li>
									</c:if>
								</c:forEach>
								<li
									class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/search-categories?search-text=${searchText }&?page=${totalPages }'/>'
									tabindex="-1">Last</a>
							</ul>
						</nav>
					</c:if>
				</c:if>
				<c:if test="${!isSearch }">
					<c:if test="${totalPages > 0 }">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-end">
								<li
									class="${1==(number + 1) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/categories?page=${0 }'/>' tabindex="-1">First</a>
								</li>
								<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
									end="${number+2 }">
									<c:if test="${i > 0 && i < totalPages}">
										<li class="${i==number ? 'page-item active': 'page-item' }">
											<a class="page-link"
											href="<c:url value='/admin/categories?page=${i }'/>">${i + 1 }</a>
										</li>
									</c:if>
								</c:forEach>
								<li
									class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/categories?page=${totalPages }'/>'
									tabindex="-1">Last</a>
							</ul>
						</nav>
					</c:if>
				</c:if>

		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>