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
					<th>Cover</th>
					<th>Bio</th>
					<th>Name</th>
					<th>Slug</th>
					<th>Owner ID</th>
					<th>E-Wallet</th>
					<th>Store Level</th>
					<th>Point</th>
					<th>Commission ID</th>
					<th>Rating</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Active Status</th>
					<th>Open Status</th>

				</tr>
			</thead>
			<tbody>
				<tr class="odd gradeX">
					<td>${store.storeId }</td>
					<td><c:set value="${store.avatar}" var="avatarUrl" /> <c:choose>
							<c:when test="${fn:substring(avatarUrl, 0, 4) == 'http' }">
								<c:url value="${store.avatar}" var="storeAvatarUrl"></c:url>

							</c:when>
							<c:otherwise>
								<c:url value="/image?fname=${store.avatar}&fileFolder=Stores"
									var="storeAvatarUrl"></c:url>

							</c:otherwise>
						</c:choose> <img src="${storeAvatarUrl}" width="100px" alt="${store.slug}"></td>
					<td><c:set value="${store.cover}" var="coverUrl" /> <c:choose>
							<c:when test="${fn:substring(coverUrl, 0, 4) == 'http' }">
								<c:url value="${store.cover}" var="storeCoverUrl"></c:url>

							</c:when>
							<c:otherwise>
								<c:url value="/image?fname=${store.cover}&fileFolder=Stores"
									var="storeCoverUrl"></c:url>

							</c:otherwise>
						</c:choose> <img src="${storeCoverUrl}" width="100px" alt="${store.slug}"></td>
					<td>${store.bio}</td>
					<td>${store.name}</td>
					<td>${store.slug}</td>
					<td>${store.user.userId}</td>
					<td>${store.e_wallet}</td>
					<td>${store.storeLevel.storeLevelId}</td>
					<td>${store.point}</td>
					<td>${store.commission.commissionId}</td>
					<td>${store.rating}</td>
					<td>${store.createdAt}</td>
					<td>${store.updatedAt}</td>
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
				</tr>

			</tbody>
		</table>

	</div>
</div>
