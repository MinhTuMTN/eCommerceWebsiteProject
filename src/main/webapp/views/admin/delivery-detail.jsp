<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="row">
	<div class="container">
		<table class="table manage-candidates-top mb-0">
			<thead>
				<tr>
					<th>Delivery Unit ID</th>
					<th>Name</th>
					<th>Price</th>
					<th>Description</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Status</th>
					
				</tr>
			</thead>
			<tbody>
					<tr class="odd gradeX">
						<td>${delivery.deliveryId }</td>
						
						<td>${delivery.name}</td>
						<td>${delivery.price}</td>
						<td>${delivery.description}</td>
						<td>${delivery.createdAt}</td>
						<td>${delivery.updatedAt}</td>
						
						<td><c:if test="${delivery.isDeleted == true}">
								<span>Deleted</span>
							</c:if> <c:if test="${delivery.isDeleted == false}">
								<span>Active</span>
							</c:if></td>
					</tr>
			</tbody>
		</table>
		
	</div>
</div>
