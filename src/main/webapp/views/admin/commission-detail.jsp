<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="row">
	<div class="container">
		<table class="table manage-candidates-top mb-0">
			<thead>
				<tr>
					<th>Commission ID</th>
					<th>Name</th>
					<th>Cost</th>
					<th>Description</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Status</th>
					
				</tr>
			</thead>
			<tbody>
					<tr class="odd gradeX">
						<td>${commission.commissionId }</td>
						
						<td>${commission.name}</td>
						<td>${commission.cost}</td>
						<td>${commission.description}</td>
						<td>${commission.createdAt}</td>
						<td>${commission.updatedAt}</td>
						
						<td><c:if test="${commission.isDeleted == true}">
								<span>Deleted</span>
							</c:if> <c:if test="${commission.isDeleted == false}">
								<span>Active</span>
							</c:if></td>
					</tr>
			</tbody>
		</table>
		
	</div>
</div>
