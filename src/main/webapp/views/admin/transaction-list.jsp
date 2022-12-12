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
		<table class="table table-striped table-bordered table-hover"
			style="width: 100%">
			<thead>
				<tr>
					<th>Transaction ID</th>
					<th>User ID</th>
					<th>Amount</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${transactions}" var="transaction">
					<tr class="odd gradeX">
						<td>${transaction.transactionId }</td>

						<td>${transaction.user.userId}</td>
						<td>${transaction.amount}</td>
						<td><c:if test="${transaction.isUp == true}">
								<span>Up</span>
							</c:if> <c:if test="${transaction.isUp == false}">
								<span>Not Up</span>
							</c:if></td>
						<td style="text-align: center;"><a class="btn-buy"
							style="font-size: 1.5rem; margin: 0"
							href="<c:url value="/admin/transaction-detail?transactionId=${transaction.transactionId }"/>"><i
								class="far fa-eye"> Read More</i></a></td>


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
							href='<c:url value='/admin/transactions?filter=${filter }&page=${0 }'/>'
							tabindex="-1">First</a>
						</li>
						<c:forEach var="i" begin="${number-1 < 0 ? 0 : number-1 }"
							end="${number+2 }">
							<c:if test="${i > 0 && i < totalPages}">
								<li class="${i==number ? 'page-item active': 'page-item' }">
									<a class="page-link"
									href="<c:url value='/admin/transactions?filter=${filter }&page=${i }'/>">${i + 1 }</a>
								</li>
							</c:if>


						</c:forEach>
						<li
							class="${totalPages ==(number) ? 'page-item active': 'page-item' }">
							<a class="page-link"
							href='<c:url value='/admin/transactions?filter=${filter }&page=${totalPages }'/>'
							tabindex="-1">Last</a>
					</ul>
				</nav>
			</c:if>

		</div>
	</div>
</div>