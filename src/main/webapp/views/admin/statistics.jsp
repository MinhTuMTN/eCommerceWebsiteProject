<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="col">
	<div class="row">
		<div class="col-md-12">
			<div class="card-header">
				<h2>Top 3 Users With Most Amount</h2>
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>User ID</th>
						<th>Avatar</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${top3Users}" var="user">
						<tr class="odd gradeX">
							<td>${user.userId }</td>
							<td><c:set value="${user.avatar}" var="avatarUrl" /> <c:choose>
									<c:when test="${fn:substring(avatarUrl, 0, 4) == 'http' }">
										<c:url value="${user.avatar}" var="userAvatarUrl"></c:url>

									</c:when>
									<c:otherwise>
										<c:url value="/image?fname=${user.avatar}&fileFolder=Users"
											var="userAvatarUrl"></c:url>

									</c:otherwise>
								</c:choose> <img src="${userAvatarUrl}" width="100px" alt="${user.slug}"></td>
							<td><a
								href="<c:url value="/admin/user-detail?userId=${user.userId }"/>">${user.firstName }
									${user.lastName }</a></td>
							<td>${user.phone }</td>
							<td>${user.email }</td>
							<td><a
								href="<c:url value="/admin/user-detail?userId=${user.userId }"/>"
								class="button-81" role="button"><i class="fa fa-info"></i>
									Read more</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
