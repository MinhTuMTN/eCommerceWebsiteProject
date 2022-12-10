<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div class="row">
	<div class="container">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>Category ID</th>
					<th>Image</th>
					<th>Name</th>
					<th>Created At</th>
					<th>Updated At</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<tr class="odd gradeX">
					<td>${category.categoryId }</td>
					<td><c:set value="${category.image}" var="imageUrl" /> <c:choose>
							<c:when test="${fn:substring(imageUrl, 0, 4) == 'http' }">
								<c:url value="${category.image}" var="categoryImgUrl"></c:url>

							</c:when>
							<c:otherwise>
								<c:url
									value="/image?fname=${category.image}&fileFolder=Categories"
									var="categoryImgUrl"></c:url>

							</c:otherwise>
						</c:choose> <img src="${categoryImgUrl}" width="100px" alt="${category.name}"></td>
					<td>${category.name}</td>
					<td>${category.createdAt }</td>
					<td>${category.updatedAt }</td>
					<td><c:if test="${category.isDeleted == true}">
							<span>Deleted</span>
						</c:if> <c:if test="${category.isDeleted == false}">
							<span>Active</span>
						</c:if></td>

				</tr>
			</tbody>
		</table>
	</div>
</div>
