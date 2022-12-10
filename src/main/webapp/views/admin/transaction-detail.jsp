<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="row">
	<div class="container">
		<table class="table manage-candidates-top mb-0">
			<thead>
				<tr>
					<th>Transaction ID</th>
					<th>User ID</th>
					<th>Store ID</th>
					<th>Amount</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
					<tr class="odd gradeX">
						<td>${transaction.transactionId }</td>
						<td>${transaction.user.userId}</td>
						<td>${transaction.store.storeId }</td>
						<td>${transaction.amount}</td>
						<td>${transaction.createdAt }</td>
						<td>${transaction.updatedAt }</td>
						<td><c:if test="${transaction.isUp == true}">
								<span>Up</span>
							</c:if> <c:if test="${transaction.isUp == false}">
								<span>Not Up</span>
							</c:if></td>
					</tr>
			</tbody>
		</table>
	</div>
</div>