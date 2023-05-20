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
	<form action="<c:url value="/admin/search-stores"/>">
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
					<th>Store ID</th>
					<th>Avatar</th>
					<th>Bio</th>
					<th>Name</th>
					<th>Owner ID</th>
					<th>Rating</th>
					<th>Active Status</th>
					<th>Open Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${stores}" var="store">
					<tr class="odd gradeX">
						<td>${store.storeId }</td>
						<td style="text-align: center;"><c:set
								value="${store.avatar}" var="imageUrl" /> <c:choose>
								<c:when test="${fn:substring(imageUrl, 0, 4) == 'http' }">
									<c:url value="${store.avatar}" var="storeImgUrl"></c:url>

								</c:when>
								<c:otherwise>
									<c:url value="/image?fname=${store.avatar}&fileFolder=Stores"
										var="storeImgUrl"></c:url>

								</c:otherwise>
							</c:choose> <img src="${storeImgUrl}" width="100px" alt="${store.name}"></td>
						<td>${store.bio}</td>
						<td>${store.name}</td>
						<td>${store.user.userId}</td>
						<td>${store.rating}</td>
						<td><c:if test="${store.isActive == false}">
								<span>Banned</span>
							</c:if> <c:if test="${store.isActive == true}">
								<span>Licensed</span>
							</c:if></td>
						<td><c:if test="${store.isOpen == true}">
								<span>Open</span>
							</c:if> <c:if test="${store.isOpen == false}">
								<span>Closed</span>
							</c:if></td>
						<td style="text-align: center;"><a
							href="<c:url value="/admin/store-detail?storeId=${store.storeId}"/>"
							class="button-81" role="button"><i class="fa fa-info"></i>
								</a> <a
							href="<c:url value="/admin/statistic-revenue?storeId=${store.storeId }"/>"
							class="button-81" role="button"> <i class="fa fa-line-chart"></i></a>
							<c:if test="${store.isActive == false}">
								<a
									href="<c:url value="/admin/license-store?storeId=${store.storeId}&licensed=1"/>"
									class="button-81" role="button"
									onclick="javascript:return YNConfirmation()"><i
									class="fa fa-check-circle-o"></i></a>
							</c:if> <c:if test="${store.isActive == true}">
								<a
									href="<c:url value="/admin/license-store?storeId=${store.storeId}&licensed=0"/>"
									class="button-81" role="button"
									onclick="javascript:return YNConfirmation()"> <i
									class="fa fa-ban"></i>
								</a>
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
									href='<c:url value='/admin/search-stores?search-text=${searchText }&?page=${0 }'/>'
									tabindex="-1">First</a>
								</li>
								<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
									end="${number+2 }">
									<c:if test="${i > 0 && i < totalPages}">
										<li class="${i==number ? 'page-item active': 'page-item' }">
											<a class="page-link"
											href="<c:url value='/admin/search-stores?search-text=${searchText }&page=${i }'/>">${i + 1 }</a>
										</li>
									</c:if>
								</c:forEach>
								<li
									class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/search-stores?search-text=${searchText }&?page=${totalPages }'/>'
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
									href='<c:url value='/admin/stores?page=${0 }'/>' tabindex="-1">First</a>
								</li>
								<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
									end="${number+2 }">
									<c:if test="${i > 0 && i < totalPages}">
										<li class="${i==number ? 'page-item active': 'page-item' }">
											<a class="page-link"
											href="<c:url value='/admin/stores?page=${i }'/>">${i + 1 }</a>
										</li>
									</c:if>
								</c:forEach>
								<li
									class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/stores?page=${totalPages }'/>'
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