<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<div class="row">
	<div class="container">
		<table class="table manage-candidates-top mb-0">
			<thead>
				<tr>
					<th>Store Level ID</th>
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
						<td>${storeLevel.storeLevelId }</td>
						
						<td>${storeLevel.name}</td>
						<td>${storeLevel.discount}</td>
						<td>${storeLevel.minPoint}</td>
						<td>${storeLevel.createdAt}</td>
						<td>${storeLevel.updatedAt}</td>
						
						<td><c:if test="${storeLevel.isDeleted == true}">
								<span>Deleted</span>
							</c:if> <c:if test="${storeLevel.isDeleted == false}">
								<span>Active</span>
							</c:if></td>
					</tr>
			</tbody>
		</table>
		
	</div>
</div>
