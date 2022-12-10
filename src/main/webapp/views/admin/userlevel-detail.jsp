<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="row">
	<div class="container">
		<table class="table manage-candidates-top mb-0">
			<thead>
				<tr>
					<th>User Level ID</th>
					<th>Name</th>
					<th>Discount</th>
					<th>Minium Point</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Status</th>
					
				</tr>
			</thead>
			<tbody>
					<tr class="odd gradeX">
						<td>${userLevel.userLevelId }</td>
						
						<td>${userLevel.name}</td>
						<td>${userLevel.discount}</td>
						<td>${userLevel.minPoint}</td>
						<td>${userLevel.createdAt}</td>
						<td>${userLevel.updatedAt}</td>
						
						<td><c:if test="${userLevel.isDeleted == true}">
								<span>Deleted</span>
							</c:if> <c:if test="${userLevel.isDeleted == false}">
								<span>Active</span>
							</c:if></td>
					</tr>
			</tbody>
		</table>
		
	</div>
</div>
