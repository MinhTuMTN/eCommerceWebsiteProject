<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
	integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA="
	crossorigin="anonymous" />

<section class="home" id="home">
	<div class="content">

		<h3>
			<span>Quản lý người dùng</span>
		</h3>
		<p>Xem danh sách người dùng</p>
	</div>

</section>
<div class="container">
	<div class="row">
		<div class="col">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="<c:url value="/admin/home"/>">Home</a></li>
					<li class="breadcrumb-item"><a
						href="<c:url value="/admin/users"/>">User list</a></li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-12 col-sm-3">
			<div class="sidebar card bg-light mb-3">
				<div class="card-header bg-primary text-white text-uppercase">
					<h2>
						<i class="fa fa-list"></i> Menu
					</h2>
				</div>
				<ul class="list-group category_block" id="nav_accordion">
					<li class="nav-item list-group-item"><h3>
							<a class="nav-link" href="<c:url value="/admin/users"/>">Users
								management</a>
						</h3></li>
					<li class="nav-item has-submenu list-group-item"><a
						class="nav-link" href="#">
							<h3>Products management</h3>
					</a>
						<ul class="submenu collapse">
							<li><h4>
									<a class="nav-link" href="<c:url value="/admin/products?filter=2"/>">All Products</a>
								</h4></li>
							<li><h4>
									<a class="nav-link" href="<c:url value="/admin/products?filter=1"/>">Active Products</a>
								</h4></li>
							<li><h4><a class="nav-link" href="<c:url value="/admin/products?filter=0"/>">Inactive Products</a></h4></li>
						</ul></li>
				</ul>

			</div>
		</div>

		<div class="col">
			<div class="row">
				<div class="col-md-12">
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
											<div class="thumb">
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
	</div>

</div>

<script src="${pageContext.request.contextPath}/views/js/menuDropdown.js"></script>
