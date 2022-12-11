<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="col">
	<div class="row">
		<div class="col-md-12">
			<div class="row mt-2 md-2">
				<div class="col-md-6 float-right">
					<h3>Total: ${totalUsers} users</h3>
					<a style="margin: 2rem 0rem" href="<c:url value="/admin/statistics"/>" class="button-81"
						role="button"> <i class="fa fa-line-chart"></i>Show statistics
					</a>
				</div>
			</div>
			<div
				class="user-dashboard-info-box table-responsive mb-0 bg-white p-4 shadow-sm">
				<table class="table manage-candidates-top mb-0">
					<thead>
						<tr>
							<th class="text-center">Candidate Information</th>
							<th class="text-center">Status</th>
							<th class="action text-center">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users }" var="user">
							<tr class="candidates-list">
								<td class="title">
									<div class="thumb" style="width: 50%;">
										<img class="img-fluid"
											src="https://bootdey.com/img/Content/avatar/avatar7.png"
											alt="">
									</div>
									<div class="candidate-list-details">
										<div class="candidate-list-info">
											<div class="candidate-list-title">
												<h3 class="mb-1">
													<a
														href="<c:url value="/admin/user-detail?userId=${user.userId }"/>">${user.firstName }
														${user.lastName }</a>
												</h3>
											</div>
											<div class="candidate-list-option">
												<ul class="list-unstyled">
													<li><i class="fas fa-envelope pr-1"></i>${user.email }</li>
													<li><i class="fas fa-phone pr-1"></i>${user.phone }</li>
												</ul>
											</div>
										</div>
									</div>
								</td>
								<td class="candidate-list-favourite-time text-center">
									<div class="candidate-list-favourite-time">
										<h4>
											<span class="candidate-list-time order-1"><i
												class="far fa-clock pr-1"></i> <c:if
													test="${user.isActived}">
													<span>Active</span>
												</c:if> <c:if test="${!user.isActived}">
													<span>Inactive</span>
												</c:if> </span>
										</h4>
									</div>
								</td>
								<td>
									<div class="text-right">
										<a role="button" class="btn btn-primary btn-sm"
											href="<c:url value="/admin/user-detail?userId=${user.userId }"/>">
											<i class="far fa-eye"> Read More</i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-center mt-3 mt-sm-3">

					<c:if test="${totalPages > 0 }">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-end mb-0">
								<li
									class="${1==(number + 1) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/users?page=${0 }'/>' tabindex="-1">First</a>
								</li>
								<c:forEach var="i" begin="${number-1 < 0 ? 0 : number-1 }"
									end="${number+2 }">
									<c:if test="${i > 0 && i < totalPages}">
										<li class="${i==number ? 'page-item active': 'page-item' }">
											<a class="page-link"
											href="<c:url value='/admin/users?page=${i }'/>">${i + 1 }</a>
										</li>
									</c:if>


								</c:forEach>
								<li
									class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href='<c:url value='/admin/users?page=${totalPages }'/>'
									tabindex="-1">Last</a>
							</ul>
						</nav>
					</c:if>

				</div>
			</div>
		</div>
	</div>
</div>
