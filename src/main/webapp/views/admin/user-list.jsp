<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<section class="list" id="">
	<h1 class="heading1">QUẢN LÝ NGƯỜI DÙNG</h1>
	<hr width="20%" height="10px">
	<p class="heading-product">Xem danh sách người dùng</p>

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

	<div class="row">

		<div class="col-12 col-sm-3">
			<div class="card bg-light mb-3">
				<div class="card-header bg-primary text-white text-uppercase">
					<h3>
						<i class="fa fa-list"></i> Menu
					</h3>
				</div>
				<ul class="list-group category_block">
					<li class="list-group-item"><h4>
							<a href="<c:url value="/admin/users"/>">Users management</a>
						</h4></li>
				</ul>
			</div>
		</div>

		<div class="col">
	
				<div class="row">

					<div class="col-lg-9">
						<!-- 	 -->
						<div class="row">
							<c:forEach items="${users }" var="user">
								<div class="col-sm-6 col-lg-5 mb-4">

									<div class="candidate-list candidate-grid">
										<div class="candidate-list-image">
											<img class="img-fluid"
												src="https://bootdey.com/img/Content/avatar/avatar1.png"
												alt="">
										</div>
										<div class="candidate-list-details">
											<div class="candidate-list-info">
												<div class="candidate-list-title">

													<h3>
														<a href="#">${user.firstName } ${user.lastName }</a>
													</h3>

												</div>
												<div class="candidate-list-option">
													<ul class="list-unstyled">
														<li><i class="fas fa-envelope"></i> ${user.email }</li>
														<li><i class="fas fa-phone"></i> ${user.phone }</li>
													</ul>
												</div>
											</div>
											<div class="candidate-list-favourite-time">
												<a class="candidate-list-favourite order-2" href="#"><i
													class="far fa-heart"></i></a> <span
													class="candidate-list-time order-1"><i
													class="far fa-clock pr-1"></i> <c:if
														test="${user.isActived}">
														<span>Active</span>
													</c:if> <c:if test="${!user.isActived}">
														<span>Inactive</span>
													</c:if> </span>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>

					</div>

				</div>
			</div>
		</div>

	
	<c:if test="${totalPages > 0 }">
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-end">
				<li class="${1==(number + 1) ? 'page-item active': 'page-item' }">
					<a class="page-link" href='<c:url value='/admin/users?page=${0 }'/>'
					tabindex="-1">First</a>
				</li>
				<c:forEach var="i" begin="${number-2 < 0 ? 0 : number-2 }"
					end="${number+2 }">
					<c:if test="${i > 0 && i < totalPages}">
						<li class="${i==number ? 'page-item active': 'page-item' }">
							<a class="page-link" href="<c:url value='/admin/users?page=${i }'/>">${i + 1 }</a>
						</li>
					</c:if>


				</c:forEach>
				<li
					class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
					<a class="page-link"
					href='<c:url value='/admin/users?page=${totalPages }'/>' tabindex="-1">Last</a>
			</ul>
		</nav>
	</c:if>


</section>


