<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="row">
	<div class="container">
		<table class="table manage-candidates-top mb-0">
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
						<td><c:set value="${store.avatar}" var="imageUrl" /> <c:choose>
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
						<td><a
							href="<c:url value="/admin/store-detail?storeId=${store.storeId}"/>"
							class="button-81" role="button"><i class="fa fa-info"></i>
								Read more</a> <a
							href="<c:url value="/admin/statistic-revenue?storeId=${store.storeId }"/>"
							class="button-81" role="button"> <i class="fa fa-line-chart"></i></a>
							<c:if test="${store.isActive == false}">
								<a
									href="<c:url value="/admin/license-store?storeId=${store.storeId}&licensed=1"/>"
									class="button-81" role="button"
									onclick="javascript:return YNConfirmation()"><i
									class="fa fa-check-circle-o"></i> License</a>
							</c:if> <c:if test="${store.isActive == true}">
								<a
									href="<c:url value="/admin/license-store?storeId=${store.storeId}&licensed=0"/>"
									class="button-81" role="button"
									onclick="javascript:return YNConfirmation()"> <i
									class="fa fa-ban"></i> Ban
								</a>
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
							href='<c:url value='/admin/stores?filter=${filter }&page=${0 }'/>'
							tabindex="-1">First</a>
						</li>
						<c:forEach var="i" begin="${number-1 < 0 ? 0 : number-1 }"
							end="${number+2 }">
							<c:if test="${i > 0 && i < totalPages}">
								<li class="${i==number ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href="<c:url value='/admin/stores?filter=${filter }&page=${i }'/>">${i + 1 }</a>
								</li>
							</c:if>


						</c:forEach>
						<li
							class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
							<a class="page-link"
							href='<c:url value='/admin/stores?filter=${filter }&page=${totalPages }'/>'
							tabindex="-1">Last</a>
					</ul>
				</nav>
			</c:if>

		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/views/js/confirmation.js"></script>